import { pool } from "../database/connection.js";

import ApiResponse from '../models/ApiResponse.js';

export const getMensajesProgramadosActivos = async (req, res) => {
    const { mes, idcliente } = req.query;

    if (!mes) {
        return res.status(400).json({ message: 'Bad Request. Los parámetros son requeridos.' });
    }

    try {
        let consulta = `
        select m.idMensaje, m.fechaHoraEnvio, m.mensaje, 
        case 
        WHEN m.estadoEnvio = 1 THEN 'Pendiente' 
        WHEN m.estadoEnvio = 2 THEN 'Enviado' 
        WHEN m.estadoEnvio = 3 THEN 'Error' 
        ELSE 'Desconocido' END AS estadoDescripcion, cl.nombre as cliente from mensaje m INNER JOIN 
        campania c ON DATE(c.fechaHoraProgramacion) = DATE(m.fechaHoraEnvio) INNER JOIN
        usuario u ON c.idUsuario = u.idUsuario INNER JOIN 
        cliente cl ON u.idCliente = cl.idCliente 
        WHERE m.estado = 1 AND c.estado = 1 AND MONTH(m.fechaHoraEnvio) = ?`;

        if (idcliente && idcliente.trim() !== '') {
            consulta += ` AND cl.idCliente = ${idcliente}`;
        }

        const params = [convertirNombreMesANumero(mes)];

        const result = await pool.query(consulta, params);

        return res.json(ApiResponse.success("ok", result[0]));
    } catch (error) {
        const response = new ApiResponse.error(error.message);
        return res.status(500).json(response);
    }

}

export const crearCampania = async (req, res) => {
    const { idCampania, nombre, idUsuario, fechaHoraProgramacion } = req.body;

    if (!idCampania || !nombre || !idUsuario || !fechaHoraProgramacion) {
        return res.status(400).json({ message: 'Bad Request. Los parámetros son requeridos.' });
    }

    try {
        let consulta = `insert into campania
        (idCampania, nombre, idUsuario, fechaHoraProgramacion, estado) VALUES (?,?,?,?,?)`;

        const params = [
            idCampania,
            nombre,
            idUsuario,
            fechaHoraProgramacion,
            1
        ];

        const result = await pool.query(consulta, params);

        return res.json(ApiResponse.success("creado con exito", result[0]));

    } catch (error) {
        console.log(error)
        const response = ApiResponse.error(error.message);
        return res.status(500).json(response);
    }
}

function convertirNombreMesANumero(nombreMes) {
    if (!nombreMes) return null;

    const nombre = nombreMes.toLowerCase().trim();

    // Mapa completo de nombres de mes a números
    const mapaMeses = {
        // Español completo
        'enero': 1,
        'febrero': 2,
        'marzo': 3,
        'abril': 4,
        'mayo': 5,
        'junio': 6,
        'julio': 7,
        'agosto': 8,
        'septiembre': 9,
        'octubre': 10,
        'noviembre': 11,
        'diciembre': 12
    }

    return mapaMeses[nombre] || null;
}