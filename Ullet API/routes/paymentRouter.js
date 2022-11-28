import express from "express"
import { createPayment } from "../controllers/paymentController.js";

const router = express.Router()

router.put("/", (req, res) => {
    createPayment(req, res)
})

export default router;