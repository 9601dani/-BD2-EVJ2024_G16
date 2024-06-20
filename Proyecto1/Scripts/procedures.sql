use BD2;
GO

-- =============================================
-- Procedure `Creacion de roles para estudiante` PR4 (RoleName)
-- =============================================
CREATE PROCEDURE [proyecto1].PR4
    @RoleName NVARCHAR(50)
AS
BEGIN
    DECLARE @ErrorMessage NVARCHAR(250);
    DECLARE @ErrorSeverity INT;
    -- Validacion de nulo
    IF @RoleName IS NULL
    BEGIN
        SET @ErrorMessage = 'RoleName no puede ser nulo.';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END

    -- Validacion de vacio
    IF LTRIM(RTRIM(@RoleName)) = ''
    BEGIN
        SET @ErrorMessage = 'RoleName no puede ser vacio.';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END;

    -- Validacion de solo letras y espacios
    IF @RoleName NOT LIKE '%[a-zA-Z ]%'
    BEGIN
        SET @ErrorMessage = 'RoleName debe contener solo letras y espacios.';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END;

    -- Validacion de duplicados
    IF EXISTS (
        SELECT 1
        FROM [proyecto1].[Roles]
        WHERE [RoleName] = @RoleName
    )
    BEGIN
        SET @ErrorMessage = 'El rol ya existe.';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END;

    -- Insercion de rol
    INSERT INTO [proyecto1].[Roles] (
        [Id],
        [RoleName]
    ) VALUES (
        NEWID(),
        @RoleName
    );
END

-- ==================================================
-- Procedure `Creacion de Cursos para estudiante` PR5(CodCourse, Name, CredistsRequired)
-- ==================================================
CREATE PROCEDURE proyecto1.PR5 (@CodCourse int, @Name nvarchar(max), @CreditsRequired int)
AS BEGIN
	Declare @Description nvarchar(max);
	Declare @IsValid BIT;
	EXEC proyecto1.PR6 'Course',NULL,NULL, @Name, @CreditsRequired, @IsValid OUTPUT ;
	IF @IsValid = 0
		BEGIN
			-- MARCAR ERROR
			SET @Description = 'Insercion de Curso Fallida Nombre o Creditos Incorrectos';
			INSERT INTO proyecto1.HistoryLog ([Date], Description)
    		VALUES (GETDATE(), @Description);
			SELECT @Description AS 'Error';
			ROLLBACK TRANSACTION;
			RETURN;
		END
    IF @CreditsRequired < 0
		BEGIN
			-- MARCAR ERROR
			SET @Description = 'Insercion de Curso Fallida Creditos no pueden ser negativos';
			INSERT INTO proyecto1.HistoryLog ([Date], Description)
    		VALUES (GETDATE(), @Description);
			SELECT @Description AS 'Error';
			ROLLBACK TRANSACTION;
			RETURN;
		END --FUNCIONA COMO UN RETURN O BREAK
    IF @CodCourse < 0
		BEGIN
			-- MARCAR ERROR
			SET @Description = 'Insercion de Curso Fallida Codigo de Curso no puede ser negativo';
			INSERT INTO proyecto1.HistoryLog ([Date], Description)
    		VALUES (GETDATE(), @Description);
			SELECT @Description AS 'Error';
			ROLLBACK TRANSACTION;
			RETURN;
		END --FUNCIONA COMO UN RETURN O BREAK


	BEGIN TRY
		BEGIN TRANSACTION;
		INSERT INTO proyecto1.Course(CodCourse, Name, CreditsRequired) VALUES
		(@CodCourse, @Name, @CreditsRequired);
		SELECT 'Insercion de Curso exitosa' AS Mensaje;
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		SET @Description = 'Insercion de Curso Fallida'+ ERROR_MESSAGE();
		SELECT @Description AS 'Error';
		ROLLBACK TRANSACTION;
	END CATCH;
END;


-- ==================================================
-- Procedure `Registro de usuarios` PR1(Firstname, Lastname, Email, DateOfBirth, Password, Credits)
-- NOTA: EmailConfirmed será 1
-- ==================================================
CREATE PROCEDURE proyecto1.PR1
    @Firstname VARCHAR(max),
    @Lastname VARCHAR(max),
    @Email VARCHAR(max),
    @DateOfBirth datetime2(7),
    @Password VARCHAR(max),
    @Credits INT
