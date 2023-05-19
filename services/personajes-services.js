import config from "./../dbconfig"
import sql from "mssql"
const {MAX, NVarChar, VARCHAR} = sql

export class personajesService {
    static getAll = async() => {
        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                                .query('SELECT * FROM Pizzas')
            return result.recordsets[0];
        }
        catch (error) {
            console.log(error)
        }
    }
}