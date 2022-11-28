import userModel from "../models/userModel.js";

export async function authenticate(req){

    const header = req.body.header
    const phone = header.phone;
    const pin = header.pin;
    const key = header.key;

    const user = await userModel.findOne({phone})

    if (user == null) return null;
    if (user.phone != phone) return null;
    if (user.pin != pin) return null;
    if (user.key != key) return null;

    return user;

}