import express from "express"
import mongoose from "mongoose";
import router from "./routes/userRouter.js";

const app = express();

const port = 3000;
const user = "ullet";
const password = "ullet";
const host = "ulletcluster.0o8r4qw.mongodb.net";
const database = "ullet";

app.listen(3000, ()=>{
    console.log("Server running on port "+ port);
})

mongoose.connect(`mongodb+srv://${user}:${password}@${host}/${database}?retryWrites=true&w=majority`)

app.use(express.json())
app.use("/user", router)
