import express from "express";
import mongoose, { connect } from "mongoose";
import Advertisement from "./models/Advertisement.js";
import Admin from "./models/Admin.js";
import User from "./models/User.js";
import Web from "./models/Web.js";
import * as dotenv from "dotenv";

const PORT = process.env.PORT || 8080;

// Cargamos las variables de entorno
dotenv.config();

await mongoose.connect(process.env.MONGO_URL)

const db = mongoose.connection;
db.on("error", console.error.bind(console, "Error de conexión:"));
db.once("open", function () {
  console.log("Conexión exitosa a la base de datos");
});

// Configuramos el servidor
const app = express();
app.use(express.json());

// Rutas
// Rutas de Usuarios
app.get("/users", async (req, res) => {
  const users = await User.find();
  if (users == null) {
    return res.status(404).json({ message: "Users not found" });
  } else {
    res.send(users);
  }
});

app.get("/users/:id", async (req, res) => {
  const cliente = await User.findById(req.params.id);
  if (cliente == null) {
    return res.status(404).json({ message: "User not found" });
  } else {
    res.send({ message: "User found", cliente });
  }
});

app.post("/users", async (req, res) => {
  const user = new User({
    name: req.body.name,
    email: req.body.email,
    phone: req.body.phone,
    address: req.body.address,
  });
  try {
    const newUser = await user.save();
    res.status(201).json(newUser);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

app.delete("/users/:id", async (req, res) => {
  const cliente = await User.findByIdAndDelete(req.params.id);
  if (cliente == null) {
    return res.status(404).json({ message: "User not found" });
  } else {
    res.json({ message: "User deleted", cliente });
  }
});

app.put("/users/:id", async (req, res) => {
  const user = await User.findByIdAndUpdate(req.params.id, req.body);
  if (user == null) {
    return res.status(404).json({ message: "User not found" });
  } else {
    res.json({ message: "User updated", user });
  }
});

app.get("/")

app.listen(PORT, () => {
  console.log(`Example app listening on port ${process.env.PORT}!`);
});
