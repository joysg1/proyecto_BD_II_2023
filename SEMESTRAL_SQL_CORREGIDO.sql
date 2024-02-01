create database PanasystemEst

use PanasystemEst

CREATE TABLE Estudiantes (
    ID_Estudiante INT PRIMARY KEY,
    Cedula VARCHAR(20) UNIQUE,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Correo VARCHAR(100) UNIQUE,
    Fecha_Nacimiento DATE,
    Genero CHAR(1) CHECK (Genero IN ('M', 'F'))
);


CREATE TABLE Profesores (
    ID_Profesor INT PRIMARY KEY,
    Nombre_Profesor VARCHAR(50),
    Apellido_Profesor VARCHAR(50),
	Correo VARCHAR(100) UNIQUE,
	Telefono VARCHAR (25),
	Celular VARCHAR(25),
    Cedula VARCHAR(20) UNIQUE,
	Genero CHAR(1) CHECK (Genero IN ('M', 'F'))
);

CREATE TABLE Materias (
    ID_Materia INT PRIMARY KEY,
    Nombre_Materia VARCHAR(50),
	Descripcion_Materia varchar(50),
    ID_Profesor INT,
    FOREIGN KEY (ID_Profesor) REFERENCES Profesores(ID_Profesor)
);


CREATE TABLE Sedes (
    ID_Sede INT PRIMARY KEY,
    Nombre_Sede VARCHAR(50) DEFAULT 'La Chorrera'
);

CREATE TABLE Estados (
    ID_Estado INT PRIMARY KEY,
    Estado VARCHAR(50) CHECK (Estado IN ('Retirado', 'Activo', 'Finalizado', 'Pausado'))
);


CREATE TABLE Consejeros (
    ID_Consejero INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
	Correo VARCHAR(100) UNIQUE,
	Telefono varchar (50),
	Celular varchar (50),
	Cedula VARCHAR(20) UNIQUE,
	Genero CHAR(1) CHECK (Genero IN ('M', 'F'))
);

CREATE TABLE Observaciones (
    ID_Observacion INT PRIMARY KEY,
    ID_Estudiante INT,
    Observacion TEXT DEFAULT 'Observacion',
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiantes(ID_Estudiante)
);

CREATE TABLE Contactos (
    ID_Contacto INT PRIMARY KEY,
    ID_Estudiante INT,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Cedula VARCHAR(20) UNIQUE,
    Parentezco VARCHAR(20) CHECK (Parentezco IN ('Padre', 'Madre', 'Otro')),
    Genero CHAR(1) CHECK (Genero IN ('F', 'M')),
    Celular VARCHAR(20),
    Telefono_Fijo VARCHAR(20),
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiantes(ID_Estudiante)
);


CREATE TABLE Direccion_Estudiantes (
    ID_Direccion INT PRIMARY KEY,
    ID_Estudiante INT,
    Direccion VARCHAR(255),
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiantes(ID_Estudiante)
);


CREATE TABLE Estudiantes_Sedes (
    ID_Estudiante INT,
    ID_Sede INT,
    PRIMARY KEY (ID_Estudiante, ID_Sede),
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiantes(ID_Estudiante),
    FOREIGN KEY (ID_Sede) REFERENCES Sedes(ID_Sede)
);


CREATE TABLE Estudiantes_Estados (
    ID_Estudiante INT,
    ID_Estado INT,
    Fecha_Inicio DATE,
    Fecha_Fin DATE,
    PRIMARY KEY (ID_Estudiante, ID_Estado, Fecha_Inicio),
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiantes(ID_Estudiante),
    FOREIGN KEY (ID_Estado) REFERENCES Estados(ID_Estado)
);


CREATE TABLE Estudiantes_Consejeros (
    ID_Estudiante INT,
    ID_Consejero INT,
    PRIMARY KEY (ID_Estudiante, ID_Consejero),
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiantes(ID_Estudiante),
    FOREIGN KEY (ID_Consejero) REFERENCES Consejeros(ID_Consejero)
);


CREATE TABLE Estudiantes_Materias (
    ID_Estudiante INT,
    ID_Materia INT,
    PRIMARY KEY (ID_Estudiante, ID_Materia),
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiantes(ID_Estudiante),
    FOREIGN KEY (ID_Materia) REFERENCES Materias(ID_Materia)
);


CREATE TABLE Notas (
    ID_Nota INT PRIMARY KEY,
    ID_Estudiante INT,
    ID_Materia INT,
    Nota FLOAT CHECK (Nota BETWEEN 1 AND 5),
    FOREIGN KEY (ID_Estudiante) REFERENCES Estudiantes(ID_Estudiante),
    FOREIGN KEY (ID_Materia) REFERENCES Materias(ID_Materia)
);


--- Insercion de datos

--- Insercion tabla Estudiantes

INSERT INTO Estudiantes (ID_Estudiante, Cedula, Nombre, Apellido, Correo, Fecha_Nacimiento, Genero)
VALUES
    (100, '8-123-456', 'Juan', 'Perez', 'juan@gmail.com', '2008-05-15', 'M'),
    (101, '8-234-567', 'Maria', 'Gonzalez', 'maria@hotmail.com', '2008-09-20', 'F'),
    (102, '8-345-678', 'Pedro', 'Rodriguez', 'pedro@yahoo.com', '2007-11-10', 'M'),
    (103, '8-456-789', 'Laura', 'Lopez', 'laura@gmail.com', '2007-03-25', 'F'),
    (104, '8-567-890', 'Carlos', 'Martinez', 'carlos@yahoo.com', '2006-07-12', 'M'),
    (105, '8-678-901', 'Ana', 'Sanchez', 'ana@gmail.com', '2007-12-30', 'F'),
    (106, '8-789-012', 'Diego', 'Hernandez', 'diego@hotmail.com', '2009-08-05', 'M'),
    (107, '8-890-123', 'Sofia', 'Diaz', 'sofia@yahoo.com', '2008-02-18', 'F'),
    (108, '8-901-234', 'Luis', 'Ramirez', 'luis@gmail.com', '2006-06-28', 'M'),
    (109, '8-012-345', 'Elena', 'Torres', 'elena@hotmail.com', '2005-04-07', 'F');


	select * from estudiantes

--- Insercion tabla profesores
INSERT INTO Profesores (ID_Profesor, Nombre_Profesor, Apellido_Profesor, Correo, Telefono, Celular, Cedula, Genero)
VALUES
    (200, 'Alejandro', 'Gómez', 'alejandro678@gmail.com', '322-4567', '6667-65432', '8-876-543', 'M'),
    (201, 'Isabel', 'Hernández', 'isabel_75@hotmail.com', '311-2223', '6599-8887', '4-234-567', 'F'),
    (202, 'Martín', 'López', 'martin_erty@yahoo.com', '355-4445', '6686-7778', '6-456-789', 'M'),
    (203, 'Laura', 'Fernández', 'laura_ui9@gmail.com', '355-6667', '6373-2221', '5-678-901', 'F'),
    (204, 'Carlos', 'Martínez', 'carlos_mart@gmail.com', '377-8889', '6434-5556', '8-890-123', 'M'),
    (205, 'Ana', 'García', 'ana_gar_99@hotmail.com', '399-0001', '6790-1367', '3-012-345', 'F'),
    (206, 'Pedro', 'Sánchez', 'pedro_77@yahoo.com', '311-2223', '6430-4321', '3-234-567', 'M');

Select * from profesores

--- Insercion tabla materias
INSERT INTO Materias (ID_Materia, Nombre_Materia, Descripcion_Materia, ID_Profesor)
VALUES
    (300, 'Matemáticas', 'plan_actualizado_2023', 200),    -- Profesor Alejandro
    (301, 'Ciencias Naturales', 'plan_2022', 201),         -- Profesora Isabel
    (302, 'Lengua y Literatura', 'plan_2023', 202),        -- Profesor Martín
    (303, 'Historia', 'plan_2023', 203),                   -- Profesora Laura
    (304, 'Informática', 'plan_2022', 204),                -- Profesor Carlos
    (305, 'Tecnología', 'plan_actualizado_2023', 205),     -- Profesora Ana
    (306, 'Física', 'plan_2023', 206);                     -- Profesor Pedro

select * from materias


--- Insercion tabla sede
INSERT INTO SEDES (ID_SEDE)
VALUES (400)

select * from sedes


--- Insercion tabla estados
INSERT INTO Estados (ID_Estado, Estado)
VALUES
    (400, 'Retirado'),
    (401, 'Activo'),
    (402, 'Finalizado'),
    (403, 'Pausado');

select * from estados

--- Insercion tabla consejeros

INSERT INTO Consejeros (ID_Consejero, Nombre, Apellido, Correo, Telefono, Celular, Cedula, Genero)
VALUES
    (500, 'Ana', 'González', 'ana.gonzalez@gmail.com', '259-6789', '6219-9077', '8-765-432', 'F'),
    (501, 'María', 'Martínez', 'maria.martinez@outlook.com', '277-9055', '6349-7054', '4-321-098', 'F'),
    (502, 'Laura', 'Pérez', 'laura12.perez@hotmail.com', '341-7899', '6190-4522', '6-543-210', 'F'),
    (503, 'Pedro', 'López', 'pedro_90.lopez@gmail.com', '332-8911', '6790-1234', '3-876-543', 'M'),
    (504, 'Sofía', 'Hernández', 'sofia_88.hernandez@gmail.com', '239-1290', '6891-3421', '8-231-332', 'F'),
    (505, 'Luis', 'Gómez', 'luis.gomez90@hotmail.com', '259-9744', '6345-5699', '8-1467-932', 'M'),
    (506, 'Elena', 'Ruiz', 'elena76.ruiz@gmail.com', '267-2134', '6211-6411', '3-304-118', 'F');

	select * from consejeros

--- Insercion tabla observaciones

INSERT INTO Observaciones (ID_Observacion, ID_Estudiante, Observacion)
VALUES
    (600, 100, 'Buen desempeño en Matemáticas.'),
    (601, 101, 'Participación destacada en Ciencias Naturales.'),
    (602, 102, 'Mejora significativa en Lengua y Literatura.'),
    (603, 103, 'Comprometida con Historia, excelentes trabajos.'),
    (604, 104, 'Habilidad destacada en Informática.'),
    (605, 105, 'Interés genuino en la materia de Tecnología.'),
    (606, 106, 'Destaca en Física, se recomienda retos adicionales.'),
    (607, 107, 'Excelente progreso en todas las materias.'),
    (608, 108, 'Participación activa en clase, muy buen desempeño.'),
    (609, 109, 'Mostrando habilidades prometedoras en diversas materias.');

	select * from observaciones

--- Insercion tabla contactos

