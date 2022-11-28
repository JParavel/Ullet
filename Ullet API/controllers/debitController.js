import debitModel from "../models/debitModel.js";
import transactionModel from "../models/transactionModel.js";
import userModel from "../models/userModel.js";
import { authenticateAdmin } from "../modules/AuthModule.js";

export async function createDebit(req, res){


    const {phone, balance} = req.body
    const admin = await authenticateAdmin(req)

    if (admin == null) {
        return res.sendStatus(401)
    }

    const user = await userModel.findOne({phone});

    if (user == null) {
        return res.sendStatus(401)
    }

    const userID = user.userID;

    let debit = null;
    let transaction = null

    try {
        debit = await debitModel.create({})

        const invoiceID = debit.invoiceID;
        
        transaction = await transactionModel.create({
            userID,
            invoiceID,
            approved:true,
            balance,
        })
        
    } catch (error) {
        return res.status(400).json(error)
    }

    const newBalance = user.balance + balance;

    await userModel.updateOne({_id:user._id}, {
        $set:{balance:newBalance}
    })

    res.status(201).json(transaction)
    

}