// Importamos las librerías necesarias
import * as dotenv from 'dotenv';
import express from 'express';
import { Configuration, OpenAIApi } from 'openai';
import {v4 as uuidv4} from 'uuid';

// Cargamos las variables de entorno
dotenv.config();

const PORT = process.env.PORT || 8080

// Configuramos el servidor
const app = express();

// Configuramos el servidor para que pueda servir archivos estáticos
// app.use(express.static("public"));

// Configuramos el servidor para que pueda recibir JSON
app.use(express.json());

let queries = {}

// Configuramos la API de OpenAI
const configuration = new Configuration({
  apiKey: process.env.OPENAI_API_KEY,
});

// Creamos la instancia de la API
const openai = new OpenAIApi(configuration);

// Funtion to run the completion
async function runCompletion(prompt) {
  const completion = await openai.createChatCompletion({
    model: "gpt-3.5-turbo",
    messages: [{role: "user", content: prompt}],
  });
  return completion.data.choices[0].message.content;
};

// Add a new query
app.post('/queries/:user',async (req, res) => {
  const { user } = req.params;
  const { prompt } = req.body;
  const response = await runCompletion(prompt);
  const uuid = uuidv4();

  queries[uuid] = { user, prompt, response};

  res.send({ queries });
});

// List all queries
app.get('/queries', (req, res) => {
  res.send(Object.values(queries));
});

app.get('/queries/content', (req, res) => {
  const word = req.query.word;
  const filterQueriesByWord = Object.values(queries)
    .filter(c => c.prompt.includes(word));
  res.send(filterQueriesByWord);
});

// List all queries from a user
app.get('/queries/user', (req, res) => {
  const user = req.query.user;
  const filterQueriesByUser = Object.values(queries)
    .filter(c => c.user === user);
  res.send(filterQueriesByUser);
});

// Delete a query
app.delete('/queries/:uuid', (req, res) => {
  const { uuid } = req.params;
  delete queries[uuid];
  res.send({ queries });
});

// Start the server
app.listen(PORT, () => {
  console.log(`Running server on port ${PORT}!`);
})