INSERT INTO Contactos (ID_Contacto, ID_Estudiante, Nombre, Apellido, Cedula, Parentezco, Genero, Celular, Telefono_Fijo)
VALUES
    (700, 100, 'Sebastian', 'Alvarado', '8-234-567', 'Padre', 'M', '6218-9033', '340-3322'),
    (701, 101, 'Rosemary', 'González', '8-345-678', 'Madre', 'F', '6228-9144', '341-3433'),
    (702, 102, 'Vanesa', 'Martínez', '3-456-789', 'Madre', 'F', '6339-9275', '352-3544'),
    (703, 103, 'Hector', 'Rodríguez', '4-567-890', 'Otro', 'M', '6440-9306', '363-3655'),
    (704, 104, 'Elvia', 'Fernández', '5-678-901', 'Otro', 'F', '6551-9437', '374-3766'),
    (705, 105, 'Joel', 'López', '6-789-012', 'Otro', 'M', '6662-9568', '385-3877'),
    (706, 106, 'Beisi', 'Gómez', '8-890-123', 'Madre', 'F', '6773-9699', '396-3988'),
    (707, 107, 'Ines', 'Hernández', '3-901-234', 'Otro', 'F', '6884-9730', '307-4099'),
    (708, 108, 'Julio', 'Díaz', '4-012-345', 'Padre', 'M', '6995-9861', '318-4210'),
    (709, 109, 'Juan', 'Ruiz', '5-123-456', 'Otro', 'M', '6006-9992', '329-4321');

select * from contactos

--- Insercion tabla direccion_estudiante
INSERT INTO Direccion_Estudiantes (ID_Direccion, ID_Estudiante, Direccion)
VALUES
    (800, 100, 'Arraiján'),
    (801, 101, 'La Chorrera'),
    (802, 102, 'La Chorrera'),
    (803, 103, 'Vista Alegre'),
    (804, 104, 'Burunga'),
    (805, 105, 'La Chorrera'),
    (806, 106, 'Nuevo Chorrillo'),
    (807, 107, 'Ciudad Futuro'),
    (808, 108, 'La Chorrera'),
    (809, 109, 'Arraiján');

	select * from Direccion_Estudiantes

--- Insercion tabla Estudiantes_Sedes

INSERT INTO Estudiantes_Sedes (ID_Estudiante, ID_Sede)
VALUES
    (100, 400),
    (101, 400),
    (102, 400),
    (103, 400),
    (104, 400),
    (105, 400),
    (106, 400),
    (107, 400),
    (108, 400),
    (109, 400);

select * from Estudiantes_Sedes

--- Insercion tabla Estudiantes_estados

INSERT INTO Estudiantes_Estados (ID_Estudiante, ID_Estado, Fecha_Inicio, Fecha_Fin)
VALUES
    (100, 401, '2023-03-15', NULL),   
    (101, 401, '2023-03-15', NULL),  
    (102, 401, '2023-03-15', NULL),  
    (103, 401, '2023-03-15', NULL),  
    (104, 401, '2023-03-15', NULL),  
    (105, 401, '2023-03-15', NULL),  
    (106, 401, '2023-03-15', NULL),
    (107, 401, '2023-03-15', NULL),   
    (108, 401, '2023-03-15', NULL),  
    (109, 401, '2023-03-15', NULL);  --- Todos los estudiantes estan activos: estado 401

select * from Estudiantes_Estados

--- Insercion tabla Estudiantes_Consejeros

INSERT INTO Estudiantes_Consejeros (ID_Estudiante, ID_Consejero)
VALUES
    (100, 500),
    (101, 501),
    (102, 502),
    (103, 503),
    (104, 504),
    (105, 505),
    (106, 506),
    (107, 504),
    (108, 505),
    (109, 506);

select * from Estudiantes_Consejeros

--- Insercion tabla Estudiantes_Materias

INSERT INTO Estudiantes_Materias (ID_Estudiante, ID_Materia)
VALUES
    (100, 300), (100, 301), (100, 302), (100, 303), (100, 304), (100, 305), (100, 306),
    (101, 300), (101, 301), (101, 302), (101, 303), (101, 304), (101, 305), (101, 306),
    (102, 300), (102, 301), (102, 302), (102, 303), (102, 304), (102, 305), (102, 306),
    (103, 300), (103, 301), (103, 302), (103, 303), (103, 304), (103, 305), (103, 306),
    (104, 300), (104, 301), (104, 302), (104, 303), (104, 304), (104, 305), (104, 306),
    (105, 300), (105, 301), (105, 302), (105, 303), (105, 304), (105, 305), (105, 306),
    (106, 300), (106, 301), (106, 302), (106, 303), (106, 304), (106, 305), (106, 306),
    (107, 300), (107, 301), (107, 302), (107, 303), (107, 304), (107, 305), (107, 306),
    (108, 300), (108, 301), (108, 302), (108, 303), (108, 304), (108, 305), (108, 306),
    (109, 300), (109, 301), (109, 302), (109, 303), (109, 304), (109, 305), (109, 306);

select * from Estudiantes_Materias

--- Insercion tabla Notas


INSERT INTO Notas (ID_Nota, ID_Estudiante, ID_Materia, Nota)
VALUES
    -- Notas para el estudiante 100 en cada materia
    (1001, 100, 300, 4.5), -- Matemáticas
    (1002, 100, 301, 3.8), -- Ciencias Naturales
    (1003, 100, 302, 4.2), -- Lengua y Literatura
    (1004, 100, 303, 4.0), -- Historia
    (1005, 100, 304, 4.1), -- Informática
    (1006, 100, 305, 2.5), -- Tecnología
    (1007, 100, 306, 4.3), -- Física

    -- Notas para el estudiante 101 en cada materia
    (1008, 101, 300, 3.7), -- Matemáticas
    (1009, 101, 301, 4.5), -- Ciencias Naturales
    (1010, 101, 302, 3.2), -- Lengua y Literatura
    (1011, 101, 303, 4.0), -- Historia
    (1012, 101, 304, 4.3), -- Informática
    (1013, 101, 305, 3.8), -- Tecnología
    (1014, 101, 306, 4.6), -- Física

	-- Notas para el estudiante 102 en cada materia
    (1015, 102, 300, 5.0), -- Matemáticas
    (1016, 102, 301, 4.5), -- Ciencias Naturales
    (1017, 102, 302, 5.0), -- Lengua y Literatura
    (1018, 102, 303, 4.7), -- Historia
    (1019, 102, 304, 4.4), -- Informática
    (1020, 102, 305, 3.9), -- Tecnología
    (1021, 102, 306, 4.1), -- Física

	-- Notas para el estudiante 103 en cada materia
    (1022, 103, 300, 4.0), -- Matemáticas
    (1023, 103, 301, 3.5), -- Ciencias Naturales
    (1024, 103, 302, 3.0), -- Lengua y Literatura
    (1025, 103, 303, 3.2), -- Historia
    (1026, 103, 304, 4.8), -- Informática
    (1027, 103, 305, 3.5), -- Tecnología
    (1028, 103, 306, 2.7), -- Física

	-- Notas para el estudiante 104 en cada materia
    (1029, 104, 300, 3.0), -- Matemáticas
    (1030, 104, 301, 4.5), -- Ciencias Naturales
    (1031, 104, 302, 5.0), -- Lengua y Literatura
    (1032, 104, 303, 4.4), -- Historia
    (1033, 104, 304, 4.8), -- Informática
    (1034, 104, 305, 4.5), -- Tecnología
    (1035, 104, 306, 4.8), -- Física

	-- Notas para el estudiante 105 en cada materia
   (1036, 105, 300, 3.5), -- Matemáticas
   (1037, 105, 301, 4.0), -- Ciencias Naturales
   (1038, 105, 302, 4.2), -- Lengua y Literatura
   (1039, 105, 303, 3.8), -- Historia
   (1040, 105, 304, 4.0), -- Informática
   (1041, 105, 305, 4.1), -- Tecnología
   (1042, 105, 306, 3.9), -- Física

-- Notas para el estudiante 106 en cada materia
   (1043, 106, 300, 4.0), -- Matemáticas
   (1044, 106, 301, 3.5), -- Ciencias Naturales
   (1045, 106, 302, 3.9), -- Lengua y Literatura
   (1046, 106, 303, 4.1), -- Historia
   (1047, 106, 304, 4.2), -- Informática
   (1048, 106, 305, 4.0), -- Tecnología
   (1049, 106, 306, 3.7), -- Física

-- Notas para el estudiante 107 en cada materia
   (1050, 107, 300, 3.8), -- Matemáticas
   (1051, 107, 301, 3.7), -- Ciencias Naturales
   (1052, 107, 302, 3.9), -- Lengua y Literatura
   (1053, 107, 303, 3.6), -- Historia
   (1054, 107, 304, 3.8), -- Informática
   (1055, 107, 305, 3.5), -- Tecnología
   (1056, 107, 306, 3.9), -- Física

  -- Notas para el estudiante 108 en cada materia
   (1057, 108, 300, 4.1), -- Matemáticas
   (1058, 108, 301, 4.2), -- Ciencias Naturales
   (1059, 108, 302, 4.0), -- Lengua y Literatura
   (1060, 108, 303, 4.3), -- Historia
   (1061, 108, 304, 4.5), -- Informática
   (1062, 108, 305, 4.2), -- Tecnología
   (1063, 108, 306, 4.4), -- Física

   -- Notas para el estudiante 109 en cada materia
  (1064, 109, 300, 3.7), -- Matemáticas
  (1065, 109, 301, 4.5), -- Ciencias Naturales
  (1066, 109, 302, 3.2), -- Lengua y Literatura
  (1067, 109, 303, 4.0), -- Historia
  (1068, 109, 304, 4.3), -- Informática
  (1069, 109, 305, 3.8), -- Tecnología
  (1070, 109, 306, 4.6); -- Física

  select * from Notas

--- Consultas

  select * from Direccion_Estudiantes

  --- 1. Nombre, Apellido y direccion de los estudiantes que no tienen como direccion la chorrera

SELECT e.Nombre, e.Apellido, d.Direccion
FROM Estudiantes e
JOIN Direccion_Estudiantes d ON e.ID_Estudiante = d.ID_Estudiante
WHERE d.Direccion <> 'La Chorrera';

--- 2. Nombre de las materias y descripcion junto con el nombre y apellido del
--- profesor que dicta las materias cuyo plan sea: plan_2022.
--- Ordenar de forma descendente por apellido del profesor


SELECT m.Nombre_Materia, m.Descripcion_Materia, p.Nombre_Profesor, p.Apellido_Profesor
FROM Materias m
JOIN Profesores p ON m.ID_Profesor = p.ID_Profesor
WHERE m.Descripcion_Materia = 'plan_2022'
ORDER BY p.Apellido_Profesor DESC;

--- 3. Verifica si hay algun estudiante con estado retirado

IF EXISTS (
    SELECT 1
    FROM Estudiantes_Estados
    WHERE ID_Estado = 400 -- El ID_Estado para "Retirado"
)
    SELECT 'Existen estudiantes con estado Retirado' as Verificacion
ELSE
    SELECT 'No hay estudiantes con estado Retirado' as Verificacion;


--- 4. Nombre y Apellido de los estudiantes que tienen 
--- como contactos a su padre o madre (empleando union)

