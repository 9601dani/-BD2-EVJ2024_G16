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

EXEC proyecto1.PR1
     @Firstname = 'Jane',
     @Lastname = 'Smith',
     @Email = 'jane.smith@example.com',
     @DateOfBirth = '1985-05-15 00:00:00',
     @Password = 'MiContra123',
     @Credits = 70
GO

EXEC proyecto1.PR1
     @Firstname = 'Emily',
     @Lastname = 'Davis',
     @Email = 'emily.davis@example.com',
     @DateOfBirth = '1985-05-15 00:00:00',
     @Password = 'MiContra123',
     @Credits = 75
GO

EXEC proyecto1.PR1
     @Firstname = 'Sarah',
     @Lastname = 'Wilson',
     @Email = 'sarah.wilson@example.com',
     @DateOfBirth = '1985-05-15 00:00:00',
     @Password = 'MiContra123',
     @Credits = 70
GO

EXEC proyecto1.PR1
     @Firstname = 'david',
     @Lastname = 'taylor',
     @Email = 'david.taylor@example.com',
     @DateOfBirth = '1985-05-15 00:00:00',
     @Password = 'MiContra123',
     @Credits = 70
GO

EXEC proyecto1.PR1
     @Firstname = 'Laura',
     @Lastname = 'Moore',
     @Email = 'laura.moore@example.com',
     @DateOfBirth = '1985-05-15 00:00:00',
     @Password = 'MiContra123',
     @Credits = 70
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
    @Email = 'david.taylor@example.com',
    @CodCourse = 775
GO

EXEC proyecto1.PR3
    @Email = 'laura.moore@example.com',
    @CodCourse = 775
GO

EXEC proyecto1.PR3
    @Email = 'sarah.wilson@example.com',
    @CodCourse = 775
GO



SELECT * FROM proyecto1.HistoryLog
SELECT * FROM proyecto1.CourseAssignment
SELECT * FROM proyecto1.Course
SELECT * FROM proyecto1.UsuarioRole;
SELECT * FROM proyecto1.Notification;

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

-- =============================================
-- TEST 8: Cambio de Roles PR2
-- EXITOSO
-- =============================================
EXEC proyecto1.PR2
    @Email = 'jane.smith@example.com',
    @CodCourse = 775
GO

EXEC proyecto1.PR2
    @Email = 'laura.moore@example.com',
    @CodCourse = 775
GO

EXEC proyecto1.PR2
    @Email = 'sarah.wilson@example.com',
    @CodCourse = 775
GO

-- =============================================
-- Test functions
-- =============================================
USE BD2
GO

-- =============================================
-- Test F1
-- =============================================
SELECT * FROM proyecto1.F1(1);
SELECT * FROM proyecto1.F1(775);
SELECT * FROM proyecto1.F1(7752);


-- =============================================
-- Test F2
-- =============================================
SELECT * FROM proyecto1.F2('041CF70F-EA87-45BA-844F-A56AE120827F');

-- =============================================
-- Test F3
-- =============================================
SELECT * FROM proyecto1.F3('041CF70F-EA87-45BA-844F-A56AE120827F');
SELECT * FROM proyecto1.F3('0DA0E3D7-CF0F-4234-9EBC-D4ECF50BE800');

-- =============================================
-- Test F4
-- =============================================
SELECT * FROM proyecto1.F4();

-- =============================================
-- Test F5
-- =============================================
SELECT * FROM proyecto1.F5('041CF70F-EA87-45BA-844F-A56AE120827F');
SELECT * FROM proyecto1.F5('0DA0E3D7-CF0F-4234-9EBC-D4ECF50BE800');

SELECT * FROM proyecto1.TutorProfile;

