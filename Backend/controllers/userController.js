import mongoose from "mongoose";
import RequestLogger from "./requestLogger.js"
import userSchema from "../schemas/userSchema.js";

//CREATE user
export function createUser(req, res){

    //Verify information
    const user = new userSchema(req.body.user);

    //Verify ip
    const logger = new RequestLogger()
    const request = "post/users/new"
    const ip = req.ip
    const count = logger.getRequestCountIP(request, ip)

    if (count >= 5) {
        res.sendStatus(429)
    }

    res.send("Usuario Creado. SOLICITUDES: " + (count + 1))


    //Crear el usuario en el cuerpo

    logger.addIPLog(request, ip)
}
//READ user
export function readUser(req, res){

}

//UPDATE user
export function updateUser(req, res){

}

//DELETE user
export function deleteUser(req, res){

}