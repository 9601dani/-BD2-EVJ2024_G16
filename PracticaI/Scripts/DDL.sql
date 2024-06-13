CREATE DATABASE practica_1_G16;

USE practica_1_G16;

CREATE TABLE HABITACION (
	idHabitacion INT AUTO_INCREMENT,
    habitacion VARCHAR(50),
    PRIMARY KEY(idHabitacion)
);

CREATE TABLE PACIENTE (
	idPaciente INT AUTO_INCREMENT,
    edad INT,
    genero VARCHAR(20),
    PRIMARY KEY(idPaciente)
);

CREATE TABLE LOG_ACTIVIDAD (
	id_log_actividad INT AUTO_INCREMENT,
    timestampx VARCHAR(100),
    actividad VARCHAR(500),
    idPaciente INT,
    idHabitacion INT,
    PRIMARY KEY(id_log_actividad),
    FOREIGN KEY(idPaciente) REFERENCES PACIENTE(idPaciente),
    FOREIGN KEY(idHabitacion) REFERENCES HABITACION(idHabitacion)
);

CREATE TABLE LOG_HABITACION (
	timestampx VARCHAR(100),
    statusx VARCHAR(45),
    idHabitacion INT,
    PRIMARY KEY(timestampx),
    FOREIGN KEY(idHabitacion) REFERENCES HABITACION(idHabitacion)
);