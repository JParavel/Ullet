import mongoose from "mongoose";
import genKey from "../utils/keyGen.js";

const paymentModel = mongoose.Schema({

    invoiceID: { type: String, default: genKey(10), immutable: true },
    shopID: {type:String, required:[true, "shopID field is missing"], immutable: true},
    concept: {type:String, immutable: true}

})

export default mongoose.model("payments", paymentModel)