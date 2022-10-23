const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
    name:{
        type: String,
        required: true
    },
    phone:{
        type: String,
        required: true
    },
    address:[{
        type: mongoose.Schema.Types.ObjectId,
        ref:'Address',
        required: true
    }],
    // orderHistory:{
        
    // },
    email:{
        type: String,
        required: true
    },
    orderHistory:[{
        type: mongoose.Schema.Types.ObjectId,
        ref:'Order',
    }],
});

exports.User = mongoose.model('User', userSchema);