SELECT E.Nombre, E.Apellido, C.Parentezco
FROM Estudiantes E
INNER JOIN Contactos C ON E.ID_Estudiante = C.ID_Estudiante
WHERE C.Parentezco = 'Padre'

UNION

SELECT E.Nombre, E.Apellido, C.Parentezco
FROM Estudiantes E
INNER JOIN Contactos C ON E.ID_Estudiante = C.ID_Estudiante
WHERE C.Parentezco = 'Madre';


--- 5 Obtener la cantidad de estudiantes por genero

SELECT Genero, COUNT(*) as Cantidad_Estudiantes
FROM Estudiantes
GROUP BY Genero;


--- 6. Obtener la edad actual de los estudiantes 
--- menores de 17 (use group by having)
SELECT Nombre, Apellido, DATEDIFF(YEAR, Fecha_Nacimiento, GETDATE()) AS Edad_Actual
FROM Estudiantes
GROUP BY Nombre, Apellido, Fecha_Nacimiento
HAVING DATEDIFF(YEAR, Fecha_Nacimiento, GETDATE()) < 17;


--- 7. Consulta para conocer las materias y sus respectivos profesores
---- ordenar por apellido del profesor de forma ascendente
SELECT M.Nombre_Materia, P.Nombre_Profesor, P.Apellido_Profesor
FROM Materias M
INNER JOIN Profesores P ON M.ID_Profesor = P.ID_Profesor
order by p.Apellido_Profesor asc


--- 8. Materias y notas del estudiante Juan Perez

SELECT E.Nombre AS Nombre_Estudiante, E.Apellido AS Apellido_Estudiante,
       M.Nombre_Materia AS Materia_Cursando, N.Nota
FROM Estudiantes AS E
INNER JOIN Notas AS N ON E.ID_Estudiante = N.ID_Estudiante
INNER JOIN Materias AS M ON N.ID_Materia = M.ID_Materia
WHERE E.Nombre = 'Juan' AND E.Apellido = 'Perez';

--- 9. Obtener el promedio de las calificaciones de la asignatura historia

SELECT AVG(Nota) AS Promedio_Historia
FROM Notas
WHERE ID_Materia = (
    SELECT ID_Materia
    FROM Materias
    WHERE Nombre_Materia = 'Historia'
);



--- 10. Obtener los estudiantes con nota superior a 4 en matematicas

SELECT e.Nombre, e.Apellido, n.Nota
FROM Estudiantes e
INNER JOIN Notas n ON e.ID_Estudiante = n.ID_Estudiante
INNER JOIN Materias m ON n.ID_Materia = m.ID_Materia
WHERE m.Nombre_Materia = 'Matemáticas' 
  AND n.Nota > 4;

--- 11. Obtener los estudiantes con notas inferiores a 3
--- desplegar un mensaje que diga: este estudiante necesita apoyo
--- academico

SELECT e.Nombre, e.Apellido, m.Nombre_Materia AS Materia, n.Nota,
    CASE 
        WHEN n.Nota < 3 THEN 'Este estudiante necesita apoyo académico'
        
    END AS Observacion
FROM Estudiantes e
INNER JOIN Notas n ON e.ID_Estudiante = n.ID_Estudiante
INNER JOIN Materias m ON n.ID_Materia = m.ID_Materia
WHERE n.Nota < 3;


--- 12. Obtener los estudiantes con notas superiores a 4.5
--- desplegar un mensaje que diga: este estudiante puede
--- optar a una beca

SELECT e.Nombre, e.Apellido, m.Nombre_Materia AS Materia, n.Nota,
    CASE 
        WHEN n.Nota > 4.5 THEN 'El estudiante puede optar a una beca'
        
    END AS Observacion
FROM Estudiantes e
INNER JOIN Notas n ON e.ID_Estudiante = n.ID_Estudiante
INNER JOIN Materias m ON n.ID_Materia = m.ID_Materia
WHERE n.Nota > 4.5;

---Funciones
---FUNCION #1: Notas promedio
use PanasystemEst

CREATE FUNCTION Calcular_PromedioNotas()
RETURNS TABLE
AS
RETURN (
    SELECT
        E.Nombre AS Nombre_Estudiante,
        ROUND(AVG(N.Nota), 2) AS Promedio_Final
    FROM
        Estudiantes E
    JOIN
        Notas N ON E.ID_Estudiante = N.ID_Estudiante
    GROUP BY
        E.Nombre
);

SELECT * FROM Calcular_PromedioNotas() ORDER BY Nombre_Estudiante;


---USO DE LA FUNCIÓN
--Algunos profesores por tener una cantidad grande de estudiantes, desean averiguar
--cuales son los estudiantes con un promedio por encima de 4.00.
--¿Cómo seria mi consulta?





---FUNCION #2: Edad actual de cada estudiante

select * from Estudiantes

CREATE FUNCTION CalcularEdadEstudiantes()
RETURNS TABLE
AS
RETURN (
    SELECT
        E.Nombre AS Nombre_Estudiante,
        DATEDIFF(YEAR, E.Fecha_Nacimiento, GETDATE()) AS Edad
    FROM
        Estudiantes E
);

SELECT * FROM CalcularEdadEstudiantes() ORDER BY Nombre_Estudiante;


----USO DE LA FUNCIÓN.
--Una profesora, esta exigiendo a todo el plantel que realicen una actividad de 
--labor social, sin embargo, es exclusivo para los chicos mayores o que tengan 16 años.
--¿Cómo seria mi consulta?

SELECT * FROM CalcularEdadEstudiantes()
WHERE Edad >= 16
ORDER BY Nombre_Estudiante;




---FUNCIÓN 3: Profesores y sus materias
CREATE FUNCTION ObtenerProfesorMateria()
RETURNS TABLE
AS
RETURN (
    SELECT
        M.Nombre_Materia AS Materia,
        P.Nombre_Profesor AS Profesor
    FROM
        Materias M
    JOIN
        Profesores P ON M.ID_Profesor = P.ID_Profesor
);

SELECT * FROM ObtenerProfesorMateria() ORDER BY Materia;


---Función que determina las profesoras femeninas
CREATE FUNCTION ProMF()
RETURNS TABLE
AS
RETURN (
    SELECT
        M.Nombre_Materia AS Materia,
        P.Nombre_Profesor AS Profesor_Femenino
    FROM
        Materias M
    JOIN
        Profesores P ON M.ID_Profesor = P.ID_Profesor
    WHERE
        P.Genero = 'F'
);
SELECT * FROM ProMF();


---Donde los profesores son masculinos
CREATE FUNCTION ProfMM()
RETURNS TABLE
AS
RETURN (
    SELECT
        M.Nombre_Materia AS Materia,
        P.Nombre_Profesor AS Profesor_Masculino
    FROM
        Materias M
    JOIN
        Profesores P ON M.ID_Profesor = P.ID_Profesor
    WHERE
        P.Genero = 'M'
);

SELECT * FROM ProfMM();

---Algunos nuevos estudiantes no saben cual es el profesor de la materia, ademas
--de que algunos no se presentaron al primer dia de clases, por lo cual, desean
--mantener al contacto con un número de trabajo para contactarse con cada estudiante.
--¿Cuál seria la consulta?

CREATE FUNCTION Telefono_Materia_Profesor()
RETURNS TABLE
AS
RETURN (
    SELECT
        P.Nombre_Profesor AS Profesor,
        P.Telefono AS Numero_Telefono,
        M.Nombre_Materia AS Materia
    FROM
        Profesores P
    JOIN
        Materias M ON P.ID_Profesor = M.ID_Profesor
);

SELECT * FROM Telefono_Materia_Profesor();


---Conocer cual es el profesor de la materia buscada
--Materias: Matemáticas, Ciencias Naturales, Lengua y Literatua
--Historia, Informática, Tecnología, Física.
select * from Materias

SELECT Profesor, Numero_Telefono
FROM Telefono_Materia_Profesor()
WHERE Materia = 'Matemáticas';


---FUNCIÓN #4: Observación sobre los estudiantes hacia sus acudientes
--Suposición: Cada mes, se les entrega una observación a cada acudiente de los estudiante,
--esto con la finalidad de demostrar el comportamiento frente a las clases de cada uno
--de los profesores.


CREATE FUNCTION Info_Estudiantes()
RETURNS TABLE
AS
RETURN (
    SELECT
        E.Nombre AS Nombre_Estudiante,
        O.Observacion,
        C.Parentezco,
        C.Celular
    FROM
        Estudiantes E
    JOIN
        Observaciones O ON E.ID_Estudiante = O.ID_Estudiante
    JOIN
        Contactos C ON E.ID_Estudiante = C.ID_Estudiante
);

SELECT * FROM Info_Estudiantes();


-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para ingresar datos a cada una de las tablas*/
-- Procedimiento para insertar en la tabla Consejero
CREATE PROCEDURE INS_Consejero
@ID INT,
@NOMBRE VARCHAR(50),
@APELLIDO VARCHAR(50),
@CORREO VARCHAR(100),
@TELEFONO VARCHAR(50),
@CELULAR VARCHAR(50),
@CEDULA VARCHAR(20),
@GENERO CHAR(1)
AS
IF EXISTS (SELECT * FROM Consejeros WHERE ID_Consejero = @ID) -- Si existe un registro con este ID manda mensaje de error que ya hay un registro existente
	BEGIN
		PRINT 'Ya existe un registro con este ID.'
	END
ELSE --De otro modo ingresa un registro nuevo
	BEGIN
		INSERT INTO Consejeros(ID_Consejero,Nombre,Apellido,Correo,Telefono,Celular,Cedula,Genero) VALUES (@ID,@NOMBRE,@APELLIDO,@CORREO,@TELEFONO,@CELULAR,@CEDULA,@GENERO) 
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para ingresar datos a cada una de las tablas*/
-- Procedimiento para insertar en la tabla Contactos
CREATE PROCEDURE INS_Contactos
@ID_Contacto INT,
@ID_Estudiante INT,
@NOMBRE VARCHAR(50),
@APELLIDO VARCHAR(50),
@CEDULA VARCHAR(20),
@PARENTEZCO VARCHAR(20),
@GENERO CHAR(1),
@CELULAR VARCHAR(20),
@TELEFONO_FIJO VARCHAR(20)
AS
IF EXISTS (SELECT * FROM Contactos WHERE ID_Contacto = @ID_Contacto) -- Si existe un registro con este ID manda mensaje de error que ya hay un registro existente
	BEGIN
		PRINT 'Ya existe un registro con este ID, porfavor verifique los datos ingresados.'
	END
