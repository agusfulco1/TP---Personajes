import { config } from "../../dbconfig.js"
import sql from "mssql"

export class personajesService {
    static getAll = async() => {
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                                .query('SELECT Id,Nombre,Imagen FROM Personaje')
            return result.recordsets[0];
        }
        catch (error) {
            console.log(error)
        }
    }
    static deleteByID = async(id) => {
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                            .input('pId', sql.Int, id)
                            .query('DELETE FROM Personaje WHERE Id = @pId')
        } 
        catch (error) {
            console.log(error);
        }   
    }
    static insert = async(personaje) => {
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                                .input('pImagen', personaje.Imagen)
                                .input('pNombre', personaje.Nombre)
                                .input('pEdad', personaje.Edad)
                                .input('pPeso', personaje.Peso)
                                .input('pHistoria', personaje.Historia)
                                .query('INSERT INTO Personaje (Imagen, Nombre, Edad, Peso, Historia) VALUES (@pImagen, @pNombre, @pEdad, @pPeso, @pHistoria)')
            
        }
        catch (error) {
            console.log(error);
        }
    }
    static update = async(personaje) => {
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                                .input('pId', personaje.Id)
                                .input('pImagen', personaje.Imagen)
                                .input('pNombre', personaje.Nombre)
                                .input('pEdad', personaje.Edad)
                                .input('pPeso', personaje.Peso)
                                .input('pHistoria', personaje.Historia)
                                .query('UPDATE Personaje SET Imagen=@pImagen, Nombre=@pNombre, Edad=@pEdad, Peso=@pPeso, Historia=@pHistoria WHERE Id = @pId')
            console.log(result)
        }
        catch (error) {
            console.log(error);
        }
    }
    static getByID = async(id) => {
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                                .input('pId', sql.Int, id)
                                .query('SELECT P.*, Titulo FROM Personaje P INNER JOIN PeliculaxPersonaje PP ON PP.idPersonaje = P.Id INNER JOIN PeliculaSerie PS ON PS.Id = PP.idPelicula WHERE P.Id = @pId')
            return result.recordsets[0];
        }
        catch (error) {
            console.log(error)
        }
    }
    static getByParam = async(params) => {
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                                .input('pNombre', params.name)
                                .input('pEdad', params.age)
                                .input('pPeso', params.peso)
                                .input('pTitulo', params.movies)
                                .query('SELECT P.*, Titulo FROM Personaje P INNER JOIN PeliculaxPersonaje PP ON PP.idPersonaje = P.Id INNER JOIN PeliculaSerie PS ON PS.Id = PP.idPelicula WHERE P.Nombre = @pNombre OR P.Edad = @pEdad OR Peso = @pPeso OR PS.Titulo = @pTitulo')
            return result.recordsets[0]
        }
        catch (error) {
            console.log(error)
        }
    }
}

export default personajesService