import app from "../src/app";
import request from 'supertest';

describe('GET /getMensajesProgramadosActivos', () => {
    test("validar estado", async () => {
        const response = await request(app).get("/getMensajesProgramadosActivos?mes=enero&idcliente=1").send();
        expect(response.statusCode).toBe(200);
    });
});

describe('POST /crearCampania', () => {
    test("validar datos", async () => {
        const campaignData = {
            idCampania: 1015,
            nombre: "PRUEBAS UNITARIAS",
            idUsuario: 101,
            fechaHoraProgramacion: "2024-01-10T19:36:00.000"
        };

        const response = await request(app).post("/crearCampania").send(campaignData);
        console.log(response)
        expect(response.statusCode).toBe(200);
    });
});