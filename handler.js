
'use strict';

let app;
const initApp = async () => {
  if (!app) {
    const module = await import('./src/app.js');
    app = module.default;
  }
  return app;
};

const getHandler = async () => {
  const app = await initApp();
  const serverless = await import('serverless-http');
  return serverless.default(app);
};

let cachedHandler;

export const api = async (event, context) => {
  if (!cachedHandler) {
    cachedHandler = await getHandler();
  }
  return cachedHandler(event, context);
};