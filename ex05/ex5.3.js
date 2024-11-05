const express = require('express');
const { runQuery } = require('./ex5.3_db');

const app = express();
const port = 3000;

app.get('/fare', async (req, res) => {
    try{
        const { uid } = req.query;
        const sql = 'SELECT `users`.`id` AS `uid`, `users`.`name` AS `name`, SUM(ROUND((`types`.`fare_rate`*.001)*(`trains`.`distance`), -2)) AS `total` ' +
            'FROM `tickets` ' +
            'INNER JOIN `users` ON `tickets`.`user`=`users`.`id` ' +
            'INNER JOIN `trains` ON `tickets`.`train`=`trains`.`id` ' +
            'INNER JOIN `types` ON `trains`.`type`=`types`.`id` ' +
            'WHERE `users`.`id` = ? ' +
            'GROUP BY `users`.`id`';
        const result = await runQuery(sql, [uid]);
        res.send(`Total fare of ${result[0].name} is ${result[0].total} KRW.`);
    }
    catch(e){
        console.error(e);
        res.status(500).send('Internal Server Error');
    }
});

app.get('/train/status', async (req, res) => {
    try {
        const { tid } = req.query;
        const sql = 'SELECT `trains`.`id` AS `tid`, `types`.`max_seats` AS `max_seat`, COUNT(`tickets`.`id`) AS `occupied`' +
            'FROM `trains` ' + 
            'INNER JOIN `types` ON `trains`.`type`=`types`.`id` ' +
            'LEFT JOIN `tickets` ON `trains`.`id`=`tickets`.`train` ' + 
            'WHERE `trains`.`id` = ?' +
            'GROUP BY `trains`.`id`';
        const result = await runQuery(sql, [tid]);
        const is_sold_out = result[0].max_seat == result[0].occupied;
        res.send(`Train ${result[0].tid} is ${is_sold_out ? 'sold out' : 'not sold out'}.`);
    }
    catch(e){
        console.error(e);
        res.status(500).send('Internal Server Error');
    }
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));