USE BD2
GO

SELECT * FROM proyecto1.Course
SELECT * FROM proyecto1.CourseAssignment
SELECT * FROM proyecto1.CourseTutor
SELECT * FROM proyecto1.HistoryLog
SELECT * FROM proyecto1.Notification
SELECT * FROM proyecto1.ProfileStudent
SELECT * FROM proyecto1.Roles
SELECT * FROM proyecto1.TFA
SELECT * FROM proyecto1.TutorProfile
SELECT * FROM proyecto1.UsuarioRole
SELECT * FROM proyecto1.Usuarios
GO

SELECT * FROM dbo.__EFMigrationsHistory
GO


-- ===================================================
-- Test procedures
-- ===================================================
USE BD2
GO

-- =============================================
-- TEST 1: Registro de Usuarios
-- "EXITOSO"
-- =============================================
EXEC proyecto1.PR1
    @Firstname = 'John',
    @Lastname = 'Doe',
    @Email = 'jonh.doe@example.com',
    @DateOfBirth = '1985-05-15 00:00:00',
    @Password = 'Password123!',
    @Credits = 20
GO

SELECT * FROM proyecto1.HistoryLog
SELECT * FROM proyecto1.Usuarios

-- =============================================
-- TEST 2: Registro de Usuarios
-- Prueba de correo duplicado
-- =============================================
EXEC proyecto1.PR1
     @Firstname = 'Levi',
     @Lastname = 'Sapon',
     @Email = 'jonh.doe@example.com',
     @DateOfBirth = '1985-05-15 00:00:00',
     @Password = 'MiContra123',
     @Credits = 20
GO
-- =============================================
-- TEST 3: Registro de Usuarios
-- Prueba de de vacios
-- =============================================
EXEC proyecto1.PR1
     @Firstname = 'a',
     @Lastname = 'a',
     @Email = 'jj',
     @DateOfBirth = '',
     @Password = '',
     @Credits = 20
GO

-- =============================================
-- TEST 4: Creacion Curso PR5
-- "EXITOSO"
-- =============================================
EXEC proyecto1.PR5
    @CodCourse = 1,
    @Name = 'ETICA PROFESIONAL',
    @CreditsRequired = 3
GO
SELECT * FROM proyecto1.HistoryLog
SELECT * FROM proyecto1.Course

-- =============================================
-- TEST 5: Asignacion de Curso Estudiante
-- "EXITOSO"
-- =============================================
EXEC proyecto1.PR3
    @Email = 'jonh.doe@example.com',
    @CodCourse = 1
GO
SELECT * FROM proyecto1.HistoryLog
SELECT * FROM proyecto1.CourseAssignment
SELECT * FROM proyecto1.Course

-- =============================================
-- TEST 6: Asignacion de Curso Estudiante
-- Prueba de asignarse a curso que no tiene creditos
-- =============================================
EXEC proyecto1.PR3
    @Email = 'jonh.doe@example.com',
    @CodCourse = 775
GO
SELECT * FROM proyecto1.HistoryLog

-- =============================================
-- TEST 7: Asignacion de Curso Estudiante
-- Prueba de asignarse a curso que no existe
-- =============================================
EXEC proyecto1.PR3
     @Email = 'jonh.doe@example.com',
     @CodCourse = 7756
GO




