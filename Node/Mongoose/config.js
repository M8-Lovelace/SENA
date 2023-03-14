import mongoose from "mongoose";
import * as dotenv from "dotenv";

dotenv.config();

const dbConnection = async () => {
  try {
    await mongoose.connect(process.env.MONGO_URL);
    console.log("Conectado a la base de datos");
  } catch {
    console.log("Mala mia");
  }
};

export default dbConnection;
