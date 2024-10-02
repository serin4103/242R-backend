const express = require('express');
const port = 3000;
const app = express();

app.get('/board/page/:page', (req, res) => {
    const pageNum = req.params.page;
    res.send(`This is page #${pageNum}`);
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));