import express from "express";
import RequestLogger from "../controllers/requestLogger.js";
import { createUser, deleteUser, readUser, updateUser } from "../controllers/userController.js";

let router = express.Router();

// ./users/..
router.post("/new", (req, res) => {
    createUser();
})

router.get("/:telefono", (req, res) => {
    readUser();
})

router.patch("/:id/:field", (req, res) => {
    updateUser();
})

router.delete("/:id", (req, res) => {
    deleteUser();
})

export default router;