AS
BEGIN
    DECLARE @UserId uniqueidentifier;
    DECLARE @RolId uniqueidentifier;
    DECLARE @ErrorMessage NVARCHAR(250);
    DECLARE @ErrorSeverity INT;

    -- Validaciones de cada campo
     -- Firtsname vacio
    IF (@Firstname IS NULL OR @Firstname = '')
    BEGIN
        SET @ErrorMessage = 'Error, El nombre no puede ir vacio';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END

    -- Firstname solo letras
    IF (@Firstname NOT LIKE '%[a-zA-Z ]%')
    BEGIN
        SET @ErrorMessage = 'Error, El nombre solo puede contener letras';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END

    -- Apellido vacio
    IF (@Lastname IS NULL OR @Lastname = '')
    BEGIN
        SET @ErrorMessage = 'Error, El apellido no puede ir vacio';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END

    -- Apellido solo letras
    IF (@Lastname NOT LIKE '%[a-zA-Z ]%')
    BEGIN
        SET @ErrorMessage = 'Error, El apellido solo puede contener letras';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END

    -- Correo vacio
    IF (@Email IS NULL OR @Email = '')
    BEGIN
        SET @ErrorMessage = 'Error, El campo correo no puede ir vacio';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END

    --Correo valido
    IF (@Email NOT LIKE '%_@__%.__%')
    BEGIN
        SET @ErrorMessage = 'Error, El correo no es valido';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END

    -- Fecha vacia
    IF (@DateOfBirth IS NULL)
    BEGIN
        SET @ErrorMessage = 'Error, La fecha de nacimiento no puede ir vacia';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END

    -- Fecha valida
    IF (@DateOfBirth > GETDATE())
    BEGIN
        SET @ErrorMessage = 'Error, La fecha de nacimiento no puede ser mayor a la fecha actual';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END

    -- Contasena vacia
    IF (@Password IS NULL OR @Password = '')
    BEGIN
        SET @ErrorMessage = 'Error, El password no puede estar vacio';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END

    -- Creditos con valor negativo
    IF (@Credits < 0)
    BEGIN
        SET @ErrorMessage = 'Error, No puede ingresar una cantidad de creditos negativa';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END

    BEGIN TRY
    	-- Inicio de transacci�n
        BEGIN TRANSACTION;

    	-- Validaci�n de datos utilizando el procedimiento PR6
        DECLARE @IsValid BIT;
        EXEC proyecto1.PR6 'Usuarios', @Firstname, @Lastname, NULL, NULL, @IsValid OUTPUT;
        IF(@IsValid = 0)
        BEGIN
            SET @ErrorMessage = 'Los campos son incorrectos, solo deben contener letras';
            SET @ErrorSeverity = 16;
            RAISERROR(@ErrorMessage,@ErrorSeverity,1);
            RETURN;
        END

        -- Validar si el que el email no est� asociado con ninguna otra cuenta dentro del sistema
        IF EXISTS (SELECT * FROM proyecto1.Usuarios WHERE Email = @Email)
        BEGIN
            SET @ErrorMessage = 'Ya hay un usuario asociado con el correo indicado';
            SET @ErrorSeverity = 16;
            RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
            RETURN;
        END

        -- Creaci�n de rol estudiante
        SET @RolId = (SELECT Id FROM proyecto1.Roles WHERE RoleName = 'Student');
        IF @RolId IS NULL
        BEGIN
            SET @ErrorMessage = 'El rol del estudiante no existe';
            SET @ErrorSeverity = 16;
            RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
            RETURN;
        END

        -- Insert tabla Usuarios
        SET @UserId = NEWID();
        INSERT INTO proyecto1.Usuarios(Id, Firstname, Lastname, Email, DateOfBirth, Password, LastChanges, EmailConfirmed)
        VALUES (@UserId, @Firstname, @Lastname, @Email, @DateOfBirth, @Password, GETDATE(), 1);

        -- Insert tabla UsuarioRole
        INSERT INTO proyecto1.UsuarioRole (RoleId, UserId, IsLatestVersion)
        VALUES (@RolId, @UserId, 1);

        -- Insert tabla ProfileStudent
        INSERT INTO proyecto1.ProfileStudent (UserId, Credits)
        VALUES (@UserId, @Credits);

        -- Insert tabla TFA
        INSERT INTO proyecto1.TFA (UserId, Status, LastUpdate)
        VALUES (@UserId, 1, GETDATE());

        -- Insert tabla Notification
        INSERT INTO proyecto1.Notification (UserId, Message, Date)
        VALUES (@UserId, 'Se ha registrado satisfactoriamente', GETDATE());
		PRINT 'El estudiante ha sido registrado satisfactoriamente';

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
          -- Error - cancelar transacci�n
        ROLLBACK;
        SELECT @ErrorMessage = ERROR_MESSAGE();
		-- Registro del error en la tabla HistoryLog
        INSERT INTO proyecto1.HistoryLog (Date, Description)
        VALUES (GETDATE(), 'Error Regristro - ' + @ErrorMessage);
       	PRINT 'Registro instatisfactorio'
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH;
END;

