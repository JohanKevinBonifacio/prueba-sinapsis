// src/models/ApiResponse.js - ES Modules
export class ApiResponse {
  constructor(status, message, data = null) {
    this.status = status; // 'success' o 'error'
    this.message = message;
    this.data = data;
  }

  static success(message, data = null) {
    return new ApiResponse('success', message, data);
  }

  static error(message) {
    return new ApiResponse('failed', message, null); // Corregí 'faild' a 'failed'
  }
}

// Exportación por defecto también si la necesitas
export default ApiResponse;