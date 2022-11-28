import adminModel from "../models/adminModel.js";
import userModel from "../models/userModel.js";

export async function authenticate(req){

    const header = req.body.header

    if(!header) return null;

    const {phone, pin, key} = req.body.header

    const user = await userModel.findOne({phone})

    if (user == null) return null;
    if (user.pin != pin) return null;
    if (user.key != key) return null;

    return user;

}

export async function authenticateAdmin(req){
    const header = req.body.header

    if(!header) return null;

    const {email, phone, pin, key} = req.body.header

    const admin = await adminModel.findOne({email})

    if (admin == null) return null;
    if (admin.phone != phone) return null;
    if (admin.pin != pin) return null;
    if (admin.key != key) return null;

    return admin

}