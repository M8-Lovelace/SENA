import mongoose from "mongoose";

const webSchema = new mongoose.Schema({
    advertisement : {type:  mongoose.Schema.Types.ObjectId,ref: 'Advertisement', required: true},
    name : {type: String, required: true},
    topic : {type: String, required: true},
    Url : {type: String, required: true},
    dateInit : {type: Date, default: Date.now},
    dateEnd : {type: Date, required: true},
});

export default mongoose.model("Web", webSchema);