import { config } from "../../dbconfig.js"
import sql from "mssql"

export class PeliculasServices{
    static getAll = async() => {
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                                .query('SELECT Id,Titulo,Imagen FROM PeliculaSerie')
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
                            .query('DELETE FROM PeliculaSerie WHERE Id = @pId')
        } 
        catch (error) {
            console.log(error);
        }   
    }
    static insert = async(pelicula) => {
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                                .input('pImagen', pelicula.Imagen)
                                .input('pTitulo', pelicula.Titulo)
                                .input('pFechaCreacion', pelicula.FechaCreacion)
                                .input('pCalificacion', pelicula.Calificacion)
                                .query('INSERT INTO PeliculaSerie (Imagen, Titulo, FechaCreacion, Calificacion) VALUES (@pImagen, @pTitulo, @pFechaCreacion, @pCalificacion)')
            
        }
        catch (error) {
            console.log(error);
        }
    }
    static update = async(pelicula) => {
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                                .input('pId', sql.Int, pelicula.Id)
                                .input('pImagen', pelicula.Imagen)
                                .input('pTitulo', pelicula.Titulo)
                                .input('pFechaCreacion', pelicula.FechaCreacion)
                                .input('pCalificacion', pelicula.Calificacion)
                                .query('UPDATE PeliculaSerie SET Imagen=@pImagen, Titulo=@pTitulo, FechaCreacion=@pFechaCreacion, Calificacion=@pCalificacion WHERE Id = @pId')
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
                                .query('SELECT PS.*, P.Nombre AS NombrePersonaje FROM PeliculaSerie PS INNER JOIN PeliculaxPersonaje PP ON PP.idPelicula = PS.Id INNER JOIN Personaje P ON P.Id = PP.idPersonaje WHERE PS.Id = @pId')
            return result.recordsets[0];
        }
        catch (error) {
            console.log(error)
        }
    }
    static getByParam = async(params) => {
        try {
            let pool = await sql.connect(config);
            let result;
            if (params.order == 'A') {
                result = await pool.request()
                                .input('pNombre', params.name)
                                .query('SELECT PS.* FROM PeliculaSerie PS WHERE PS.Titulo = @pNombre ORDER BY PS.FechaCreacion ASC')
            }
            else {
                result = await pool.request()
                                .input('pNombre', params.name)
                                .query('SELECT PS.* FROM PeliculaSerie PS WHERE PS.Titulo = @pNombre ORDER BY PS.FechaCreacion DESC')
            }
            return result.recordsets[0]
        }
        catch (error) {
            console.log(error)
        }
    }
}
export default PeliculasServices;