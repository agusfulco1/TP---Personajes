import express from "express"
import personajesService from "./src/services/personajes-services.js";
const app = express();
const port = 3000;
app.use(express.json());
app.use(express.urlencoded({ extended: true }));


app.get('/characters', async (req,res) => {
    const personajes = await personajesService.getAll()
    res.status(200).send(personajes)
})
app.delete('/characters/:id', async (req,res) => {
    try {
        await personajesService.deleteByID(req.params.id)
        res.status(200).json({ message: 'Personaje borrado'})
    } catch (error) {
        console.log(error);
        res.status(500).json({ message: 'Fallo el delete'})
    }
})
app.post('/characters',async (req, res) => {    
    try {
        await personajesService.insert(req.body)
        res.status(200).json({ message: 'Personaje creado' })
    } catch (error) {
        console.error(error);
        res.status(500).json({error: 'Fallo el insert' })
    }
})
app.put('/characters', async (req, res) => {
    try {
        await personajesService.update(req.body)
        res.status(200).json({ message: 'Personaje actualizado'})
    } catch (error) {
        console.error(error);
        res.status(500).json({error: 'Fallo el insert'})
    }
})
app.get('/characters/:id', async (req, res) => {
    const pizza = await personajesService.getById(req.params.id)
    if (!pizza) {
        res.status(200).send("No existe esa pizza")
    }
    res.status(200).send(pizza)
    
})
app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})