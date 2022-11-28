import express from "express"
import { createUser, deleteUser, readUser, updateUser } from "../controllers/userController.js"

const router = express.Router()

router.post("/new", (req, res) =>{
    createUser(req, res)
})
router.get("/", (req, res) => {
    readUser(req, res)
})
router.patch("/", (req, res) => {
    updateUser(req, res)
})
router.delete("/", (req, res) => {
    deleteUser(req, res)
})

export default router