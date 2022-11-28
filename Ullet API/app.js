import express from "express"
import mongoose from "mongoose";
import paymentRouter from "./routes/paymentRouter.js";
import userRouter from "./routes/userRouter.js";

const app = express();

const port = 8080;
const user = "ullet";
const password = "ullet";
const host = "ulletcluster.0o8r4qw.mongodb.net";
const database = "ullet";

app.listen(port, ()=>{
    console.log("Server running on port "+ port);
})

mongoose.connect(`mongodb+srv://${user}:${password}@${host}/${database}?retryWrites=true&w=majority`)

app.use(express.json())
app.use("/user", userRouter)
app.use("/payment", paymentRouter)
app.use("/", (req, res)=>{
    res.json("💵 Bienvenido a Ullet API 💵")
})
