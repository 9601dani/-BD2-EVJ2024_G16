-- Insertar 10 registros en la tabla [proyecto1].[Usuarios] con GUIDs predefinidos
INSERT INTO [proyecto1].[Usuarios] (
    [Id],
    [Firstname],
    [Lastname],
    [Email],
    [DateOfBirth],
    [Password],
    [LastChanges],
    [EmailConfirmed]
) VALUES
    ('C2FEEE70-4DE4-11EC-81D3-0242AC130003', 'John', 'Doe', 'john.doe@example.com', '1985-05-15 00:00:00', 'Password123!', '2024-06-19 10:00:00', 1),
    ('C2FEEE71-4DE4-11EC-81D3-0242AC130003', 'Jane', 'Smith', 'jane.smith@example.com', '1990-07-20 00:00:00', 'SecurePass456!', '2024-06-19 10:05:00', 0),
    ('C2FEEE72-4DE4-11EC-81D3-0242AC130003', 'Michael', 'Johnson', 'michael.johnson@example.com', '1978-03-10 00:00:00', 'MikeJ@789!', '2024-06-19 10:10:00', 1),
    ('C2FEEE73-4DE4-11EC-81D3-0242AC130003', 'Emily', 'Davis', 'emily.davis@example.com', '1982-11-30 00:00:00', 'Emily!1234', '2024-06-19 10:15:00', 1),
    ('C2FEEE74-4DE4-11EC-81D3-0242AC130003', 'Chris', 'Brown', 'chris.brown@example.com', '1995-01-25 00:00:00', 'Chris123*Secure', '2024-06-19 10:20:00', 0),
    ('C2FEEE75-4DE4-11EC-81D3-0242AC130003', 'Sarah', 'Wilson', 'sarah.wilson@example.com', '1989-09-15 00:00:00', 'Sarah789!', '2024-06-19 10:25:00', 1),
    ('C2FEEE76-4DE4-11EC-81D3-0242AC130003', 'David', 'Taylor', 'david.taylor@example.com', '1975-12-05 00:00:00', 'David_Taylor@456', '2024-06-19 10:30:00', 0),
    ('C2FEEE77-4DE4-11EC-81D3-0242AC130003', 'Laura', 'Moore', 'laura.moore@example.com', '1998-04-18 00:00:00', 'LauraSecure987', '2024-06-19 10:35:00', 1),
    ('C2FEEE78-4DE4-11EC-81D3-0242AC130003', 'Robert', 'Anderson', 'robert.anderson@example.com', '1984-06-25 00:00:00', 'Rob123*Secure!', '2024-06-19 10:40:00', 1),
    ('C2FEEE79-4DE4-11EC-81D3-0242AC130003', 'Olivia', 'Thomas', 'olivia.thomas@example.com', '1993-08-12 00:00:00', 'Olivia!Secure123', '2024-06-19 10:45:00', 0);


-- Insertar roles en la tabla [proyecto1].[Roles] con GUIDs predefinidos
INSERT INTO [proyecto1].[Roles] (
    [Id],
    [RoleName]
) VALUES
    ('D3E2A4F0-4DE4-11EC-81D3-0242AC130003', 'Student'),
    ('D3E2A4F1-4DE4-11EC-81D3-0242AC130003', 'Tutor');


-- Insertar roles asignados en la tabla [proyecto1].[UsuarioRole]
INSERT INTO [proyecto1].[UsuarioRole] (
    [RoleId],
    [UserId],
    [IsLatestVersion]
)
VALUES
    -- Asignación de rol "Student"
    ('D3E2A4F0-4DE4-11EC-81D3-0242AC130003', 'C2FEEE70-4DE4-11EC-81D3-0242AC130003', 1),  -- John Doe
    ('D3E2A4F0-4DE4-11EC-81D3-0242AC130003', 'C2FEEE71-4DE4-11EC-81D3-0242AC130003', 1),  -- Jane Smith
    ('D3E2A4F0-4DE4-11EC-81D3-0242AC130003', 'C2FEEE72-4DE4-11EC-81D3-0242AC130003', 1),  -- Michael Johnson
    ('D3E2A4F0-4DE4-11EC-81D3-0242AC130003', 'C2FEEE73-4DE4-11EC-81D3-0242AC130003', 1),  -- Emily Davis
    ('D3E2A4F0-4DE4-11EC-81D3-0242AC130003', 'C2FEEE74-4DE4-11EC-81D3-0242AC130003', 1),  -- Chris Brown
    ('D3E2A4F0-4DE4-11EC-81D3-0242AC130003', 'C2FEEE75-4DE4-11EC-81D3-0242AC130003', 1),  -- Sarah Wilson
    ('D3E2A4F0-4DE4-11EC-81D3-0242AC130003', 'C2FEEE76-4DE4-11EC-81D3-0242AC130003', 1),  -- David Taylor
    ('D3E2A4F0-4DE4-11EC-81D3-0242AC130003', 'C2FEEE77-4DE4-11EC-81D3-0242AC130003', 1),  -- Laura Moore
    ('D3E2A4F0-4DE4-11EC-81D3-0242AC130003', 'C2FEEE78-4DE4-11EC-81D3-0242AC130003', 1),  -- Robert Anderson
    ('D3E2A4F0-4DE4-11EC-81D3-0242AC130003', 'C2FEEE79-4DE4-11EC-81D3-0242AC130003', 1);  -- Olivia Thomas

