/*QUERY PARA CREAR TABLAS*/

create table cliente (
idCliente int(11) PRIMARY KEY,
nombre varchar(100),
estado tinyint(1)
)

create table usuario (
idUsuario int(11) PRIMARY KEY,
idCliente int(11),
usuario varchar(30),
estado tinyint(1),
FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
)

create table campania (
idCampania int(11) PRIMARY KEY,
nombre varchar(200),
idUsuario int(11),
fechaHoraProgramacion datetime,
estado tinyint(1),
FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario)
)

create table mensaje (
idMensaje int(11) PRIMARY KEY,
estadoEnvio int,
fechaHoraEnvio datetime,
mensaje varchar(160),
estado tinyint(1)
)

GET
http://localhost:3000/getMensajesProgramadosActivos?mes=enero&idcliente=1

POST
http://localhost:3000/crearCampania

{
    "idCampania": 1008,
    "nombre": "PRUEBAS UNITARIAS",
    "idUsuario": 101,
    "fechaHoraProgramacion": "2024-01-10T19:36:00.000"
}

/*COMANDO PARA AGREGAR SERVERLESS*/
serverless create --template aws-nodejs --path . --name mi-api

/*PARA PROBAR LAMBA de manera Local*/
serverless invoke local --function hello --data '{"body": "hola"}'

/*PARA DESPLEGAR PROYECTO EN AWS*/
serverless deploy --verbose