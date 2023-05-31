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
                                .query('INSERT INTO Pizzas (Imagen, Nombre, Edad, Peso, Historia) VALUES (@pImagen, @pNombre, @pEdad, @pPeso, @pHistoria)')
            
        }
        catch (error) {
            console.log(error);
        }
    }
}

export default personajesService