ELSE -- Inserta un nuevo registro
	BEGIN
		INSERT INTO Contactos (ID_Contacto,ID_Estudiante,Nombre,Apellido,Cedula,Parentezco,Genero,Celular,Telefono_Fijo) VALUES (@ID_Contacto,@ID_Estudiante,@NOMBRE,@APELLIDO,@CEDULA,@PARENTEZCO,@GENERO,@CELULAR,@TELEFONO_FIJO)
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para ingresar datos a cada una de las tablas*/
-- Procedimiento para insertar en la tabla Direccion_Estudiantes
CREATE PROCEDURE INS_Direccion_Estudiantes
@ID_DIRECCION INT,
@ID_ESTUDIANTE INT,
@DIRECCION VARCHAR(225)
AS
IF EXISTS (SELECT * FROM Direccion_Estudiantes WHERE ID_Direccion = @ID_DIRECCION) -- Si existe un registro con este ID manda mensaje de error que ya hay un registro existente
	BEGIN
		PRINT 'Ya existe un registro con este ID, porfavor verifique los datos ingresados.'
	END
ELSE -- Inserta un nuevo registro
	BEGIN
		INSERT INTO Direccion_Estudiantes (ID_Direccion, ID_Estudiante, Direccion) VALUES (@ID_DIRECCION,@ID_ESTUDIANTE,@DIRECCION)
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para ingresar datos a cada una de las tablas*/
-- Procedimiento para insertar en la tabla Estados
CREATE PROCEDURE INS_Estados
@ID_ESTADO INT,
@ESTADO VARCHAR(225)
AS
IF EXISTS (SELECT * FROM Estados WHERE ID_Estado = @ID_ESTADO) -- Si existe un registro con este ID manda mensaje de error que ya hay un registro existente
	BEGIN
		PRINT 'Ya existe un registro con este ID, porfavor verifique los datos ingresados.'
	END
ELSE -- Inserta un nuevo registro
	BEGIN
		INSERT INTO Estados (ID_Estado, Estado) VALUES (@ID_ESTADO,@ESTADO)
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para ingresar datos a cada una de las tablas*/
-- Procedimiento para insertar en la tabla Estudiantes
CREATE PROCEDURE INS_Estudiantes
@ID_ESTUDIANTE INT,
@CEDULA VARCHAR(20),
@NOMBRE VARCHAR(20),
@APELLIDO VARCHAR(20),
@CORREO VARCHAR(100),
@FECHA_NACIMIENTO DATE,
@GENERO CHAR(1)
AS
IF EXISTS (SELECT * FROM Estudiantes WHERE ID_Estudiante = @ID_ESTUDIANTE) -- Si existe un registro con este ID manda mensaje de error que ya hay un registro existente
	BEGIN
		PRINT 'Ya existe un registro con este ID, porfavor verifique los datos ingresados.'
	END
ELSE -- Inserta un nuevo registro
	BEGIN
		INSERT INTO Estudiantes (ID_Estudiante, Cedula, Nombre, Apellido, Correo, Fecha_Nacimiento, Genero) VALUES (@ID_ESTUDIANTE,@CEDULA,@NOMBRE,@APELLIDO,@CORREO,@FECHA_NACIMIENTO,@GENERO)
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para ingresar datos a cada una de las tablas*/
-- Procedimiento para insertar en la tabla Estudiantes_Consejeros
CREATE PROCEDURE INS_Estudiantes_Consejeros
@ID_ESTUDIANTE INT,
@ID_CONSEJERO INT
AS
IF EXISTS (SELECT * FROM Estudiantes_Consejeros WHERE ID_Estudiante = @ID_ESTUDIANTE) -- Si existe un registro con este ID manda mensaje de error que ya hay un registro existente
	BEGIN
		PRINT 'Ya existe un registro con este ID, porfavor verifique los datos ingresados.'
	END
ELSE -- Inserta un nuevo registro
	BEGIN
		INSERT INTO Estudiantes_Consejeros (ID_Estudiante, ID_Consejero) VALUES (@ID_ESTUDIANTE,@ID_CONSEJERO)
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para ingresar datos a cada una de las tablas*/
-- Procedimiento para insertar en la tabla Estudiantes_Estados
CREATE PROCEDURE INS_Estudiantes_Estados
@ID_ESTUDIANTE INT,
@ID_ESTADO INT,
@FECHA_INICIO DATE,
@FECHA_FIN DATE
AS
IF EXISTS (SELECT * FROM Estudiantes_Estados WHERE ID_Estudiante = @ID_ESTUDIANTE) -- Si existe un registro con este ID manda mensaje de error que ya hay un registro existente
	BEGIN
		PRINT 'Ya existe un registro con este ID, porfavor verifique los datos ingresados.'
	END
ELSE -- Inserta un nuevo registro
	BEGIN
		INSERT INTO Estudiantes_Estados (ID_Estudiante, ID_Estado, Fecha_Inicio, Fecha_Fin) VALUES (@ID_ESTUDIANTE,@ID_ESTADO,@FECHA_INICIO,@FECHA_FIN)
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para ingresar datos a cada una de las tablas*/
-- Procedimiento para insertar en la tabla Estudiantes_Materias
CREATE PROCEDURE INS_Estudiantes_Materias
@ID_ESTUDIANTE INT,
@ID_MATERIA INT
AS
IF EXISTS (SELECT * FROM Estudiantes_Materias WHERE ID_Estudiante = @ID_ESTUDIANTE) -- Si existe un registro con este ID manda mensaje de error que ya hay un registro existente
	BEGIN
		PRINT 'Ya existe un registro con este ID, porfavor verifique los datos ingresados.'
	END
ELSE -- Inserta un nuevo registro
	BEGIN
		INSERT INTO Estudiantes_Materias(ID_Estudiante, ID_Materia) VALUES (@ID_ESTUDIANTE,@ID_MATERIA)
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para ingresar datos a cada una de las tablas*/
-- Procedimiento para insertar en la tabla Estudiantes_Sedes
CREATE PROCEDURE INS_Estudiantes_Sedes
@ID_ESTUDIANTE INT,
@ID_SEDE INT
AS
IF EXISTS (SELECT * FROM Estudiantes_Sedes WHERE ID_Estudiante = @ID_ESTUDIANTE) -- Si existe un registro con este ID manda mensaje de error que ya hay un registro existente
	BEGIN
		PRINT 'Ya existe un registro con este ID, porfavor verifique los datos ingresados.'
	END
ELSE -- Inserta un nuevo registro
	BEGIN
		INSERT INTO Estudiantes_Sedes(ID_Estudiante, ID_Sede) VALUES (@ID_ESTUDIANTE,@ID_SEDE)
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para ingresar datos a cada una de las tablas*/
-- Procedimiento para insertar en la tabla Materias
CREATE PROCEDURE INS_Materias
@ID_MATERIA INT,
@NOMBRE_MATERIA VARCHAR(50),
@DESCRIPCCION VARCHAR(50),
@ID_PROFESOR INT
AS
IF EXISTS (SELECT * FROM Materias WHERE ID_Materia = @ID_MATERIA) -- Si existe un registro con este ID manda mensaje de error que ya hay un registro existente
	BEGIN
		PRINT 'Ya existe un registro con este ID, porfavor verifique los datos ingresados.'
	END
ELSE -- Inserta un nuevo registro
	BEGIN
		INSERT INTO Materias (ID_Materia, Nombre_Materia, Descripcion_Materia, ID_Profesor) VALUES (@ID_MATERIA,@NOMBRE_MATERIA,@DESCRIPCCION,@ID_PROFESOR)
	END


-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para ingresar datos a cada una de las tablas*/
-- Procedimiento para insertar en la tabla Notas
CREATE PROCEDURE INS_Notas
@ID_NOTA INT,
@ID_ESTUDIANTE INT,
@ID_MATERIA INT,
@NOTA FLOAT
AS
IF EXISTS (SELECT * FROM Notas WHERE ID_Nota = @ID_NOTA) -- Si existe un registro con este ID manda mensaje de error que ya hay un registro existente
	BEGIN
		PRINT 'Ya existe un registro con este ID, porfavor verifique los datos ingresados.'
	END
ELSE -- Inserta un nuevo registro
	BEGIN
		INSERT INTO Notas (ID_Nota, ID_Estudiante, ID_Materia, Nota) VALUES (@ID_NOTA,@ID_ESTUDIANTE,@ID_MATERIA,@NOTA)
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para ingresar datos a cada una de las tablas*/
-- Procedimiento para insertar en la tabla Observaciones
CREATE PROCEDURE INS_Observaciones
@ID_OBSERVACION INT,
@ID_ESTUDIANTE INT,
@OBSERVACION TEXT
AS
IF EXISTS (SELECT * FROM Observaciones WHERE ID_Observacion = @ID_OBSERVACION) -- Si existe un registro con este ID manda mensaje de error que ya hay un registro existente
	BEGIN
		PRINT 'Ya existe un registro con este ID, porfavor verifique los datos ingresados.'
	END
ELSE -- Inserta un nuevo registro
	BEGIN
		INSERT INTO Observaciones (ID_Observacion, ID_Estudiante, Observacion) VALUES (@ID_OBSERVACION,@ID_ESTUDIANTE,@OBSERVACION)
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para ingresar datos a cada una de las tablas*/
-- Procedimiento para insertar en la tabla Profesores
CREATE PROCEDURE INS_Profesores
@ID_PROFESOR INT,
@NOMBRE VARCHAR(50),
@APELLIDO VARCHAR(50),
@CORREO VARCHAR(100),
@TELEFONO VARCHAR(25),
@CELULAR VARCHAR(25),
@CEDULA VARCHAR(20),
@GENERO CHAR(1)
AS
IF EXISTS (SELECT * FROM Profesores WHERE ID_Profesor = @ID_PROFESOR) -- Si existe un registro con este ID manda mensaje de error que ya hay un registro existente
	BEGIN
		PRINT 'Ya existe un registro con este ID, porfavor verifique los datos ingresados.'
	END
ELSE -- Inserta un nuevo registro
	BEGIN
		INSERT INTO Profesores (ID_Profesor, Nombre_Profesor, Apellido_Profesor, Correo, Telefono, Celular, Cedula, Genero) VALUES (@ID_PROFESOR,@NOMBRE,@APELLIDO,@CORREO,@TELEFONO,@CELULAR,@CEDULA,@GENERO)
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para ingresar datos a cada una de las tablas*/
-- Procedimiento para insertar en la tabla Sedes
CREATE PROCEDURE INS_Sedes
@ID_SEDE INT,
@NOMBRE VARCHAR(50)
AS
IF EXISTS (SELECT * FROM Sedes WHERE ID_Sede = @ID_SEDE) -- Si existe un registro con este ID manda mensaje de error que ya hay un registro existente
	BEGIN
		PRINT 'Ya existe un registro con este ID, porfavor verifique los datos ingresados.'
	END
