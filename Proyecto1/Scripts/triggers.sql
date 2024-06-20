use BD2;
GO

-- ======================
-- Trigger 1 para Course
-- ======================
    CREATE TRIGGER proyecto1.Trigger1
    ON proyecto1.Course
    AFTER INSERT, UPDATE, DELETE
    AS
    BEGIN
        DECLARE @Operacion VARCHAR(20);
        DECLARE @Descripcion VARCHAR(100);

       IF EXISTS (SELECT * FROM inserted)
            SET @Operacion = 'INSERT';
        ELSE IF EXISTS (SELECT * FROM deleted)
            SET @Operacion = 'DELETE';
        ELSE
            SET @Operacion = 'UPDATE';
        SET @Descripcion = 'Operacion: ' + @Operacion + ' En tabla Course registrada exitosamente';

        INSERT INTO proyecto1.HistoryLog ([Date], Description)
        VALUES (GETDATE(), @Descripcion);
    END;
GO

-- ================================
-- Trigger 2 para CourseAssignment
-- ================================
    CREATE TRIGGER proyecto1.Trigger2
    ON proyecto1.CourseAssignment
    AFTER INSERT, UPDATE, DELETE
    AS
    BEGIN
        DECLARE @Operacion VARCHAR(20);
        DECLARE @Descripcion VARCHAR(100);

        IF EXISTS (SELECT * FROM inserted)
            SET @Operacion = 'INSERT';
        ELSE IF EXISTS (SELECT * FROM deleted)
            SET @Operacion = 'DELETE';
        ELSE
            SET @Operacion = 'UPDATE';
        SET @Descripcion = 'Operacion: ' + @Operacion + ' En tabla CourseAssignment registrada exitosamente';

        INSERT INTO proyecto1.HistoryLog ([Date], Description)
        VALUES (GETDATE(), @Descripcion);
    END;
GO

-- ================================
-- Trigger 3 para CourseTutor
-- ================================
    CREATE TRIGGER proyecto1.Trigger3
    ON proyecto1.CourseTutor
    AFTER INSERT, UPDATE, DELETE
    AS
    BEGIN
        DECLARE @Operacion VARCHAR(20);
        DECLARE @Descripcion VARCHAR(100);

        IF EXISTS (SELECT * FROM inserted)
            SET @Operacion = 'INSERT';
        ELSE IF EXISTS (SELECT * FROM deleted)
            SET @Operacion = 'DELETE';
        ELSE
            SET @Operacion = 'UPDATE';
        SET @Descripcion = 'Operacion: ' + @Operacion + ' En tabla CourseTutor registrada exitosamente';

        INSERT INTO proyecto1.HistoryLog ([Date], Description)
        VALUES (GETDATE(), @Descripcion);
    END;

GO

-- ================================
-- Trigger 4 Notificación
-- ================================
    CREATE TRIGGER proyecto1.Trigger4
    ON proyecto1.Notification
    AFTER INSERT, UPDATE, DELETE
    AS
    BEGIN
        DECLARE @Operacion VARCHAR(20);
        DECLARE @Descripcion VARCHAR(100);

        IF EXISTS (SELECT * FROM inserted)
            SET @Operacion = 'INSERT';
        ELSE IF EXISTS (SELECT * FROM deleted)
            SET @Operacion = 'DELETE';
        ELSE
            SET @Operacion = 'UPDATE';
        SET @Descripcion = 'Operacion: ' + @Operacion + ' En tabla Notification registrada exitosamente';

        INSERT INTO proyecto1.HistoryLog ([Date], Description)
        VALUES (GETDATE(), @Descripcion);
    END;
GO

-- ================================
-- Trigger 5 para ProfileStudent
-- ================================
    CREATE TRIGGER proyecto1.Trigger5
    ON proyecto1.ProfileStudent
    AFTER INSERT, UPDATE, DELETE
    AS
    BEGIN
        DECLARE @Operacion VARCHAR(20);
        DECLARE @Descripcion VARCHAR(100);

        IF EXISTS (SELECT * FROM inserted)
            SET @Operacion = 'INSERT';
        ELSE IF EXISTS (SELECT * FROM deleted)
            SET @Operacion = 'DELETE';
        ELSE
            SET @Operacion = 'UPDATE';
        SET @Descripcion = 'Operacion: ' + @Operacion + ' En tabla ProfileStudent registrada exitosamente';

        INSERT INTO proyecto1.HistoryLog ([Date], Description)
        VALUES (GETDATE(), @Descripcion);
    END;
GO

