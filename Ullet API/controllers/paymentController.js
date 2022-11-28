import paymentModel from "../models/paymentModel.js";
import transactionModel from "../models/transactionModel.js";
import userModel from "../models/userModel.js";
import { authenticate } from "../modules/AuthModule.js";

export async function createPayment(req, res) {

    const { shopID, concept, balance } = req.body
    const user = await authenticate(req)

    if (balance < 1) {
        return res.sendStatus(401)
    }

    if (user == null) {
        return res.sendStatus(401)
    }

    const userID = user.userID;
    
    let payment = null
    let transaction = null

    let approved = false
    if (balance < user.balance) {
        approved = true
    }

    try {
        payment = await paymentModel.create({
            shopID,
            concept
        })

        const invoiceID = payment.invoiceID

        transaction = await transactionModel.create({
            userID,
            invoiceID,
            approved,
            balance,
        })

    } catch (error) {
        return res.status(400).json(error.message)
    }

    if (transaction.approved) {

        const newBalance = user.balance - balance;

        await userModel.updateOne({ _id: user._id }, {
            $set: { balance: newBalance }
        })
    }

    res.status(201).json(transaction)
}