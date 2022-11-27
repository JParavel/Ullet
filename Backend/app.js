import express from "express"
import userRouter from "./routers/userRouter.js";

let app = express();

app.listen(3000, function(){
    console.log("Server is running on port 3000");
})

app.use(express.json());
app.use("/users", userRouter)