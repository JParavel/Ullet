import mongoose from "mongoose";
import genKey from "../utils/keyGen.js";

const userModel = mongoose.Schema({

    userID: {type: String, default: genKey(10), immutable:true},
    firstName: {type: String, required:[true, "firstName field is missing"]},
    lastName: {type: String, required:[true, "lastName field is missing"]},
    email: { type: String, required:[true, "email field is missing"], unique: [true, "email already exist"] },
    phone: { type: String, required:[true, "phone field is missing"], unique: [true, "phone already exist"] },
    pin: { type: Number, required:[true, "must submit a pin"]},
    key: { type: String, default: genKey(20), immutable: true },
    balance: {type: Number, default: 0},
    active: { type: Boolean, default: true }

})

export default mongoose.model("users", userModel)