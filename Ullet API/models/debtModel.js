import mongoose from "mongoose";
import genKey from "../utils/keyGen.js";

const debtModel = mongoose.Schema({

    invoiceID: { type: String, default: genKey(10), immutable: true },
    placeID: {type:String, required:[true, "shopID field is missing"], immutable: true},
    concept: {type:String, immutable: true},
    bank: {type:String, required:[true, "bank field is missing"], immutable: true}

})

export default mongoose.model("debts", debtModel)