ELSE -- Inserta un nuevo registro
	BEGIN
		INSERT INTO SEDES (ID_SEDE,Nombre_Sede) VALUES (@ID_SEDE,@NOMBRE)
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para hacer actualización de campos a cada una de las tablas*/
-- Procedimiento para Actualizar en la tabla Consejeros
CREATE PROCEDURE UPD_Consejeros
@ID INT,
@NOMBRE VARCHAR(50),
@APELLIDO VARCHAR(50),
@CORREO VARCHAR(100),
@TELEFONO VARCHAR(50),
@CELULAR VARCHAR(50),
@CEDULA VARCHAR(20)
AS
IF NOT EXISTS (SELECT * FROM Consejeros WHERE ID_Consejero = @ID) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Actualiza el registro
	BEGIN
		UPDATE Consejeros set Nombre = @NOMBRE,Apellido = @APELLIDO,Correo = @CORREO,Telefono = @TELEFONO,Celular = @CELULAR,Cedula = @CEDULA WHERE ID_Consejero = @ID
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para hacer actualización de campos a cada una de las tablas*/
-- Procedimiento para Actualizar en la tabla Contactos
CREATE PROCEDURE UPD_Contactos
@ID_Contacto INT,
@ID_Estudiante INT,
@NOMBRE VARCHAR(50),
@APELLIDO VARCHAR(50),
@CEDULA VARCHAR(20),
@PARENTEZCO VARCHAR(20),
@GENERO CHAR(1),
@CELULAR VARCHAR(20),
@TELEFONO_FIJO VARCHAR(20)
AS
IF NOT EXISTS (SELECT * FROM Contactos WHERE ID_Contacto = @ID_Contacto) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Actualiza el registro
	BEGIN
		UPDATE Contactos set Nombre = @NOMBRE,Apellido = @APELLIDO,Cedula = @CEDULA,Parentezco = @PARENTEZCO,Genero = @GENERO,Celular = @CELULAR,Telefono_Fijo = @TELEFONO_FIJO WHERE ID_Contacto = @ID_Contacto
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para hacer actualización de campos a cada una de las tablas*/
-- Procedimiento para Actualizar en la tabla Direccion_Estudiantes
CREATE PROCEDURE UPD_Direccion_Estudiantes
@ID_DIRECCION INT,
@ID_ESTUDIANTE INT,
@DIRECCION VARCHAR(225)
AS
IF NOT EXISTS (SELECT * FROM Direccion_Estudiantes WHERE ID_Direccion = @ID_DIRECCION) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Actualiza el registro
	BEGIN
		UPDATE Direccion_Estudiantes set ID_Estudiante = @ID_ESTUDIANTE, Direccion = @DIRECCION WHERE ID_Direccion = @ID_DIRECCION
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para hacer actualización de campos a cada una de las tablas*/
-- Procedimiento para Actualizar en la tabla Estados
CREATE PROCEDURE UPD_Estados
@ID_ESTADO INT,
@ESTADO VARCHAR(225)
AS
IF NOT EXISTS (SELECT * FROM Estados WHERE ID_Estado = @ID_ESTADO) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Actualiza el registro
	BEGIN
		UPDATE Estados set Estado = @ESTADO WHERE ID_Estado = @ID_ESTADO
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para hacer actualización de campos a cada una de las tablas*/
-- Procedimiento para Actualizar en la tabla Estudiantes
CREATE PROCEDURE UPD_Estudiantes
@ID_ESTUDIANTE INT,
@CEDULA VARCHAR(20),
@NOMBRE VARCHAR(20),
@APELLIDO VARCHAR(20),
@CORREO VARCHAR(100),
@FECHA_NACIMIENTO DATE,
@GENERO CHAR(1)
AS
IF NOT EXISTS (SELECT * FROM Estudiantes WHERE ID_Estudiante = @ID_ESTUDIANTE) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Actualiza el registro
	BEGIN
		UPDATE Estudiantes set Cedula = @CEDULA, Nombre = @NOMBRE, Apellido = @APELLIDO, Correo = @CORREO, Fecha_Nacimiento = @FECHA_NACIMIENTO, Genero = @GENERO WHERE ID_Estudiante = @ID_ESTUDIANTE
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para hacer actualización de campos a cada una de las tablas*/
-- Procedimiento para Actualizar en la tabla Estudiantes_Consejeros
CREATE PROCEDURE UPD_Estudiantes_Consejeros
@ID_ESTUDIANTE INT,
@ID_CONSEJERO INT
AS
IF NOT EXISTS (SELECT * FROM Estudiantes_Consejeros WHERE ID_Estudiante = @ID_ESTUDIANTE) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Actualiza el registro
	BEGIN
		UPDATE Estudiantes_Consejeros set ID_Consejero = @ID_CONSEJERO WHERE ID_Estudiante = @ID_ESTUDIANTE
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para hacer actualización de campos a cada una de las tablas*/
-- Procedimiento para Actualizar en la tabla Estudiantes_Estados
CREATE PROCEDURE UPD_Estudiantes_Estados
@ID_ESTUDIANTE INT,
@ID_ESTADO INT,
@FECHA_INICIO DATE,
@FECHA_FIN DATE
AS
IF NOT EXISTS (SELECT * FROM Estudiantes_Estados WHERE ID_Estudiante = @ID_ESTUDIANTE) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Actualiza el registro
	BEGIN
		UPDATE Estudiantes_Estados set ID_Estado = @ID_ESTADO, Fecha_Inicio = @FECHA_INICIO, Fecha_Fin = @FECHA_FIN WHERE ID_Estudiante = @ID_ESTUDIANTE
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para hacer actualización de campos a cada una de las tablas*/
-- Procedimiento para Actualizar en la tabla Estudiantes_Materias
CREATE PROCEDURE UPD_Estudiantes_Materias
@ID_ESTUDIANTE INT,
@ID_MATERIA INT
AS
IF NOT EXISTS (SELECT * FROM Estudiantes_Materias WHERE ID_Estudiante = @ID_ESTUDIANTE) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Actualiza el registro
	BEGIN
		UPDATE Estudiantes_Materias set ID_Materia = @ID_MATERIA WHERE ID_Estudiante = @ID_ESTUDIANTE
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para hacer actualización de campos a cada una de las tablas*/
-- Procedimiento para Actualizar en la tabla Estudiantes_Sedes
CREATE PROCEDURE UPD_Estudiantes_Sedes
@ID_ESTUDIANTE INT,
@ID_SEDE INT
AS
IF NOT EXISTS (SELECT * FROM Estudiantes_Sedes WHERE ID_Estudiante = @ID_ESTUDIANTE) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Actualiza el registro
	BEGIN
		UPDATE Estudiantes_Sedes set ID_Sede = @ID_SEDE WHERE ID_Estudiante = @ID_ESTUDIANTE
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para hacer actualización de campos a cada una de las tablas*/
-- Procedimiento para Actualizar en la tabla Materias
CREATE PROCEDURE UPD_Materias
@ID_MATERIA INT,
@NOMBRE_MATERIA VARCHAR(50),
@DESCRIPCCION VARCHAR(50),
@ID_PROFESOR INT
AS
IF NOT EXISTS (SELECT * FROM Materias WHERE ID_Materia = @ID_MATERIA) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Actualiza el registro
	BEGIN
		UPDATE Materias SET Nombre_Materia = @NOMBRE_MATERIA, Descripcion_Materia = @DESCRIPCCION, ID_Profesor = @ID_PROFESOR WHERE ID_Materia = @ID_MATERIA
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para hacer actualización de campos a cada una de las tablas*/
-- Procedimiento para Actualizar en la tabla Notas
CREATE PROCEDURE UPD_Notas
@ID_NOTA INT,
@ID_ESTUDIANTE INT,
@ID_MATERIA INT,
@NOTA FLOAT
AS
IF NOT EXISTS (SELECT * FROM Notas WHERE ID_Nota = @ID_NOTA) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Actualiza el registro
	BEGIN
		UPDATE Notas SET ID_Estudiante = @ID_ESTUDIANTE, ID_Materia = @ID_MATERIA, Nota = @NOTA  WHERE ID_Nota = @ID_NOTA
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para hacer actualización de campos a cada una de las tablas*/
-- Procedimiento para Actualizar en la tabla Observaciones
CREATE PROCEDURE UPD_Observaciones
@ID_OBSERVACION INT,
@ID_ESTUDIANTE INT,
@OBSERVACION TEXT
AS
IF NOT EXISTS (SELECT * FROM Observaciones WHERE ID_Observacion = @ID_OBSERVACION) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Actualiza el registro
	BEGIN
		UPDATE Observaciones SET ID_Estudiante = @ID_ESTUDIANTE, Observacion = @OBSERVACION  WHERE ID_Observacion = @ID_OBSERVACION
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para hacer actualización de campos a cada una de las tablas*/
-- Procedimiento para Actualizar en la tabla Profesores
CREATE PROCEDURE UPD_Profesores
@ID_PROFESOR INT,
@NOMBRE VARCHAR(50),
@APELLIDO VARCHAR(50),
@CORREO VARCHAR(100),
@TELEFONO VARCHAR(25),
@CELULAR VARCHAR(25),
@CEDULA VARCHAR(20),
@GENERO CHAR(1)
AS
IF NOT EXISTS (SELECT * FROM Profesores WHERE ID_Profesor = @ID_PROFESOR) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Actualiza el registro
	BEGIN
		UPDATE Profesores SET Nombre_Profesor = @NOMBRE, Apellido_Profesor = @APELLIDO, Correo = @CORREO, Telefono = @TELEFONO, Celular = @CELULAR, Cedula = @CEDULA, Genero = @GENERO  WHERE ID_Profesor = @ID_PROFESOR
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para hacer actualización de campos a cada una de las tablas*/
-- Procedimiento para Actualizar en la tabla Sedes
CREATE PROCEDURE UPD_Sedes
@ID_SEDE INT,
@NOMBRE VARCHAR(50)
AS
IF NOT EXISTS (SELECT * FROM Sedes WHERE ID_Sede = @ID_SEDE) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Actualiza el registro
	BEGIN
		UPDATE Sedes SET Nombre_Sede = @NOMBRE  WHERE ID_Sede = @ID_SEDE
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para borrar una fila o registro por su llave primaria.*/
-- Procedimiento para borrar una fila o registro por su llave primaria en la tabla Consejeros
CREATE PROCEDURE DEL_Consejeros
@ID INT
AS
IF NOT EXISTS (SELECT * FROM Consejeros WHERE ID_Consejero = @ID) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Borra el registro a traves de la llave primaria
	BEGIN
		DELETE FROM Consejeros WHERE ID_Consejero = @ID
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para borrar una fila o registro por su llave primaria.*/
-- Procedimiento para borrar una fila o registro por su llave primaria en la tabla Contactos
CREATE PROCEDURE DEL_Contactos
@ID_Contacto INT
AS
IF NOT EXISTS (SELECT * FROM Contactos WHERE ID_Contacto = @ID_Contacto) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Borra el registro a traves de la llave primaria
	BEGIN
		DELETE FROM Contactos WHERE ID_Contacto = @ID_Contacto
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para borrar una fila o registro por su llave primaria.*/
-- Procedimiento para borrar una fila o registro por su llave primaria en la tabla Direccion_Estudiantes
CREATE PROCEDURE DEL_Direccion_Estudiantes
@ID_DIRECCION INT
AS
IF NOT EXISTS (SELECT * FROM Direccion_Estudiantes WHERE ID_Direccion = @ID_DIRECCION) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Borra el registro a traves de la llave primaria
	BEGIN
		DELETE FROM Direccion_Estudiantes WHERE ID_Direccion = @ID_DIRECCION
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para borrar una fila o registro por su llave primaria.*/
-- Procedimiento para borrar una fila o registro por su llave primaria en la tabla Estados
CREATE PROCEDURE DEL_Estados
@ID_ESTADO INT
AS
IF NOT EXISTS (SELECT * FROM Estados WHERE ID_Estado = @ID_ESTADO) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Borra el registro a traves de la llave primaria
	BEGIN
		DELETE FROM Estados WHERE ID_Estado = @ID_ESTADO
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para borrar una fila o registro por su llave primaria.*/
-- Procedimiento para borrar una fila o registro por su llave primaria en la tabla Estudiantes
CREATE PROCEDURE DEL_Estudiantes
@ID_ESTUDIANTE INT
AS
IF NOT EXISTS (SELECT * FROM Estudiantes WHERE ID_Estudiante = @ID_ESTUDIANTE) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Borra el registro a traves de la llave primaria
	BEGIN
		DELETE FROM Estudiantes WHERE ID_Estudiante = @ID_ESTUDIANTE
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para borrar una fila o registro por su llave primaria.*/
-- Procedimiento para borrar una fila o registro por su llave primaria en la tabla Estudiantes_Consejeros
CREATE PROCEDURE DEL_Estudiantes_Consejeros
@ID_ESTUDIANTE INT
AS
IF NOT EXISTS (SELECT * FROM Estudiantes_Consejeros WHERE ID_Estudiante = @ID_ESTUDIANTE) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Borra el registro a traves de la llave primaria
	BEGIN
		DELETE FROM Estudiantes_Consejeros WHERE ID_Estudiante = @ID_ESTUDIANTE
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para borrar una fila o registro por su llave primaria.*/
-- Procedimiento para borrar una fila o registro por su llave primaria en la tabla Estudiantes_Estados
CREATE PROCEDURE DEL_Estudiantes_Estados
@ID_ESTUDIANTE INT
AS
IF NOT EXISTS (SELECT * FROM Estudiantes_Estados WHERE ID_Estudiante = @ID_ESTUDIANTE) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Borra el registro a traves de la llave primaria
	BEGIN
		DELETE FROM Estudiantes_Estados WHERE ID_Estudiante = @ID_ESTUDIANTE
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para borrar una fila o registro por su llave primaria.*/
-- Procedimiento para borrar una fila o registro por su llave primaria en la tabla Estudiantes_Materias
CREATE PROCEDURE DEL_Estudiantes_Materias
@ID_ESTUDIANTE INT
AS
IF NOT EXISTS (SELECT * FROM Estudiantes_Materias WHERE ID_Estudiante = @ID_ESTUDIANTE) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Borra el registro a traves de la llave primaria
	BEGIN
		DELETE FROM Estudiantes_Materias WHERE ID_Estudiante = @ID_ESTUDIANTE
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para borrar una fila o registro por su llave primaria.*/
-- Procedimiento para borrar una fila o registro por su llave primaria en la tabla Estudiantes_Sedes
CREATE PROCEDURE DEL_Estudiantes_Sedes
@ID_ESTUDIANTE INT
AS
IF NOT EXISTS (SELECT * FROM Estudiantes_Sedes WHERE ID_Estudiante = @ID_ESTUDIANTE) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Borra el registro a traves de la llave primaria
	BEGIN
		DELETE FROM Estudiantes_Sedes WHERE ID_Estudiante = @ID_ESTUDIANTE
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para borrar una fila o registro por su llave primaria.*/
-- Procedimiento para borrar una fila o registro por su llave primaria en la tabla Materias
CREATE PROCEDURE DEL_Materias
@ID_MATERIA INT
AS
IF NOT EXISTS (SELECT * FROM Materias WHERE ID_Materia = @ID_MATERIA) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Borra el registro a traves de la llave primaria
	BEGIN
		DELETE FROM Materias WHERE ID_Materia = @ID_MATERIA
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para borrar una fila o registro por su llave primaria.*/
-- Procedimiento para borrar una fila o registro por su llave primaria en la tabla Notas
CREATE PROCEDURE DEL_Notas
@ID_NOTA INT
AS
IF NOT EXISTS (SELECT * FROM Notas WHERE ID_Nota = @ID_NOTA) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Borra el registro a traves de la llave primaria
	BEGIN
		DELETE FROM Notas WHERE ID_Nota = @ID_NOTA
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para borrar una fila o registro por su llave primaria.*/
-- Procedimiento para borrar una fila o registro por su llave primaria en la tabla Observaciones
CREATE PROCEDURE DEL_Observaciones
@ID_OBSERVACION INT
AS
IF NOT EXISTS (SELECT * FROM Observaciones WHERE ID_Observacion = @ID_OBSERVACION) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Borra el registro a traves de la llave primaria
	BEGIN
		DELETE FROM Observaciones WHERE ID_Observacion = @ID_OBSERVACION
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para borrar una fila o registro por su llave primaria.*/
-- Procedimiento para borrar una fila o registro por su llave primaria en la tabla Profesores
CREATE PROCEDURE DEL_Profesores
@ID_PROFESOR INT
AS
IF NOT EXISTS (SELECT * FROM Profesores WHERE ID_Profesor = @ID_PROFESOR) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Borra el registro a traves de la llave primaria
	BEGIN
		DELETE FROM Profesores WHERE ID_Profesor = @ID_PROFESOR
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para borrar una fila o registro por su llave primaria.*/
-- Procedimiento para borrar una fila o registro por su llave primaria en la tabla Sedes
CREATE PROCEDURE DEL_Sedes
@ID_SEDE INT
AS
IF NOT EXISTS (SELECT * FROM Sedes WHERE ID_Sede = @ID_SEDE) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Borra el registro a traves de la llave primaria
	BEGIN
		DELETE FROM Sedes WHERE ID_Sede = @ID_SEDE
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para realizar una búsqueda de un registro utilizando su llave primaria.*/
-- Procedimiento para realizar una búsqueda de un registro utilizando su llave primaria en la tabla Consejeros
CREATE PROCEDURE SEARCH_Consejeros
@ID INT
AS
IF NOT EXISTS (SELECT * FROM Consejeros WHERE ID_Consejero = @ID) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Busca los campos vinculados a la PK en la tabla
	BEGIN
		Select * from Consejeros WHERE ID_Consejero = @ID
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para realizar una búsqueda de un registro utilizando su llave primaria.*/
-- Procedimiento para realizar una búsqueda de un registro utilizando su llave primaria en la tabla Contactos
CREATE PROCEDURE SEARCH_Contactos
@ID_Contacto INT
AS
IF NOT EXISTS (SELECT * FROM Contactos WHERE ID_Contacto = @ID_Contacto) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Busca el registro a traves de la PK
	BEGIN
		SELECT * FROM Contactos WHERE ID_Contacto = @ID_Contacto
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para realizar una búsqueda de un registro utilizando su llave primaria.*/
-- Procedimiento para realizar una búsqueda de un registro utilizando su llave primaria en la tabla Direccion_Estudiantes
CREATE PROCEDURE SEARCH_Direccion_Estudiantes
@ID_DIRECCION INT
AS
IF NOT EXISTS (SELECT * FROM Direccion_Estudiantes WHERE ID_Direccion = @ID_DIRECCION) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Busca el registro a traves de la PK
	BEGIN
		SELECT * FROM Direccion_Estudiantes WHERE ID_Direccion = @ID_DIRECCION
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para realizar una búsqueda de un registro utilizando su llave primaria.*/
-- Procedimiento para realizar una búsqueda de un registro utilizando su llave primaria en la tabla Estados
CREATE PROCEDURE SEARCH_Estados
@ID_ESTADO INT
AS
IF NOT EXISTS (SELECT * FROM Estados WHERE ID_Estado = @ID_ESTADO) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Busca el registro a traves de la PK
	BEGIN
		SELECT * FROM Estados WHERE ID_Estado = @ID_ESTADO
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para realizar una búsqueda de un registro utilizando su llave primaria.*/
-- Procedimiento para realizar una búsqueda de un registro utilizando su llave primaria en la tabla Estudiantes
CREATE PROCEDURE SEARCH_Estudiantes
@ID_ESTUDIANTE INT
AS
IF NOT EXISTS (SELECT * FROM Estudiantes WHERE ID_Estudiante = @ID_ESTUDIANTE) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Busca el registro a traves de la llave primaria
	BEGIN
		SELECT * FROM Estudiantes WHERE ID_Estudiante = @ID_ESTUDIANTE
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para realizar una búsqueda de un registro utilizando su llave primaria.*/
-- Procedimiento para realizar una búsqueda de un registro utilizando su llave primaria en la tabla Estudiantes_Consejeros
CREATE PROCEDURE SEARCH_Estudiantes_Consejeros
@ID_ESTUDIANTE INT
AS
IF NOT EXISTS (SELECT * FROM Estudiantes_Consejeros WHERE ID_Estudiante = @ID_ESTUDIANTE) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Busca el registro a traves de la llave primaria
	BEGIN
		SELECT * FROM Estudiantes_Consejeros WHERE ID_Estudiante = @ID_ESTUDIANTE
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para realizar una búsqueda de un registro utilizando su llave primaria.*/
-- Procedimiento para realizar una búsqueda de un registro utilizando su llave primaria en la tabla Estudiantes_Estados
CREATE PROCEDURE SEARCH_Estudiantes_Estados
@ID_ESTUDIANTE INT
AS
IF NOT EXISTS (SELECT * FROM Estudiantes_Estados WHERE ID_Estudiante = @ID_ESTUDIANTE) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Busca el registro a traves de la llave primaria
	BEGIN
		SELECT * FROM Estudiantes_Estados WHERE ID_Estudiante = @ID_ESTUDIANTE
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para realizar una búsqueda de un registro utilizando su llave primaria.*/
-- Procedimiento para realizar una búsqueda de un registro utilizando su llave primaria en la tabla Estudiantes_Materias
CREATE PROCEDURE SEARCH_Estudiantes_Materias
@ID_ESTUDIANTE INT
AS
IF NOT EXISTS (SELECT * FROM Estudiantes_Materias WHERE ID_Estudiante = @ID_ESTUDIANTE) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Busca el registro a traves de la llave primaria
	BEGIN
		SELECT * FROM Estudiantes_Materias WHERE ID_Estudiante = @ID_ESTUDIANTE
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para realizar una búsqueda de un registro utilizando su llave primaria.*/
-- Procedimiento para realizar una búsqueda de un registro utilizando su llave primaria en la tabla Estudiantes_Sedes
CREATE PROCEDURE SEARCH_Estudiantes_Sedes
@ID_ESTUDIANTE INT
AS
IF NOT EXISTS (SELECT * FROM Estudiantes_Sedes WHERE ID_Estudiante = @ID_ESTUDIANTE) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Busca el registro a traves de la llave primaria
	BEGIN
		SELECT * FROM Estudiantes_Sedes WHERE ID_Estudiante = @ID_ESTUDIANTE
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para realizar una búsqueda de un registro utilizando su llave primaria.*/
-- Procedimiento para realizar una búsqueda de un registro utilizando su llave primaria en la Materias
CREATE PROCEDURE SEARCH_Materias
@ID_MATERIA INT
AS
IF NOT EXISTS (SELECT * FROM Materias WHERE ID_Materia = @ID_MATERIA) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Busca el registro a traves de la llave primaria
	BEGIN
		SELECT * FROM Materias WHERE ID_Materia = @ID_MATERIA
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para realizar una búsqueda de un registro utilizando su llave primaria.*/
-- Procedimiento para realizar una búsqueda de un registro utilizando su llave primaria en la Notas
CREATE PROCEDURE SEARCH_Notas
@ID_NOTA INT
AS
IF NOT EXISTS (SELECT * FROM Notas WHERE ID_Nota = @ID_NOTA) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Busca el registro a traves de la llave primaria
	BEGIN
		SELECT * FROM Notas WHERE ID_Nota = @ID_NOTA
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para realizar una búsqueda de un registro utilizando su llave primaria.*/
-- Procedimiento para realizar una búsqueda de un registro utilizando su llave primaria en la Observaciones
CREATE PROCEDURE SEARCH_Observaciones
@ID_OBSERVACION INT
AS
IF NOT EXISTS (SELECT * FROM Observaciones WHERE ID_Observacion = @ID_OBSERVACION) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Busca el registro a traves de la llave primaria
	BEGIN
		SELECT * FROM Observaciones WHERE ID_Observacion = @ID_OBSERVACION
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para realizar una búsqueda de un registro utilizando su llave primaria.*/
-- Procedimiento para realizar una búsqueda de un registro utilizando su llave primaria en la Profesores
CREATE PROCEDURE SEARCH_Profesores
@ID_PROFESOR INT
AS
IF NOT EXISTS (SELECT * FROM Profesores WHERE ID_Profesor = @ID_PROFESOR) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Busca el registro a traves de la llave primaria
	BEGIN
		SELECT * FROM Profesores WHERE ID_Profesor = @ID_PROFESOR
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado para realizar una búsqueda de un registro utilizando su llave primaria.*/
-- Procedimiento para realizar una búsqueda de un registro utilizando su llave primaria en la Sedes
CREATE PROCEDURE SEARCH_Sedes
@ID_SEDE INT
AS
IF NOT EXISTS (SELECT * FROM Sedes WHERE ID_Sede = @ID_SEDE) -- Si, no existe un registro con este ID manda mensaje de error de que no existe un registro con ese ID para actualizar
	BEGIN
		PRINT 'No existe un registro con este ID, porfavor verifique el ID ingresado.'
	END
