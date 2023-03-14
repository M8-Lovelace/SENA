import mongoose from "mongoose";

const sesionSchema = new mongoose.Schema({
    admin : {type:  mongoose.Schema.Types.ObjectId,ref: 'Admin', required: true},
});

export default mongoose.model("Admin",adminSchema)