-- Insertar 10 registros en la tabla [proyecto1].[Course]
INSERT INTO [proyecto1].[Course] (
    [CodCourse],
    [Name],
    [CreditsRequired]
)
VALUES
    (0001, 'ETICA PROFESIONAL', 3),
    (0005, 'TECNICAS DE ESTUDIO E INVESTIGACION', 4),
    (0006, 'IDIOMA TECNICO 1', 3),
    (0014, 'ECONOMIA', 4),
    (0017, 'AREA SOCIAL HUMANISITICA 1', 4),
    (0018, 'FILOSOFIA DE LA CIENCIA', 3),
    (0019, 'AREA SOCIAL HUMANISTICA 2', 3),
    (0022, 'PSICOLOGIA INDUSTRIAL', 4),
    (0027, 'BIOLOGIA', 4),
    (0030, 'GEOGRAFIA', 3);

-- Insertar registros en la tabla [proyecto1].[CourseAssignment] asignando usuarios a cursos
INSERT INTO [proyecto1].[CourseAssignment] (
    [StudentId],
    [CourseCodCourse]
)
    VALUES
    -- Asignación de cursos a los estudiantes
    ('C2FEEE70-4DE4-11EC-81D3-0242AC130003', 0001),  -- John Doe - ETICA PROFESIONAL
    ('C2FEEE71-4DE4-11EC-81D3-0242AC130003', 0005),  -- Jane Smith - TECNICAS DE ESTUDIO E INVESTIGACION
    ('C2FEEE72-4DE4-11EC-81D3-0242AC130003', 0006),  -- Michael Johnson - IDIOMA TECNICO 1
    ('C2FEEE73-4DE4-11EC-81D3-0242AC130003', 0014), -- Emily Davis - ECONOMIA
    ('C2FEEE74-4DE4-11EC-81D3-0242AC130003', 0017), -- Chris Brown - AREA SOCIAL HUMANISITICA 1
    ('C2FEEE75-4DE4-11EC-81D3-0242AC130003', 0018), -- Sarah Wilson - FILOSOFIA DE LA CIENCIA
    ('C2FEEE76-4DE4-11EC-81D3-0242AC130003', 0019), -- David Taylor - AREA SOCIAL HUMANISTICA 2
    ('C2FEEE77-4DE4-11EC-81D3-0242AC130003', 0022), -- Laura Moore - PSICOLOGIA INDUSTRIAL
    ('C2FEEE78-4DE4-11EC-81D3-0242AC130003', 0027), -- Robert Anderson - BIOLOGIA
    ('C2FEEE79-4DE4-11EC-81D3-0242AC130003', 0030); -- Olivia Thomas - GEOGRAFIA


