import userModel from "../models/userModel.js";
import { authenticate } from "../modules/AuthModule.js";

//CREATE
export async function createUser(req, res) {

    const { firstName, lastName, phone, email, pin } = req.body
    let user = null

    try {
        user = await userModel.create({
            firstName,
            lastName,
            phone,
            email,
            pin
        })
    } catch (error) {
        res.status(400).json(error.message)
        return;
    }

    res.status(201).json(user)
}

//READ
export async function readUser(req, res) {

    const user = await authenticate(req)

    if (user == null) return res.status(401).json({
        message: "unvalid header"
    })

    res.status(200).json(user)

}

const validFields = ["firstName","lastName","email","phone","pin"]

//UPDATE
export async function updateUser(req, res) {

    //REMEMBER TO MODIFY THIS SHIT

    const field = req.body.field
    const value = req.body.value

    if (!validFields.includes(field)) {
        res.sendStatus(401)
        return
    }

    let user = await authenticate(req)

    if (user == null) return res.status(401).json({
        message: "unvalid header"
    })

    const _id = user._id

    try {
        await userModel.updateOne({ _id }, {
            $set: { [field]: value }
        })
    } catch (error) {
        res.status(400).json(error.message)
        return
    }

    res.sendStatus(200)
}

//DELETE
export async function deleteUser(req, res) {

    const user = await authenticate(req)

    if (user == null) return res.status(401).json({
        message: "unvalid header"
    })

    await userModel.updateOne(user, {
        $set: { active: value }
    })

    res.sendStatus(200)
}