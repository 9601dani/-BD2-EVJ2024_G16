-- --------------------------------------------------------------------------------------
-- ------------------------------ Procedimiento 1 ---------------------------------------
-- --------------------------------------------------------------------------------------
use BD2;
-- ------------------------------- Ingresar Usuarios ------------------------------------ 
EXEC proyecto1.PR1 'Andres', 'Paz', 'andres.paz@gmail.com', '2000-01-27', 'password123', 10;
EXEC proyecto1.PR1 'Alice', 'Suarez', 'alice.suarez@gmail.com', '1995-05-15', 'user123', 30;
EXEC proyecto1.PR1 'Carlos', 'García', 'carlos.garcia@gmail.com', '2000-03-22', 'password321', 20;
EXEC proyecto1.PR1 'María', 'Lopez', 'maria.lopez@gmail.com', '1998-07-15', 'securepass456', 25;
EXEC proyecto1.PR1 'José', 'Hernández', 'jose.hernandez@gmail.com', '2005-11-10', 'mypassword789', 15;
EXEC proyecto1.PR1 'Ana', 'Martínez', 'ana.martinez@gmail.com', '2002-09-30', 'userpass123', 18;
EXEC proyecto1.PR1 'Luis', 'Ramírez', 'luis.ramirez@gmail.com', '2003-02-05', 'password456', 12;

select * from proyecto1.Usuarios;

SELECT * FROM proyecto1.F3('A9C7D3ED-6EFE-4FCA-9187-352B15A98D9B'); -- Verificar la notificacion del estudiante
SELECT * FROM proyecto1.F4(); -- Ver History Log
-- --------------------------------- Datos Nulos ----------------------------------------
EXEC proyecto1.PR1 NULL, 'Paz', 'andres.paz@example.com', '2000-01-27', 'password123', 10;
EXEC proyecto1.PR1 'Andres', NULL, 'andres.paz@example.com', '2000-01-27', 'password123', 10;
EXEC proyecto1.PR1 'Andres', 'Paz', NULL, '2000-01-27', 'password123', 10;
EXEC proyecto1.PR1 'Andres', 'Paz', 'andres.paz@example.com', NULL, 'password123', 10;
EXEC proyecto1.PR1 'Andres', 'Paz', 'andres.paz@example.com', '2000-01-27', NULL, 10;
-- ----------------------- Prueba Procedimiento 6
EXEC proyecto1.PR1 'Andres', 'Paz', 'andres.paz@example.com', '2000-01-27', 'password123', NULL; -- Creditos Null
EXEC proyecto1.PR1 'Andres', 'Paz', 'andres.paz@example.com', '2000-01-27', 'password123', -10;


-- Usuario con email 'maria.lopez@gmail.com' ya se encuentra registrado
EXEC proyecto1.PR1 'Melani', 'Lopez', 'maria.lopez@gmail.com', '2000-02-02', 'password123', 15;
select * from proyecto1.Usuarios;
SELECT * FROM proyecto1.F4(); -- Ver History Log

-- Datos Del Usuario
SELECT * FROM proyecto1.F5('F9EC131C-5C74-4CB8-B4E7-C47E0FE3309D');

-- --------------------------------------------------------------------------------------
-- ------------------------------ Procedimiento 2 ---------------------------------------
-- --------------------------------------------------------------------------------------
Select * from proyecto1.Course; -- Obtener Codigo 283 ayd1- 30 creditos
Select * from proyecto1.Usuarios; -- Obtener ID: D5EA1D6D-7A44-4A69-8097-7434152FEEFA y correo: jose.hernandez@gmail.com
-- ------------------- ---------------------
SELECT * FROM proyecto1.F5('B0CBAA50-A4D0-41D8-A502-DD3720877EE8');
-- --------------------------------------------------------------------
EXEC proyecto1.PR2 'andres.paz@gmail.com', 283; -- Promovido correctamente
EXEC proyecto1.PR2 'maria.fernandez@gmail.com', 102; -- Cuenta no existente
EXEC proyecto1.PR2 'alice.suarez@gmail.com', 102; -- Codigo de Curso no existente
-- ---------------------Asignacion Correcta -----------------------------------
EXEC proyecto1.PR2 'alice.suarez@gmail.com', 970; -- Asigdao a tutor en Redes 1
SELECT * FROM proyecto1.F3('A9C7D3ED-6EFE-4FCA-9187-352B15A98D9B'); -- Notificaciones F3
-- ------------------------------ Buscar el Tutor Profile -------------------------------- 
Select * from proyecto1.TutorProfile where UserId = 'A9C7D3ED-6EFE-4FCA-9187-352B15A98D9B';
-- --------------------- Probar Funcion 3 -----------------------
Select * from proyecto1.F2('A9C7D3ED-6EFE-4FCA-9187-352B15A98D9B');

-- -------------------------------------------------------------------


select * from proyecto1.F4();
-- --------------------------------------------------------------------------------------
-- ------------------------------ Procedimiento 3 ---------------------------------------
-- --------------------------------------------------------------------------------------
Select * from proyecto1.Course; -- Obtener Codigo 283 ayd1- 30 creditos
Select * from proyecto1.Usuarios; -- 
SELECT * FROM proyecto1.F3('E10F66DE-A5EA-4B53-A26B-E6797E53A06C'); -- Notificaciones F3
-- Asignacion Correctamente a Redes
EXEC proyecto1.PR3 'maria.lopez@gmail.com', 970;
-- Se notifica al Tutor (Auxiliar)
SELECT * FROM proyecto1.F3('A9C7D3ED-6EFE-4FCA-9187-352B15A98D9B'''); -- Notificaciones F3
-- Se notifica al Estudiante
SELECT * FROM proyecto1.F3('E10F66DE-A5EA-4B53-A26B-E6797E53A06C'); -- Notificaciones F3
 -- ------------Listado de Alumnos asignados al curso 
SELECT * FROM proyecto1.F1(970); 

-- --------------------------------------------------------------------------------------
-- ------------------------------ Procedimiento 4 ---------------------------------------
-- --------------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------------
-- ------------------------------ Procedimiento 5 ---------------------------------------
-- --------------------------------------------------------------------------------------

