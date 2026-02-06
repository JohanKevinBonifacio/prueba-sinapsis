const swaggerAutogen = require('swagger-autogen')();

import outputFile from './swagger.json' assert { type: 'json' };

const endPointsFiles = ['./app.js'];

const doc = {
    info: {
        title: 'Hello World',
        description: 'A sample API',
        version: '1.0.0'
    },
    host: 'emey4agr5g.execute-api.us-west-2.amazonaws.com',
    schemes: ['https']
}

// Generar documentación
swaggerAutogen(outputFile, endPointsFiles, doc)
  .then(() => {
    console.log('Documentación Swagger generada');
  });