//Importing the dependencies
const express = require("express");
const cors = require("cors");
const app = express();
const mongoose = require("mongoose");
require('dotenv/config');
const Razorpay = require('razorpay');
const ejs = require("ejs");




//middleware
app.use(cors());
app.options('*', cors())
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.set("view engine", "ejs");
//routes
const userRoutes = require('./routes/users.route');
const paymentRoutes = require('./routes/payments.route');
const orderRoutes = require('./routes/orders.route');
const categoryRoutes = require('./routes/category.route')
const productRoutes = require("./routes/product.route");

const api = process.env.API_URL;
const PORT = process.env.PORT||8080;



//Database
//We are using MongoDB
//Checking the connection with the Database
mongoose.connect(process.env.DB_CONNECTION_STRING, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
//If the connection with the database is true
//then it will print that the Database connection is ready
.then(()=>{
  console.log('Database Connection is ready...')
})
//If the connection with the is not true
//then it will catch the error and show the output on the terminal
.catch((err)=> {
  console.log(err);
})


// simple route
app.get("/", (req, res) => {
  res.json({ message: "Welcome to fresp" });
});

app.use(`${api}/user`, userRoutes);
app.use(`${api}/order`, orderRoutes);
app.use(`${api}/payment`, paymentRoutes);
app.use(`${api}/category`, categoryRoutes);
app.use(`${api}/product`, productRoutes);

// set port, listen for requests
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});