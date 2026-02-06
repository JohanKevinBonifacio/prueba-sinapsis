// jest.config.js
export default {
  testEnvironment: 'node',
  transform: {},
  moduleNameMapper: {
    '^(\\.{1,2}/.*)\\.js$': '$1'
  },
  // Agrega estos patrones para ignorar transformación
  transformIgnorePatterns: [
    'node_modules/(?!(supertest|express)/)'
  ],
  // Para archivos .js con ES Modules
  moduleFileExtensions: ['js', 'mjs', 'cjs', 'json'],
  testMatch: ['**/tests/**/*.test.js']
};