-- ==================================================
-- Procedure `Validacion de Datos' PR6
-- ==================================================
CREATE PROCEDURE proyecto1.PR6
    @EntityName NVARCHAR(50),
    @FirstName NVARCHAR(MAX) = NULL,
    @LastName NVARCHAR(MAX) = NULL,
    @Name NVARCHAR(MAX) = NULL,
    @CreditsRequired INT = NULL,
    @IsValid BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    IF @EntityName = 'Usuarios'
        BEGIN
            IF ISNULL(@FirstName, '') NOT LIKE '%[^a-zA-Z ]%' AND ISNULL(@LastName, '') NOT LIKE '%[^a-zA-Z ]%'
                SET @IsValid = 1;
            ELSE
                SET @IsValid = 0;
        END
    ELSE IF @EntityName = 'Course'
        BEGIN
            IF ISNULL(@Name, '') NOT LIKE '%[^a-zA-Z ]%' AND ISNUMERIC(@CreditsRequired) = 1 AND @CreditsRequired > 0
                SET @IsValid = 1;
            ELSE
                SET @IsValid = 0;
        END
    ELSE
        BEGIN
            SET @IsValid = 0;
        END;
END;


-- ==================================================
-- Procedure `Cambio de Roles' PR2(Email, CodCourse)
-- Algunos estudiantes pueden tomar el rol de tutor ya que la Universidad les da la oportunidad
-- de realizar prácticas finales como auxiliar de cátedra. Por lo tanto, se necesita un proceso
-- mediante el cual el estudiante se le agregue junto a su rol de estudiante un rol de tutor y así
-- mismo se le asigne un perfil de tutor con el cual podrá hacer acciones dentro del sistema.
-- Cuando este proceso se lleve a cabo se debe especificar a qué curso se le asigna como
-- tutor. Por último, se le enviará un correo de notificación al usuario que fue promovido con el
-- rol de tutor.
-- Entidades Implicadas:
-- ❖ UsuarioRole
-- ❖ TutorProfile
-- ❖ CourseTutor
-- ❖ Notification
-- Restricciones:
-- Se debe garantizar que el usuario sea un usuario con cuenta activa (se comprueba por
-- medio del campo EmailConfirmed).
-- ==================================================
CREATE PROCEDURE proyecto1.PR2
    @Email NVARCHAR(MAX),
    @CodCourse INT