-- Insertar 10 registros en la tabla [proyecto1].[Usuarios] con GUIDs predefinidos
INSERT INTO [proyecto1].[Usuarios] (
    [Id],
    [Firstname],
    [Lastname],
    [Email],
    [DateOfBirth],
    [Password],
    [LastChanges],
    [EmailConfirmed]
) VALUES
    ('C2FEEE10-4DE4-11EC-81D3-0242AC130003', 'ROGELIO ALFREDO', 'SALAZAR DE LEON', 'rogelio.salazar@example.com', '1985-05-15 00:00:00', 'Password123!', '2024-06-19 10:00:00', 1),
    ('C2FEEE11-4DE4-11EC-81D3-0242AC130003', 'CARLOS ENRIQUE', 'GOMEZ DONIS', 'carlos.gomez@example.com', '1990-07-20 00:00:00', 'SecurePass456!', '2024-06-19 10:05:00', 0),
    ('C2FEEE12-4DE4-11EC-81D3-0242AC130003', 'ERICKA NATHALIE', 'LOPEZ TORRES', 'ericka.lopez@example.com', '1978-03-10 00:00:00', 'MikeJ@789!', '2024-06-19 10:10:00', 1),
    ('C2FEEE13-4DE4-11EC-81D3-0242AC130003', 'SORAYA DEL ROSARIO', 'MARTINEZ SUM', 'soraya.martinez@example.com', '1982-11-30 00:00:00', 'Emily!1234', '2024-06-19 10:15:00', 1),
    ('C2FEEE14-4DE4-11EC-81D3-0242AC130003', 'ILEANA GUISELA', 'RALDA RODRIGUEZ', 'ileana.ralda@example.com', '1995-01-25 00:00:00', 'Chris123*Secure', '2024-06-19 10:20:00', 0),
    ('C2FEEE15-4DE4-11EC-81D3-0242AC130003', 'AMA VELA', 'CASTRO MELLADO', 'ana.castro@example.com', '1989-09-15 00:00:00', 'Sarah789!', '2024-06-19 10:25:00', 1),
    ('C2FEEE16-4DE4-11EC-81D3-0242AC130003', 'MILDRED CATALINA', 'HERNANDEZ RALDAN', 'mildred.hernandez@example.com', '1975-12-05 00:00:00', 'David_Taylor@456', '2024-06-19 10:30:00', 0),
    ('C2FEEE17-4DE4-11EC-81D3-0242AC130003', 'HILDA MYRIAM', 'MeNDEZ CASTILLO', 'hilda.mendez@example.com', '1998-04-18 00:00:00', 'LauraSecure987', '2024-06-19 10:35:00', 1),
    ('C2FEEE18-4DE4-11EC-81D3-0242AC130003', 'PABLO ENRIQUE', 'MORALES PANIAGUA', 'pablo.morales@example.com', '1984-06-25 00:00:00', 'Rob123*Secure!', '2024-06-19 10:40:00', 1),
    ('C2FEEE19-4DE4-11EC-81D3-0242AC130003', 'CINTHYA PATRICIA', 'ORTIZ QUIROA', 'cinthya.ortiz@example.com', '1993-08-12 00:00:00', 'Olivia!Secure123', '2024-06-19 10:45:00', 0);

-- Insertar registros en la tabla [proyecto1].[CourseTutor] asignando usuarios a cursos
INSERT INTO [proyecto1].[CourseTutor] (
    [TutorId],
    [CourseCodCourse]
)
    VALUES
    -- Asignación de cursos a los estudiantes
    ('C2FEEE10-4DE4-11EC-81D3-0242AC130003', 0001),
    ('C2FEEE11-4DE4-11EC-81D3-0242AC130003', 0005),
    ('C2FEEE12-4DE4-11EC-81D3-0242AC130003', 0006),
    ('C2FEEE13-4DE4-11EC-81D3-0242AC130003', 0014),
    ('C2FEEE14-4DE4-11EC-81D3-0242AC130003', 0017),
    ('C2FEEE15-4DE4-11EC-81D3-0242AC130003', 0018),
    ('C2FEEE16-4DE4-11EC-81D3-0242AC130003', 0019),
    ('C2FEEE17-4DE4-11EC-81D3-0242AC130003', 0022),
    ('C2FEEE18-4DE4-11EC-81D3-0242AC130003', 0027),
    ('C2FEEE19-4DE4-11EC-81D3-0242AC130003', 0030);

-- Insertar registros en la tabla [proyecto1].[ProfileStudent] asignando créditos a los estudiantes
INSERT INTO [proyecto1].[ProfileStudent] (
    [UserId],
    [Credits]
)
VALUES
    ('C2FEEE70-4DE4-11EC-81D3-0242AC130003', 87),   -- John Doe - 87 créditos
    ('C2FEEE71-4DE4-11EC-81D3-0242AC130003', 150),  -- Jane Smith - 150 créditos
    ('C2FEEE72-4DE4-11EC-81D3-0242AC130003', 121),  -- Michael Johnson - 121 créditos
    ('C2FEEE73-4DE4-11EC-81D3-0242AC130003', 192),  -- Emily Davis - 192 créditos
    ('C2FEEE74-4DE4-11EC-81D3-0242AC130003', 63),   -- Chris Brown - 63 créditos
    ('C2FEEE75-4DE4-11EC-81D3-0242AC130003', 137),  -- Sarah Wilson - 137 créditos
    ('C2FEEE76-4DE4-11EC-81D3-0242AC130003', 45),   -- David Taylor - 45 créditos
    ('C2FEEE77-4DE4-11EC-81D3-0242AC130003', 175),  -- Laura Moore - 175 créditos
    ('C2FEEE78-4DE4-11EC-81D3-0242AC130003', 99),   -- Robert Anderson - 99 créditos
    ('C2FEEE79-4DE4-11EC-81D3-0242AC130003', 182);  -- Olivia Thomas - 182 créditos
