const fs = require('fs');
const path = require('path');
const util = require('util');

const readdir = util.promisify(fs.readdir);
const stat = util.promisify(fs.stat);

const direcSearch = async (direc) => {
    try {
        const files = await readdir(direc);
        for (const file of files) {
            const filePath = path.join(direc, file);
            const fileStat = await stat(filePath);
            if (fileStat.isDirectory()) {
                direcSearch(filePath);
            } else if (path.extname(filePath) === '.js') {
                console.log(filePath);
            }
        }
    } catch (err) {
        console.error(err);
    }
}

direcSearch('test');