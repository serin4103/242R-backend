const express = require('express');
const port = 3000;
const app = express();
app.use(express.urlencoded({ extended: true }));

app.get('/', (req, res) => {
    const obj = req.query;
    res.send(Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('<br>'));
});

app.post('/', (req, res) => {
    const obj = req.body;
    res.send(Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('<br>'));
});

app.put('/', (req, res) => {
    const obj = req.body;
    res.send(Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('<br>'));
});

app.delete('/', (req, res) => {
    const obj = req.body;
    res.send(Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('<br>'));
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));