const express = require('express');
const bodyParser = require('body-parser');
const axios = require('axios');
const dotenv=require("dotenv")

dotenv.config()
const app = express();

const URL= process.env.BACKEND_URL || "http://localhost:5000"
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));

app.get('/', (req, res) => {
    res.render('form');
});

app.post('/submit', async (req, res) => {
    try {
        const response = await axios.post(`${URL}/submit`, req.body);
        res.send(`Flask Response: ${response.data.message}`);
    } catch (err) {
        res.status(500).send('Error connecting to Flask backend.');
    }
});


// listen on a port
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Frontend running on http://localhost:${PORT}`);
});
