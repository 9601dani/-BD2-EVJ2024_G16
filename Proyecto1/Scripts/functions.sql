use BD2
go

-- =============================================
-- Func_course_usuarios -> F1 (CodCourse)
-- =============================================
CREATE FUNCTION F1 (@CodCourse INT)
RETURNS TABLE
AS
RETURN
(
    -- Consulta que retorna el listado de alumnos asignados a un curso
    SELECT
        U.[Firstname],
        U.[Lastname],
        U.[Email],
        U.[DateOfBirth]
    FROM
        [proyecto1].[CourseAssignment] AS CA
    INNER JOIN
        [proyecto1].[Usuarios] AS U
    ON
        CA.[StudentId] = U.[Id]
    WHERE
        CA.[CourseCodCourse] = @CodCourse
)
go

-- =============================================
-- Func_course_usuarios -> F2 (Id [TutorProfile]
-- =============================================

CREATE FUNCTION F2 (@Id UNIQUEIDENTIFIER)
RETURNS TABLE
AS
RETURN
(
    -- Consulta que retorna el listado de cursos asignados a un tutor
    SELECT
        C.[CodCourse],
        C.[Name],
        C.[CreditsRequired]
    FROM
        [proyecto1].[CourseAssignment] AS CA
    INNER JOIN
        [proyecto1].[Course] AS C
    ON
        CA.[CourseCodCourse] = C.[CodCourse]
    WHERE
        CA.[StudentId] = @Id
)
go

-- =============================================
-- Func_course_usuarios -> F3 (Id [Usuarios])
-- =============================================

CREATE FUNCTION F3 (@Id UNIQUEIDENTIFIER)
RETURNS TABLE
AS
RETURN
(
    -- Consulta que retorna el listado de notificaciones enviadas a un usuario
    SELECT
        N.[Id],
        N.[Message],
        N.[Date]
    FROM
        [proyecto1].[Notification] AS N
    WHERE
        N.[UserId] = @Id
)
go

-- =============================================
-- Func_logger -> F4 ()
-- =============================================
CREATE FUNCTION F4 ()
RETURNS TABLE
AS
RETURN
(
    -- Consulta que retorna el listado de logs de la base de datos
    SELECT
        L.[Id],
        L.[Date],
        L.[Description]
    FROM
        [proyecto1].[HistoryLog] AS L
)
go

-- =============================================
-- Func_usuarios -> F5 (Id [Usuarios])
/*
REVISAR
*/
-- =============================================
CREATE FUNCTION F5 (@Id UNIQUEIDENTIFIER)
RETURNS TABLE
AS
RETURN
(
    -- Consulta que retorna el expediente de un alumno
    SELECT
        U.[Firstname],
        U.[Lastname],
        U.[Email],
        U.[DateOfBirth],
        R.[RoleName]
    FROM
        [proyecto1].[Usuarios] AS U
    INNER JOIN
        [proyecto1].[Roles] AS R
    ON
        U.[Id] = R.[Id]
    INNER JOIN
        proyecto1.CourseAssignment CA
    ON
        U.Id = CA.StudentId
    INNER JOIN
        proyecto1.Course C
    ON
        C.CodCourse = CA.CourseCodCourse
    WHERE
        U.[Id] = @Id
)


