const express = require('express');
const port = 3000;
const app = express();
app.set('views', `${__dirname}`);
app.set('view engine', 'pug');
app.use(express.urlencoded({ extended: true }));

app.get('/', (req, res) => res.render('index.pug'));

app.post('/login', (req, res) => {
    const username = req.body.username;
    const password = req.body.password;
    res.send(`
        username: ${username} <br>
        password: ${password}`);
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));