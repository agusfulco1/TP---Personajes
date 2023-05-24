import { config } from "./../dbconfig.js"
import sql from "mssql"
const {MAX, NVarChar, VARCHAR} = sql

export class personajesService {
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
}

export default personajesService