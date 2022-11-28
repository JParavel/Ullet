import paymentModel from "../models/paymentModel.js";
import transactionModel from "../models/transactionModel.js";
import userModel from "../models/userModel.js";
import { authenticate } from "../modules/AuthModule.js";

export async function createPayment(req, res) {

    const { shopID, concept, balance } = req.body
    const user = await authenticate(req)

    if (user == null) {
        return res.sendStatus(401)
    }

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

        transaction = await transactionModel.create({
            userID: user.userID,
            invoiceID: payment.invoiceID,
            approved,
            balance
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

    res.sendStatus(201)
}