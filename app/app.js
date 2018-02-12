const express = require('express')
const app = express()

app.get('/', (req, res) => res.send('Yo son, World!'))

app.listen(8080, () => console.log('Example app is on port 8080!'))
