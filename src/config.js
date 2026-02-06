import { config } from "dotenv";

config();

export default {
    port: process.env.PORT || 3000,
    myPort: process.env.MY_PORT || '',
    myUser: process.env.MY_USER || '',
    myPassword: process.env.MY_PASSWORD || '',
    myHost: process.env.MY_HOST || '',
    myDatabase: process.env.MY_DATABASE || '',
}