ELSE -- Busca el registro a traves de la llave primaria
	BEGIN
		SELECT * FROM Sedes WHERE ID_Sede = @ID_SEDE
	END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado que me devuelva todos los registros de la tabla.*/
-- Procedimiento almacenado que me devuelva todos los registros de la tabla Consejeros.
CREATE PROCEDURE SEL_Consejeros
AS
BEGIN
	SELECT * FROM Consejeros
END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado que me devuelva todos los registros de la tabla.*/
-- Procedimiento almacenado que me devuelva todos los registros de la tabla Contactos.
CREATE PROCEDURE SEL_Contactos
AS
BEGIN
	SELECT * FROM Contactos
END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado que me devuelva todos los registros de la tabla.*/
-- Procedimiento almacenado que me devuelva todos los registros de la tabla Direccion_Estudiantes.
CREATE PROCEDURE SEL_Direccion_Estudiantes
AS
BEGIN
	SELECT * FROM Direccion_Estudiantes
END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado que me devuelva todos los registros de la tabla.*/
-- Procedimiento almacenado que me devuelva todos los registros de la tabla Estados.
CREATE PROCEDURE SEL_Estados
AS
BEGIN
	SELECT * FROM Estados
END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado que me devuelva todos los registros de la tabla.*/
-- Procedimiento almacenado que me devuelva todos los registros de la tabla Estudiantes.
CREATE PROCEDURE SEL_Estudiantes
AS
BEGIN
	SELECT * FROM Estudiantes