AS
BEGIN
    DECLARE @UserId UNIQUEIDENTIFIER;
    DECLARE @RoleId UNIQUEIDENTIFIER;
    DECLARE @IsValid BIT;
    DECLARE @ErrorMessage NVARCHAR(250);
    DECLARE @ErrorSeverity INT;
    DECLARE @TutorCode UNIQUEIDENTIFIER;

    -- Validar que el correo no sea nulo
    IF @Email IS NULL
    BEGIN
        SET @ErrorMessage = 'Error, El correo no puede ir vacio';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END

    -- Validar que el correo no sea vacio
    IF LTRIM(RTRIM(@Email)) = ''
    BEGIN
        SET @ErrorMessage = 'Error, El correo no puede ir vacio';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END

    -- Validar que el correo sea valido
    IF @Email NOT LIKE '%_@__%.__%'
    BEGIN
        SET @ErrorMessage = 'Error, El correo no es valido';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END

    -- Validar que el curso no sea nulo
    IF @CodCourse IS NULL
    BEGIN
        SET @ErrorMessage = 'Error, El codigo del curso no puede ir vacio';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END

    -- Validar que el curso no sea vacio
    IF LTRIM(RTRIM(@CodCourse)) = ''
    BEGIN
        SET @ErrorMessage = 'Error, El codigo del curso no puede ir vacio';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END

    -- Validar que el curso sea un numero
    IF ISNUMERIC(@CodCourse) = 0
    BEGIN
        SET @ErrorMessage = 'Error, El codigo del curso debe ser un numero';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END

    -- Validar que el curso sea un numero positivo
    IF @CodCourse < 0
    BEGIN
        SET @ErrorMessage = ' Error, El codigo del curso debe ser un numero positivo';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END

    -- Validar que el usuario exista
    IF NOT EXISTS (SELECT * FROM proyecto1.Usuarios WHERE Email = @Email)
    BEGIN
        SET @ErrorMessage = 'Error, El usuario no existe';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END

    -- Validar que el usuario tenga cuenta activa

    IF NOT EXISTS (SELECT * FROM proyecto1.Usuarios WHERE Email = @Email AND EmailConfirmed = 1)
    BEGIN
        SET @ErrorMessage = 'Error, El usuario no tiene cuenta activa';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END

    -- REVISAR
    /*-- Validar que el usuario no tenga el rol de tutor
    IF EXISTS (SELECT * FROM proyecto1.Usuarios u
               JOIN proyecto1.UsuarioRole ur ON u.Id = ur.UserId
               JOIN proyecto1.Roles r ON ur.RoleId = r.Id
               WHERE u.Email = @Email AND r.RoleName = 'Tutor')
    BEGIN
        SET @ErrorMessage = 'Error, El usuario ya tiene el rol de tutor';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END*/

    -- Validar que el rol de tutor exista
    SET @RoleId = (SELECT Id FROM proyecto1.Roles WHERE RoleName = 'Tutor');
    IF @RoleId IS NULL
    BEGIN
        SET @ErrorMessage = 'Error, El rol de tutor no existe';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END

    -- Validar que el curso exista
    IF NOT EXISTS (SELECT * FROM proyecto1.Course WHERE CodCourse = @CodCourse)
    BEGIN
        SET @ErrorMessage = 'Error, El curso no existe';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
    END

    -- Validar que el usuario tenga el rol de estudiante
    IF (SELECT * FROM proyecto1.UsuarioRole INNER JOIN proyecto1.Roles R2 on R2.Id = UsuarioRole.RoleId
                 WHERE IsLatestVersion = 1 AND UserId = (SELECT Id FROM proyecto1.Usuarios WHERE Email = @Email) AND R2.RoleName = 'Student') IS NULL
    BEGIN
        SET @ErrorMessage = 'Error, El usuario no tiene actualmente el rol de estudiante';
        SET @ErrorSeverity = 16;
        RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
        RETURN;
        END
    BEGIN TRY
        BEGIN TRANSACTION;

        --setear las demas con 0
        UPDATE proyecto1.UsuarioRole SET IsLatestVersion = 0 WHERE UserId = @UserId;

        -- Insertar en la tabla UsuarioRole
        SET @UserId = (SELECT Id FROM proyecto1.Usuarios WHERE Email = @Email);
        INSERT INTO proyecto1.UsuarioRole (RoleId, UserId, IsLatestVersion)
        VALUES (@RoleId, @UserId, 1);


        IF EXISTS(SELECT * FROM proyecto1.TutorProfile WHERE UserId = @UserId)
            BEGIN
                SET @TutorCode = (SELECT TutorCode FROM proyecto1.TutorProfile WHERE UserId = @UserId);
            END;
        ELSE
            BEGIN
                SET @TutorCode = NEWID();
                -- Insertar en la tabla TutorProfile
                INSERT INTO proyecto1.TutorProfile (UserId, TutorCode)
                VALUES (@UserId, @TutorCode);
            END;

        -- Insertar en la tabla CourseTutor
        INSERT INTO proyecto1.CourseTutor (TutorId, CourseCodCourse)
        VALUES (@TutorCode, @CodCourse);

        -- Insertar en la tabla Notification
        INSERT INTO proyecto1.Notification (UserId, Message, Date)
        VALUES (@UserId, 'Se le ha asignado el rol de tutor en el curso ' + CAST(@CodCourse AS NVARCHAR), GETDATE());

        PRINT 'El usuario se le ha asignado tambien el rol tutor satisfactoriamente';

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        SET @ErrorMessage = ERROR_MESSAGE();
        INSERT INTO proyecto1.HistoryLog (Date, Description)
        VALUES (GETDATE(), 'Error asignacion de Tutor - ' + @ErrorMessage);
        PRINT 'Asignacion de tutor instatisfactoria';
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH;
END;