-- ================================
-- Trigger 6 para Roles
-- ================================
    CREATE TRIGGER proyecto1.Trigger6
    ON proyecto1.Roles
    AFTER INSERT, UPDATE, DELETE
    AS
    BEGIN
        DECLARE @Operacion VARCHAR(20);
        DECLARE @Descripcion VARCHAR(100);

        IF EXISTS (SELECT * FROM inserted)
            SET @Operacion = 'INSERT';
        ELSE IF EXISTS (SELECT * FROM deleted)
            SET @Operacion = 'DELETE';
        ELSE
            SET @Operacion = 'UPDATE';
        SET @Descripcion = 'Operacion: ' + @Operacion + ' En tabla Roles registrada exitosamente';

        INSERT INTO proyecto1.HistoryLog ([Date], Description)
        VALUES (GETDATE(), @Descripcion);
    END;
GO

-- ================================
-- Trigger 7 para TFA
-- ================================
    CREATE TRIGGER proyecto1.Trigger7
    ON proyecto1.TFA
    AFTER INSERT, UPDATE, DELETE
    AS
    BEGIN
        DECLARE @Operacion VARCHAR(20);
        DECLARE @Descripcion VARCHAR(100);

        IF EXISTS (SELECT * FROM inserted)
            SET @Operacion = 'INSERT';
        ELSE IF EXISTS (SELECT * FROM deleted)
            SET @Operacion = 'DELETE';
        ELSE
            SET @Operacion = 'UPDATE';
        SET @Descripcion = 'Operacion: ' + @Operacion + ' En tabla TFA registrada exitosamente';

        INSERT INTO proyecto1.HistoryLog ([Date], Description)
        VALUES (GETDATE(), @Descripcion);
    END;
GO

-- ================================
-- Trigger 8 para TutorProfile
-- ================================
    CREATE TRIGGER proyecto1.Trigger8
    ON proyecto1.TutorProfile
    AFTER INSERT, UPDATE, DELETE
    AS
    BEGIN
        DECLARE @Operacion VARCHAR(20);
        DECLARE @Descripcion VARCHAR(100);

        IF EXISTS (SELECT * FROM inserted)
            SET @Operacion = 'INSERT';
        ELSE IF EXISTS (SELECT * FROM deleted)
            SET @Operacion = 'DELETE';
        ELSE
            SET @Operacion = 'UPDATE';
        SET @Descripcion = 'Operacion: ' + @Operacion + ' En tabla TutorProfile registrada exitosamente';

        INSERT INTO proyecto1.HistoryLog ([Date], Description)
        VALUES (GETDATE(), @Descripcion);
    END;
GO

-- ================================
-- Trigger 9 para UsuarioRole
-- ================================
    CREATE TRIGGER proyecto1.Trigger9
    ON proyecto1.UsuarioRole
    AFTER INSERT, UPDATE, DELETE
    AS
    BEGIN
        DECLARE @Operacion VARCHAR(20);
        DECLARE @Descripcion VARCHAR(100);

        IF EXISTS (SELECT * FROM inserted)
            SET @Operacion = 'INSERT';
        ELSE IF EXISTS (SELECT * FROM deleted)
            SET @Operacion = 'DELETE';
        ELSE
            SET @Operacion = 'UPDATE';
        SET @Descripcion = 'Operacion: ' + @Operacion + ' En tabla UsuarioRole registrada exitosamente';

        INSERT INTO proyecto1.HistoryLog ([Date], Description)
        VALUES (GETDATE(), @Descripcion);
    END;
GO

-- ================================
-- Trigger 10 para Usuarios
-- ================================
    CREATE TRIGGER proyecto1.Trigger10
    ON proyecto1.Usuarios
    AFTER INSERT, UPDATE, DELETE
    AS
    BEGIN
        DECLARE @Operacion VARCHAR(20);
        DECLARE @Descripcion VARCHAR(100);

        IF EXISTS (SELECT * FROM inserted)
            SET @Operacion = 'INSERT';
        ELSE IF EXISTS (SELECT * FROM deleted)
            SET @Operacion = 'DELETE';
        ELSE
            SET @Operacion = 'UPDATE';
        SET @Descripcion = 'Operacion: ' + @Operacion + ' En tabla Usuarios registrada exitosamente';

        INSERT INTO proyecto1.HistoryLog ([Date], Description)
        VALUES (GETDATE(), @Descripcion);
    END;
GO
-- ==============================================================
-- verificar la existencia de los triggers mediante una consulta
-- ==============================================================
--                  SELECT * FROM sys.triggers;



