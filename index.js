import express from "express"

const app = express();
const port = 3000;

app.get('/characters', (req,res) => {
    const personajes = await 
    res.status(200).send(personajes)
})

app.listen(port, () => {
    
})