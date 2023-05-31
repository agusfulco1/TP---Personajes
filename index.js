import express from "express"
import personajesService from "./src/services/personajes-services.js";
const app = express();
const port = 3000;

app.get('/characters', async (req,res) => {
    const personajes = await personajesService.getAll()
    res.status(200).send(personajes)
})

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})