END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado que me devuelva todos los registros de la tabla.*/
-- Procedimiento almacenado que me devuelva todos los registros de la tabla Estudiantes_Consejeros.
CREATE PROCEDURE SEL_Estudiantes_Consejeros
AS
BEGIN
	SELECT * FROM Estudiantes_Consejeros
END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado que me devuelva todos los registros de la tabla.*/
-- Procedimiento almacenado que me devuelva todos los registros de la tabla Estudiantes_Estados.
CREATE PROCEDURE SEL_Estudiantes_Estados
AS
BEGIN
	SELECT * FROM Estudiantes_Estados
END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado que me devuelva todos los registros de la tabla.*/
-- Procedimiento almacenado que me devuelva todos los registros de la tabla Estudiantes_Materias.
CREATE PROCEDURE SEL_Estudiantes_Materias
AS
BEGIN
	SELECT * FROM Estudiantes_Materias
END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado que me devuelva todos los registros de la tabla.*/
-- Procedimiento almacenado que me devuelva todos los registros de la tabla Estudiantes_Sedes.
CREATE PROCEDURE SEL_Estudiantes_Sedes
AS
BEGIN
	SELECT * FROM Estudiantes_Sedes
END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado que me devuelva todos los registros de la tabla.*/
-- Procedimiento almacenado que me devuelva todos los registros de la tabla Materias.
CREATE PROCEDURE SEL_Materias
AS
BEGIN
	SELECT * FROM Materias
END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado que me devuelva todos los registros de la tabla.*/
-- Procedimiento almacenado que me devuelva todos los registros de la tabla Notas.
CREATE PROCEDURE SEL_Notas
AS
BEGIN
	SELECT * FROM Notas
END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado que me devuelva todos los registros de la tabla.*/
-- Procedimiento almacenado que me devuelva todos los registros de la tabla Observaciones.
CREATE PROCEDURE SEL_Observaciones
AS
BEGIN
	SELECT * FROM Observaciones
END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado que me devuelva todos los registros de la tabla.*/
-- Procedimiento almacenado que me devuelva todos los registros de la tabla Profesores.
CREATE PROCEDURE SEL_Profesores
AS
BEGIN
	SELECT * FROM Profesores
END

-- PROCEDIMIENTOS DE ALMACENADO
/*Procedimiento almacenado que me devuelva todos los registros de la tabla.*/
-- Procedimiento almacenado que me devuelva todos los registros de la tabla Sedes.
CREATE PROCEDURE SEL_Sedes
AS
BEGIN
	SELECT * FROM Sedes
END





--- PROCEDIMIENTOS ALMACENADOS EXTRA (2) POR TABLA

--- TABLA Estudiantes
--- Proc #1 Calculo total estudiantes

CREATE PROCEDURE TotalEstudiantes
AS
BEGIN
    DECLARE @total INT;
    SELECT @total = COUNT(*) FROM Estudiantes;
    SELECT @total AS 'Total de Estudiantes';
END;

exec TotalEstudiantes

--- Proc #2 Estudiantes con genero femenino

CREATE PROCEDURE MostrarEstudiantesFemeninas
AS
BEGIN
    SELECT * FROM Estudiantes WHERE Genero = 'F';
END;

exec MostrarEstudiantesFemeninas


--- PROCEDIMIENTOS ALMACENADOS EXTRA (2) POR TABLA

--- Tabla Profesores
--- Proc #1 Profesores cuya cedulas no empiezen por 8

CREATE PROCEDURE MostrarProfesoresCedulaNo8
AS
BEGIN
    SELECT * FROM Profesores WHERE NOT Cedula LIKE '8%';
END;

exec MostrarProfesoresCedulaNo8

--- Proc #2 Profesores con correos distintos a hotmail.com

CREATE PROCEDURE MostrarProfesoresCorreoNoHotmail
AS
BEGIN
    SELECT * FROM Profesores WHERE Correo NOT LIKE '%hotmail.com';
END;

exec MostrarProfesoresCorreoNoHotmail


--- PROCEDIMIENTOS ALMACENADOS EXTRA (2) POR TABLA
--- Tabla Materias
--- Proc #1 Materias que no son informatica o tecnologia


CREATE PROCEDURE MostrarMateriasNoInformaticaTecnologia
AS
BEGIN
    SELECT * FROM Materias
    WHERE Nombre_Materia NOT IN ('Informática', 'Tecnología');
END;

exec MostrarMateriasNoInformaticaTecnologia

--- Tabla Materias
--- Proc #2 Materias cuya descripcion no es plan_2023

CREATE PROCEDURE MostrarMateriasNoPlan2023
AS
BEGIN
    SELECT * FROM Materias
    WHERE Descripcion_Materia <> 'plan_2023';
END;

exec MostrarMateriasNoPlan2023


--- PROCEDIMIENTOS ALMACENADOS EXTRA (2) POR TABLA
--- Tabla Sedes
--- Proc #1 Cambio a mayusculas del nombre de la sede

CREATE PROCEDURE CambiarNombreSedesMayuscula
AS
BEGIN
    UPDATE Sedes
    SET Nombre_Sede = UPPER(Nombre_Sede);
END;

exec CambiarNombreSedesMayuscula

--- Tabla Sedes
--- Proc #2 Cambio a minusculas del nombre de la sede

CREATE PROCEDURE CambiarNombreSedesMinuscula
AS
BEGIN
    UPDATE Sedes
    SET Nombre_Sede = LOWER(Nombre_Sede);
END;

exec CambiarNombreSedesMinuscula


--- PROCEDIMIENTOS ALMACENADOS EXTRA (2) POR TABLA
--- Tabla Estados
--- Proc #1 Estados distintos a Activo y Finalizado

CREATE PROCEDURE MostrarEstadosDistintosActivoFinalizado
AS
BEGIN
    SELECT * FROM Estados
    WHERE Estado NOT IN ('Activo', 'Finalizado');
END;

exec MostrarEstadosDistintosActivoFinalizado

--- Tabla Estados
--- Proc #2 Estados con id distinto a 400

CREATE PROCEDURE MostrarEstadosDistintos400
AS
BEGIN
    SELECT * FROM Estados
    WHERE ID_Estado <> 400;
END;

exec MostrarEstadosDistintos400


--- PROCEDIMIENTOS ALMACENADOS EXTRA (2) POR TABLA
--- Tabla Consejeros
--- Proc #1 Consejeros cuyos telefonos no empiecen por 259



CREATE PROCEDURE FiltrarConsejerosPorTelefono
AS
BEGIN
    SELECT * FROM Consejeros
    WHERE NOT Telefono LIKE '259%';
END;

exec FiltrarConsejerosPorTelefono

--- Proc #2 Consejeros con cedula que empieza en 4

CREATE PROCEDURE ConsejerosPorCedula
AS
BEGIN
    SELECT * FROM Consejeros
    WHERE Cedula LIKE '4%';
END;

exec ConsejerosPorCedula


