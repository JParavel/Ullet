import transactionModel from "../models/transactionModel.js";

export async function createTransaction(userID, invoiceID, approved, balance) {

    transaction = await transactionModel.create({
        userID,
        invoiceID,
        approved,
        balance,
    })
    
}