import mongoose from "mongoose";

const advertisementSchema = new mongoose.Schema({
    user : {type:  mongoose.Schema.Types.ObjectId,ref: 'User', required: true},
    name : {type: String, required: true},
    type : {
        banner : {type: String},
        popup : {type: String},
        link : {type: String},
    },
    title : {type: String, required: true},
    content : {type: String, required: true},
    category : {type: String, required: true},
    price : {type: Number, required: true},
});

export default mongoose.model("Advertisement", advertisementSchema);