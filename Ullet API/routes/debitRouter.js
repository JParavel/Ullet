import express from "express"
import { createDebit } from "../controllers/debitController.js";

const router = express.Router();

//CREATE

router.post("/", (req, res) => {
    createDebit(req, res)
})

export default router;