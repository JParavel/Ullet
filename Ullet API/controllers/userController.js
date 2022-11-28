import userModel from "../models/userModel.js";
import { authenticate } from "../modules/AuthModule.js";

//CREATE
export async function createUser(req, res){

    let user = null;

    try {
        user = await userModel.create(req.body)
    } catch (error) {
        res.status(400).json(error.message)
    }

    res.status(201).json(user)
}

//READ
export async function readUser(req, res){

    const user = await authenticate(req)

    if(user == null) return res.status(401).json({
        message: "unvalid header"
    })

    res.status(200).json(user)

}

//UPDATE
export async function updateUser(req, res){

    let user = await authenticate(req)

    if(user == null) return res.status(401).json({
        message: "unvalid header"
    })

    const phone = user.phone
    const field = req.body.field
    const value = req.body.value

    await userModel.updateOne({phone},{
        $set:{[field]:value}
    })

    res.sendStatus(200)
}

//DELETE
export async function deleteUser(req, res){

    const user = await authenticate(req)

    if(user == null) return res.status(401).json({
        message: "unvalid header"
    })

    await userModel.updateOne(user,{
        $set:{active:value}
    })

    res.sendStatus(200)
}