import express from 'express';
import cors from 'cors';
import config from './config.js';

import mainRoute from './routes/main.routes.js'
import swaggerUI from 'swagger-ui-express'
import swaggerDocumentation from './swagger.json' assert { type: 'json' };

const app = express();
app.use(cors({ origin: true }));

app.set('port', config.port);
app.use(express.json({ limit: "50mb" }));
app.use(express.urlencoded({ limit: "50mb", extended: false }));

app.use('/doc', swaggerUI.serve, swaggerUI.setup(swaggerDocumentation))

app.use(mainRoute);

export default app;