import express from "express"
import personajesService from "./src/services/personajes-services.js";
import PeliculasService from "./src/services/peliculas-services.js";
const app = express();
const port = 3000;
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

//Personajes CRUD
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
app.get('/charactersByParams/:name?/:age?/:peso?/:movies?', async (req, res) => {
    //Muy dificil hacer que los parametros sean opcionales: ponerlos en orden de nombre, edad, peso y pelicula.
    let parametros = [];
    if (req.params.name != undefined) {
        parametros.push(req.params.name)
    }
    if (req.params.age != undefined) {
        parametros.push(req.params.age)
    }
    if (req.params.peso != undefined)
    {
        parametros.push(req.params.peso)
    }
    if (req.params.movies != undefined)
    {
        parametros.push(req.params.movies)
    }
    if (parametros == "") {
        res.status(200).send("No hay parametros")
    }
    console.log(parametros)
    const pelicula = await personajesService.getByParam(parametros)
    if (!pelicula) {
        res.status(200).send("No existe esa pelicula")
    }
    
})
app.get('/characters/:id', async (req, res) => {
    const pelicula = await personajesService.getByID(req.params.id)
    if (!pelicula) {
        res.status(200).send("No existe esa pelicula")
    }
    res.status(200).send(pelicula)
    
})
//Peliculas CRUD
app.get('/movies', async (req,res) => {
    const peliculas = await PeliculasService.getAll()
    res.status(200).send(peliculas)
})
app.delete('/movies/:id', async (req,res) => {
    try {
        await PeliculasService.deleteByID(req.params.id)
        res.status(200).json({ message: 'Pelicula borrada'})
    } catch (error) {
        console.log(error);
        res.status(500).json({ message: 'Fallo el delete'})
    }
})
app.post('/movies',async (req, res) => {    
    try {
        await PeliculasService.insert(req.body)
        res.status(200).json({ message: 'Pelicula creada' })
    } catch (error) {
        console.error(error);
        res.status(500).json({error: 'Fallo el insert' })
    }
})
app.put('/movies', async (req, res) => {
    try {
        await PeliculasService.update(req.body)
        res.status(200).json({ message: 'Pelicula actualizada'})
    } catch (error) {
        console.error(error);
        res.status(500).json({error: 'Fallo el insert'})
    }
})
app.get('/movies/:id', async (req, res) => {
    const pelicula = await PeliculasService.getByID(req.params.id)
    if (!pelicula) {
        res.status(200).send("No existe esa pelicula")
    }
    res.status(200).send(pelicula)
    
})
app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})