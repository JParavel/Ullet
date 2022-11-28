import mongoose from "mongoose";

const transactionModel = mongoose.Schema({
    userID: { type: String, required: [true, "userID is missing"], immutable: true },
    invoiceID: { type: String, required: [true, "invoiceID is missing"], immutable: true },
    createdAt: { type: Date, default: Date.now, immutable: true },
    approved: { type: Boolean, default: true, immutable: true },
    balance: { type: Number, required: [true, "balance field is missing"], immutable: true }
})

export default mongoose.model("transactions", transactionModel)