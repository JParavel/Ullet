import express from "express"
import { createPayment } from "../controllers/paymentController.js";

const router = express.Router()

router.post("/", (req, res) => {
    createPayment(req, res)
})

export default router;