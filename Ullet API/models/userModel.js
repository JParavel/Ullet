import mongoose from "mongoose";
import genKey from "../utils/keyGen.js";

const userModel = mongoose.Schema({
    "first name":{
        type:String,
        required: [true, "need to retrive a first name"]
    },
    "last name":{
        type:String,
        required: [true, "need to retrive a last name"]
    },
    email:{
        type:String,
        required: true,
        unique: [true, "need to retrive an email"]
    },
    phone:{
        type:String,
        required: [true, "need to retrive a phone number"]
    },
    pin:{
        type: Number,
        required: [true, "need to retrive an access pin"]
    },
    "active":{
        type: Boolean,
        default: true
    },
    key:{
        type: String,
        default: genKey(20),
        set: v => genKey(20)
    }
})

export default mongoose.model("users", userModel)