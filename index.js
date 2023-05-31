import express from "express"
import personajesService from "./src/services/personajes-services.js";
const app = express();
const port = 3000;

app.get('/characters', async (req,res) => {
    const personajes = await personajesService.getAll()
    res.status(200).send(personajes)
})
app.delete('/characters/:id', async (req,res) => {
    try {
        console.log(req.params.id)
        await personajesService.deleteByID(req.params.id)
        res.status(200).json({ message: 'Personaje borrada'})
    } catch (error) {
        console.log(error);
        res.status(500).json({ message: 'Fallo el delete'})
    }
})
app.post('/characters',async (req, res) => {    
    try {
        await personajesService.insert(req.body)
        res.status(200).json({ message: 'Personaje creada' })
    } catch (error) {
        console.error(error);
        res.status(500).json({error: 'Fallo el insert' })
    }
})
app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})