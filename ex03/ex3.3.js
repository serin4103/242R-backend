const express = require('express');
const app = express();
const port = 3000;

const factorial = (n) => {
    if (n === 0) {
        return 1;
    }
    return n * factorial(n - 1);
};

// Route to handle GET /factorial and redirect to GET /factorial/:number
app.get('/factorial', (req, res) => {
    const number = req.query.number;
    if (number) {
        res.redirect(`/factorial/${number}`);
    } else {
        res.status(400).send('Number query parameter is required');
    }
});

// Route to handle GET /factorial/:number
app.get('/factorial/:number', (req, res) => {
    const number = req.params.number;
    if (!isNaN(number)) {
        res.send(factorial(parseInt(number, 10)).toString());
    } else {
        res.status(400).send('Invalid number');
    }
});

app.listen(port, () => {
    console.log(`Server listening on port ${port}`);
});