--- PROCEDIMIENTOS ALMACENADOS EXTRA (2) POR TABLA
--- Tabla Observaciones
--- Proc #1 ID_Observacion mayor a 604


select * from Observaciones

CREATE PROCEDURE ObservacionesMayor604
AS
BEGIN
    SELECT * FROM Observaciones
    WHERE ID_Observacion > 604;
END;

Exec ObservacionesMayor604

--- Tabla Observaciones
--- Proc #2 Observaciones que no incluyan la palabra matematicas o fisica

CREATE PROCEDURE ObservacionesSinMaterias
AS
BEGIN
    SELECT * FROM Observaciones
    WHERE LOWER(CONVERT(VARCHAR(MAX), Observacion)) NOT LIKE '%matemáticas%'
    AND LOWER(CONVERT(VARCHAR(MAX), Observacion)) NOT LIKE '%física%';
END;

exec ObservacionesSinMaterias


--- PROCEDIMIENTOS ALMACENADOS EXTRA (2) POR TABLA
--- Tabla contactos
--- proc #1 Contactos con parentezo otro

CREATE PROCEDURE FiltrarContactosOtro
AS
BEGIN
    SELECT *
    FROM Contactos
    WHERE Parentezco = 'Otro';
END;

exec FiltrarContactosOtro


--- Tabla contactos
--- proc #2 Contactos cuyos apellidos no terminan en z


CREATE PROCEDURE FiltrarApellidosNoTerminadosEnZ
AS
BEGIN
    SELECT *
    FROM Contactos
    WHERE Apellido NOT LIKE '%z';
END;

exec FiltrarApellidosNoTerminadosEnZ


--- PROCEDIMIENTOS ALMACENADOS EXTRA (2) POR TABLA
--- Tabla Estudiantes_Sedes
--- Proc #1 ID_Estudiante superior a 102


select * from Estudiantes_Sedes

CREATE PROCEDURE MostrarEstudiantesSuperioresA102
AS
BEGIN
    SELECT ID_Estudiante
    FROM Estudiantes_Sedes
    WHERE ID_Estudiante > 102;
END;

exec MostrarEstudiantesSuperioresA102


--- Tabla Estudiantes_Sedes
--- Proc #2 Verificar si existen registros con id_sede diferente a 400

CREATE PROCEDURE VerificarSede
AS
BEGIN
    DECLARE @Count INT;

    SELECT @Count = COUNT(*)
    FROM Estudiantes_Sedes
    WHERE ID_Sede <> 400;

    IF @Count > 0
        PRINT 'Existen registros con ID_Sede distinto de 400.';
    ELSE
        PRINT 'No existen registros con ID_Sede distinto de 400.';
END;

exec VerificarSede


--- PROCEDIMIENTOS ALMACENADOS EXTRA (2) POR TABLA
--- Tabla Estudiantes_estados
--- Proc #1 Verificar si existen registros con id_estado diferente a 401

select * from Estudiantes_Estados

CREATE PROCEDURE VerificarEstadoDiferente401
AS
BEGIN
    DECLARE @Count INT;

    SELECT @Count = COUNT(*)
    FROM Estudiantes_Estados
    WHERE ID_Estado <> 401;

    IF @Count > 0
        SELECT 'Sí' AS ExisteRegistroDiferente401;
    ELSE
        SELECT 'No' AS ExisteRegistroDiferente401;
END;

exec VerificarEstadoDiferente401

--- Tabla Estudiantes_estados
--- Proc #2 Verificar si existen registros con id_estudiante mayor a 105

CREATE PROCEDURE VerificarEstudianteMayor105
AS
BEGIN
    DECLARE @Count INT;

    SELECT @Count = COUNT(*)
    FROM Estudiantes_Estados
    WHERE ID_Estudiante > 105;

    IF @Count > 0
        SELECT 'Sí' AS ExisteEstudianteMayor105;
    ELSE
        SELECT 'No' AS ExisteEstudianteMayor105;
END;

exec VerificarEstudianteMayor105


--- PROCEDIMIENTOS ALMACENADOS EXTRA (2) POR TABLA
--- Tabla Estudiantes_consejeros
--- Proc #1 Verificar si existe un id_consejero 600 o mayor

select * from Estudiantes_Consejeros

CREATE PROCEDURE VerificarIDConsejeroMayor600
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Estudiantes_Consejeros WHERE ID_Consejero >= 600)
        PRINT 'Sí, hay al menos un ID_Consejero igual o mayor a 600.'
    ELSE
        PRINT 'No se encontraron ID_Consejero igual o mayor a 600.'
END;

exec VerificarIDConsejeroMayor600

--- Tabla Estudiantes_consejeros
--- Proc #2 verificar si hay ids de consejeros que se repiten o no

CREATE PROCEDURE MostrarIDConsejeroRepetido
AS
BEGIN
    SELECT ID_Consejero, COUNT(*) AS Repeticiones
    FROM Estudiantes_Consejeros
    GROUP BY ID_Consejero
    HAVING COUNT(*) > 1;
END;

exec MostrarIDConsejeroRepetido


--- PROCEDIMIENTOS ALMACENADOS EXTRA (2) POR TABLA
--- Tabla_Estudiantes_Materias
--- Proc #1 Estan todos los id_estudiante vinculados a todos los id_materia



CREATE PROCEDURE VerificarVinculacionEstudiantesMaterias
AS
BEGIN
    DECLARE @TotalMaterias INT;
    DECLARE @Estado NVARCHAR(100);

    -- Obtener el total de materias
    SELECT @TotalMaterias = COUNT(*) FROM Materias;

    -- Verificar la vinculación de estudiantes a materias
    SELECT @Estado = 
        CASE 
            WHEN COUNT(DISTINCT ID_Materia) = @TotalMaterias THEN 'Todos los estudiantes están vinculados a todas las materias.'
            ELSE 'No todos los estudiantes están vinculados a todas las materias.'
        END
    FROM Estudiantes_Materias
    GROUP BY ID_Estudiante;

    -- Mostrar el estado de la vinculación
    SELECT @Estado AS EstadoVinculacion;
END;

exec VerificarVinculacionEstudiantesMaterias



 --- Tabla_Estudiantes_Materias
--- Proc #2 Verificar si existe un id materia 400

CREATE PROCEDURE VerificarExistenciaMateria
AS
BEGIN
    DECLARE @Existe INT;

    -- Verificar si existe el ID de materia 400
    SELECT @Existe = COUNT(*)
    FROM Materias
    WHERE ID_Materia = 400;

    IF @Existe > 0
        PRINT 'El ID de materia 400 existe en la tabla Materias.';
    ELSE
        PRINT 'El ID de materia 400 no existe en la tabla Materias.';
END;

exec VerificarExistenciaMateria


--- PROCEDIMIENTOS ALMACENADOS EXTRA (2) POR TABLA
--- Tabla Notas 
--- Proc #1 nota mas baja de una materia, suministrando el id

CREATE PROCEDURE NotasMasBajas(@ID_Materia INT)
AS
BEGIN
    SELECT ID_Materia, MIN(Nota) AS NotaMasBaja
    FROM Notas
    WHERE ID_Materia = @ID_Materia
    GROUP BY ID_Materia;
END;

exec NotasMasBajas @ID_Materia = 300


--- Tabla Notas 
--- Proc #2 id_materia con el promedio mas alto

CREATE PROCEDURE MateriaConPromedioMasAlto
AS
BEGIN
    SELECT TOP 1 ID_Materia
    FROM Notas
    GROUP BY ID_Materia
    ORDER BY AVG(Nota) DESC;
END;

exec MateriaConPromedioMasAlto



--- PROCEDIMIENTOS ALMACENADOS EXTRA (2) POR TABLA
--- Tabla Direccion_Estudiantes
--- Proc #1 - Verificar si una direccion esta vacia

CREATE PROCEDURE VerificarDireccionVacia
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Direccion_Estudiantes WHERE Direccion IS NULL OR Direccion = '')
        PRINT 'Hay al menos un registro con la dirección vacía.';
    ELSE
        PRINT 'No hay registros con la dirección vacía.';
END;

exec VerificarDireccionVacia

--- Tabla Direccion_Estudiantes
--- Proc #2 Mostrar las direcciones que no incluyen la chorrera

CREATE PROCEDURE MostrarDireccionesNoLaChorrera
AS
BEGIN
    SELECT Direccion
    FROM Direccion_Estudiantes
    WHERE Direccion NOT LIKE '%La Chorrera%';
END;

exec MostrarDireccionesNoLaChorrera

--TRIGGERS
/*Crear 4 triggers que registren en tablas de auditorías los registros que se han borrado, insertado, actualizado (puede escoger uno por cada trigger) incluyendo la fecha/hora en que se realizó el cambio. 
Se debe seleccionar las tablas con mayor transaccionalidad.*/

-- Creacion de tablas de auditoria
CREATE TABLE Auditoria_Estudiantes (
    ID_Auditoria INT IDENTITY(1,1) PRIMARY KEY,
    Operacion VARCHAR(10),
    ID_Estudiante INT,
    Cedula VARCHAR(20),
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Correo VARCHAR(100),
    Fecha_Nacimiento DATE,
    Genero CHAR(1),
    Fecha_Auditoria DATETIME DEFAULT GETDATE()
);

CREATE TRIGGER auditoria_estudiantes_trigger
ON Estudiantes
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON; -- se desactivan los mensajes de recuento de filas afectadas que normalmente se envían como resultados de las operaciones de manipulación de datos

    -- Manejar inserciones
    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        INSERT INTO Auditoria_Estudiantes (Operacion, ID_Estudiante, Cedula, Nombre, Apellido, Correo, Fecha_Nacimiento, Genero)
        SELECT 'INSERT', ID_Estudiante, Cedula, Nombre, Apellido, Correo, Fecha_Nacimiento, Genero
        FROM inserted;
    END;

    -- Manejar actualizaciones
    IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
    BEGIN
        INSERT INTO Auditoria_Estudiantes (Operacion, ID_Estudiante, Cedula, Nombre, Apellido, Correo, Fecha_Nacimiento, Genero)
        SELECT 'UPDATE', ID_Estudiante, Cedula, Nombre, Apellido, Correo, Fecha_Nacimiento, Genero
        FROM inserted;
    END;

    -- Manejar eliminaciones
    IF EXISTS (SELECT 1 FROM deleted) AND NOT EXISTS (SELECT 1 FROM inserted)
    BEGIN
        INSERT INTO Auditoria_Estudiantes (Operacion, ID_Estudiante, Cedula, Nombre, Apellido, Correo, Fecha_Nacimiento, Genero)
        SELECT 'DELETE', ID_Estudiante, Cedula, Nombre, Apellido, Correo, Fecha_Nacimiento, Genero
        FROM deleted;
    END;
END;

CREATE TRIGGER Mensaje_Registro_Profesor
ON Profesores
for INSERT
AS
Print 'Nuevo profesor registrado'

CREATE TRIGGER Mensaje_borrado_Profesor
ON Profesores
for Delete
AS
Print 'Profesor borrado correctamene del sistema.'