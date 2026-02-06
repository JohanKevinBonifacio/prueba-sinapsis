import { createPool } from "mysql2/promise";
import config from "../config.js";

export const pool = createPool({
    host: config.myHost,
    user: config.myUser,
    password: config.myPassword,
    port: config.myPort,
    database: config.myDatabase
})