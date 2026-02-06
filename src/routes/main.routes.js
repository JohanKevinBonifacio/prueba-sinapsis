import { Router } from "express";
import { crearCampania, getMensajesProgramadosActivos } from "../controllers/main.controller.js";

const router = Router();

router.get('/getMensajesProgramadosActivos', getMensajesProgramadosActivos)
router.post('/crearCampania', crearCampania)

export default router