DROP DATABASE IF EXISTS universidad;
CREATE DATABASE universidad CHARACTER SET utf8mb4;
USE universidad;
 
CREATE TABLE departamento (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE persona (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nif VARCHAR(9) UNIQUE,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(9),
    fecha_nacimiento DATE NOT NULL,
    sexo ENUM('H', 'M') NOT NULL,
    tipo ENUM('profesor', 'alumno') NOT NULL
);
 
CREATE TABLE profesor (
    id_profesor INT UNSIGNED PRIMARY KEY,
    id_departamento INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES persona(id),
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);
 
 CREATE TABLE grado (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
 
CREATE TABLE asignatura (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos FLOAT UNSIGNED NOT NULL,
    tipo ENUM('básica', 'obligatoria', 'optativa') NOT NULL,
    curso TINYINT UNSIGNED NOT NULL,
    cuatrimestre TINYINT UNSIGNED NOT NULL,
    id_profesor INT UNSIGNED,
    id_grado INT UNSIGNED NOT NULL,
    FOREIGN KEY(id_profesor) REFERENCES profesor(id_profesor),
    FOREIGN KEY(id_grado) REFERENCES grado(id)
);
 
CREATE TABLE curso_escolar (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    anyo_inicio YEAR NOT NULL,
    anyo_fin YEAR NOT NULL
);

CREATE TABLE alumno_se_matricula_asignatura (
    id_alumno INT UNSIGNED NOT NULL,
    id_asignatura INT UNSIGNED NOT NULL,
    id_curso_escolar INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar),
    FOREIGN KEY (id_alumno) REFERENCES persona(id),
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id),
    FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id)
);
 
 /* Departamento */
INSERT INTO departamento VALUES (1, 'Informática');
INSERT INTO departamento VALUES (2, 'Matemáticas');
INSERT INTO departamento VALUES (3, 'Economía y Empresa');
INSERT INTO departamento VALUES (4, 'Educación');
INSERT INTO departamento VALUES (5, 'Agronomía');
INSERT INTO departamento VALUES (6, 'Química y Física');
INSERT INTO departamento VALUES (7, 'Filología');
INSERT INTO departamento VALUES (8, 'Derecho');
INSERT INTO departamento VALUES (9, 'Biología y Geología');
 
 /* Persona */
INSERT INTO persona VALUES (1, '26902806M', 'Salvador', 'Sánchez', 'Pérez', 'Almería', 'C/ Real del barrio alto', '950254837', '1991/03/28', 'H', 'alumno');
INSERT INTO persona VALUES (2, '89542419S', 'Juan', 'Saez', 'Vega', 'Almería', 'C/ Mercurio', '618253876', '1992/08/08', 'H', 'alumno');
INSERT INTO persona VALUES (3, '11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almería', 'C/ Marte', '618223876', '1979/08/19', 'M', 'profesor');
INSERT INTO persona VALUES (4, '17105885A', 'Pedro', 'Heller', 'Pagac', 'Almería', 'C/ Estrella fugaz', NULL, '2000/10/05', 'H', 'alumno');
INSERT INTO persona VALUES (5, '38223286T', 'David', 'Schmidt', 'Fisher', 'Almería', 'C/ Venus', '678516294', '1978/01/19', 'H', 'profesor');
INSERT INTO persona VALUES (6, '04233869Y', 'José', 'Koss', 'Bayer', 'Almería', 'C/ Júpiter', '628349590', '1998/01/28', 'H', 'alumno');
INSERT INTO persona VALUES (7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almería', 'C/ Neptuno', NULL, '1999/05/24', 'H', 'alumno');
INSERT INTO persona VALUES (8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almería', 'C/ Saturno', '669162534', '1977/08/21', 'M', 'profesor');
INSERT INTO persona VALUES (9, '82842571K', 'Ramón', 'Herzog', 'Tremblay', 'Almería', 'C/ Urano', '626351429', '1996/11/21', 'H', 'alumno');
INSERT INTO persona VALUES (10, '61142000L', 'Esther', 'Spencer', 'Lakin', 'Almería', 'C/ Plutón', NULL, '1977/05/19', 'M', 'profesor');
INSERT INTO persona VALUES (11, '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almería', 'C/ Andarax', '679837625', '1997/04/26', 'H', 'alumno');
INSERT INTO persona VALUES (12, '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almería', 'C/ Almanzora', NULL, '1971-04-29', 'M', 'profesor');
INSERT INTO persona VALUES (13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almería', 'C/ Guadalquivir', '950896725', '1980/02/01', 'H', 'profesor');
INSERT INTO persona VALUES (14, '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almería', 'C/ Duero', '950263514', '1977/01/02', 'H', 'profesor');
INSERT INTO persona VALUES (15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almería', 'C/ Tajo', '668726354', '1980/03/14', 'H', 'profesor');
INSERT INTO persona VALUES (16, '10485008K', 'Antonio', 'Fahey', 'Considine', 'Almería', 'C/ Sierra de los Filabres', NULL, '1982/03/18', 'H', 'profesor');
INSERT INTO persona VALUES (17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almería', 'C/ Sierra de Gádor', NULL, '1973/05/05', 'H', 'profesor');
INSERT INTO persona VALUES (18, '04326833G', 'Micaela', 'Monahan', 'Murray', 'Almería', 'C/ Veleta', '662765413', '1976/02/25', 'H', 'profesor');
INSERT INTO persona VALUES (19, '11578526G', 'Inma', 'Lakin', 'Yundt', 'Almería', 'C/ Picos de Europa', '678652431', '1998/09/01', 'M', 'alumno');
INSERT INTO persona VALUES (20, '79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almería', 'C/ Quinto pino', NULL, '1980/10/31', 'H', 'profesor');
INSERT INTO persona VALUES (21, '79089577Y', 'Juan', 'Gutiérrez', 'López', 'Almería', 'C/ Los pinos', '678652431', '1998/01/01', 'H', 'alumno');
INSERT INTO persona VALUES (22, '41491230N', 'Antonio', 'Domínguez', 'Guerrero', 'Almería', 'C/ Cabo de Gata', '626652498', '1999/02/11', 'H', 'alumno');
INSERT INTO persona VALUES (23, '64753215G', 'Irene', 'Hernández', 'Martínez', 'Almería', 'C/ Zapillo', '628452384', '1996/03/12', 'M', 'alumno');
INSERT INTO persona VALUES (24, '85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almería', 'C/ Mercurio', '678812017', '1995/04/13', 'M', 'alumno');
 
/* Profesor */
INSERT INTO profesor VALUES (3, 1);
INSERT INTO profesor VALUES (5, 2);
INSERT INTO profesor VALUES (8, 3);
INSERT INTO profesor VALUES (10, 4);
INSERT INTO profesor VALUES (12, 4);
INSERT INTO profesor VALUES (13, 6);
INSERT INTO profesor VALUES (14, 1);
INSERT INTO profesor VALUES (15, 2);
INSERT INTO profesor VALUES (16, 3);
INSERT INTO profesor VALUES (17, 4);
INSERT INTO profesor VALUES (18, 5);
INSERT INTO profesor VALUES (20, 6);
 
 /* Grado */
INSERT INTO grado VALUES (1, 'Grado en Ingeniería Agrícola (Plan 2015)');
INSERT INTO grado VALUES (2, 'Grado en Ingeniería Eléctrica (Plan 2014)');
INSERT INTO grado VALUES (3, 'Grado en Ingeniería Electrónica Industrial (Plan 2010)');
INSERT INTO grado VALUES (4, 'Grado en Ingeniería Informática (Plan 2015)');
INSERT INTO grado VALUES (5, 'Grado en Ingeniería Mecánica (Plan 2010)');
INSERT INTO grado VALUES (6, 'Grado en Ingeniería Química Industrial (Plan 2010)');
INSERT INTO grado VALUES (7, 'Grado en Biotecnología (Plan 2015)');
INSERT INTO grado VALUES (8, 'Grado en Ciencias Ambientales (Plan 2009)');
INSERT INTO grado VALUES (9, 'Grado en Matemáticas (Plan 2010)');
INSERT INTO grado VALUES (10, 'Grado en Química (Plan 2009)');
 
/* Asignatura */
INSERT INTO asignatura VALUES (1, 'Álgegra lineal y matemática discreta', 6, 'básica', 1, 1, 3, 4);
INSERT INTO asignatura VALUES (2, 'Cálculo', 6, 'básica', 1, 1, 14, 4);
INSERT INTO asignatura VALUES (3, 'Física para informática', 6, 'básica', 1, 1, 3, 4);
INSERT INTO asignatura VALUES (4, 'Introducción a la programación', 6, 'básica', 1, 1, 14, 4);
INSERT INTO asignatura VALUES (5, 'Organización y gestión de empresas', 6, 'básica', 1, 1, 3, 4);
INSERT INTO asignatura VALUES (6, 'Estadística', 6, 'básica', 1, 2, 14, 4);
INSERT INTO asignatura VALUES (7, 'Estructura y tecnología de computadores', 6, 'básica', 1, 2, 3, 4);
INSERT INTO asignatura VALUES (8, 'Fundamentos de electrónica', 6, 'básica', 1, 2, 14, 4);
INSERT INTO asignatura VALUES (9, 'Lógica y algorítmica', 6, 'básica', 1, 2, 3, 4);
INSERT INTO asignatura VALUES (10, 'Metodología de la programación', 6, 'básica', 1, 2, 14, 4);
INSERT INTO asignatura VALUES (11, 'Arquitectura de Computadores', 6, 'básica', 2, 1, 3, 4);
INSERT INTO asignatura VALUES (12, 'Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO asignatura VALUES (13, 'Ingeniería del Software', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO asignatura VALUES (14, 'Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO asignatura VALUES (15, 'Sistemas Operativos', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO asignatura VALUES (16, 'Bases de Datos', 6, 'básica', 2, 2, 14, 4);
INSERT INTO asignatura VALUES (17, 'Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO asignatura VALUES (18, 'Fundamentos de Redes de Computadores', 6 ,'obligatoria', 2, 2, 3, 4);
INSERT INTO asignatura VALUES (19, 'Planificación y Gestión de Proyectos Informáticos', 6, 'obligatoria', 2, 2, 3, 4);
INSERT INTO asignatura VALUES (20, 'Programación de Servicios Software', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO asignatura VALUES (21, 'Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 14, 4);
INSERT INTO asignatura VALUES (22, 'Ingeniería de Requisitos', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (23, 'Integración de las Tecnologías de la Información en las Organizaciones', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (24, 'Modelado y Diseño del Software 1', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (25, 'Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (26, 'Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (27, 'Sistema de Información para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4); 
INSERT INTO asignatura VALUES (28, 'Tecnologías web', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (29, 'Teoría de códigos y criptografía', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO asignatura VALUES (30, 'Administración de bases de datos', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (31, 'Herramientas y Métodos de Ingeniería del Software', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (32, 'Informática industrial y robótica', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (33, 'Ingeniería de Sistemas de Información', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (34, 'Modelado y Diseño del Software 2', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (35, 'Negocio Electrónico', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (36, 'Periféricos e interfaces', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (37, 'Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (38, 'Tecnologías de acceso a red', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (39, 'Tratamiento digital de imágenes', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO asignatura VALUES (40, 'Administración de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (41, 'Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (42, 'Fiabilidad y Gestión de Riesgos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (43, 'Líneas de Productos Software', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (44, 'Procesos de Ingeniería del Software 1', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (45, 'Tecnologías multimedia', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO asignatura VALUES (46, 'Análisis y planificación de las TI', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (47, 'Desarrollo Rápido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (48, 'Gestión de la Calidad y de la Innovación Tecnológica', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (49, 'Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (50, 'Procesos de Ingeniería del Software 2', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (51, 'Seguridad Informática', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO asignatura VALUES (52, 'Biologia celular', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (53, 'Física', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (54, 'Matemáticas I', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (55, 'Química general', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (56, 'Química orgánica', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO asignatura VALUES (57, 'Biología vegetal y animal', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (58, 'Bioquímica', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (59, 'Genética', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (60, 'Matemáticas II', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (61, 'Microbiología', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO asignatura VALUES (62, 'Botánica agrícola', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (63, 'Fisiología vegetal', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (64, 'Genética molecular', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (65, 'Ingeniería bioquímica', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (66, 'Termodinámica y cinética química aplicada', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO asignatura VALUES (67, 'Biorreactores', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (68, 'Biotecnología microbiana', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (69, 'Ingeniería genética', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (70, 'Inmunología', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (71, 'Virología', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO asignatura VALUES (72, 'Bases moleculares del desarrollo vegetal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (73, 'Fisiología animal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (74, 'Metabolismo y biosíntesis de biomoléculas', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (75, 'Operaciones de separación', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (76, 'Patología molecular de plantas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (77, 'Técnicas instrumentales básicas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO asignatura VALUES (78, 'Bioinformática', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (79, 'Biotecnología de los productos hortofrutículas', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (80, 'Biotecnología vegetal', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (81, 'Genómica y proteómica', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (82, 'Procesos biotecnológicos', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO asignatura VALUES (83, 'Técnicas instrumentales avanzadas', 4.5, 'obligatoria', 3, 2, NULL, 7);

/* Curso escolar */
INSERT INTO curso_escolar VALUES (1, 2014, 2015);
INSERT INTO curso_escolar VALUES (2, 2015, 2016);
INSERT INTO curso_escolar VALUES (3, 2016, 2017);
INSERT INTO curso_escolar VALUES (4, 2017, 2018);
INSERT INTO curso_escolar VALUES (5, 2018, 2019);

/* Alumno se matricula en asignatura */
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 1, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (2, 1, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (2, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (2, 3, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 1, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 2, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 3, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 1, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 2, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 3, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 4, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 5, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 6, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 7, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 8, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 9, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (24, 10, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 1, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 2, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 3, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 4, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 5, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 6, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 7, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 8, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 9, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (23, 10, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 1, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 2, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 3, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 4, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 5, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 6, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 7, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 8, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 9, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (19, 10, 5);

SELECT apellido1, apellido2, nombre
FROM persona
WHERE tipo = 'alumno'
ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;

SELECT apellido1, apellido2, nombre
FROM persona
WHERE tipo = 'alumno' AND telefono IS NULL;

SELECT apellido1, apellido2, nombre
FROM persona
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

SELECT nombre, apellido1, apellido2
FROM persona
WHERE tipo = 'profesor'
AND telefono IS NULL
AND nif LIKE '%K';

SELECT asignatura.nombre
FROM asignatura
WHERE curso = 3 AND cuatrimestre = 1  AND id_grado = 7;

SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS department_name
FROM persona p
JOIN profesor pr ON p.id = pr.id_profesor
JOIN departamento d ON pr.id_departamento = d.id
WHERE p.tipo = 'profesor'
ORDER BY p.apellido1, p.nombre;

SELECT a.nombre AS subject_name, c.anyo_inicio AS start_year, c.anyo_fin AS end_year
FROM persona p
JOIN alumno_se_matricula_asignatura b ON p.id = b.id_alumno
JOIN asignatura a ON b.id_asignatura = a.id
JOIN curso_escolar c ON b.id_curso_escolar = c.id
WHERE p.nif = '26902806M';

SELECT DISTINCT d.nombre AS department_name
FROM departamento d
JOIN profesor p ON d.id = p.id_departamento
JOIN asignatura a ON p.id_profesor = a.id_profesor
JOIN grado g ON a.id_grado = g.id
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

SELECT DISTINCT p.nombre, p.apellido1, p.apellido2
FROM persona p
JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno
JOIN curso_escolar ce ON am.id_curso_escolar = ce.id
WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019;

/*Solve the following 6 queries using the LEFT JOIN and RIGHT JOIN clauses.*/

SELECT d.nombre AS department_name, p.apellido1 AS last_name, p.apellido2 AS second_last_name, p.nombre AS teacher_name
FROM departamento d
LEFT JOIN profesor pr ON d.id = pr.id_departamento
LEFT JOIN persona p ON pr.id_profesor = p.id
ORDER BY department_name, last_name, teacher_name;

SELECT p.apellido1 AS last_name, p.apellido2 AS second_last_name, p.nombre AS teacher_name
FROM persona p
LEFT JOIN profesor pr ON p.id = pr.id_profesor
WHERE pr.id_profesor IS NULL
AND p.tipo = 'profesor'
ORDER BY last_name, teacher_name;

SELECT d.nombre AS department_name
FROM departamento d
LEFT JOIN profesor pr ON d.id = pr.id_departamento
WHERE pr.id_departamento IS NULL
ORDER BY department_name;

SELECT d.nombre AS department_name
FROM departamento d
LEFT JOIN profesor p ON d.id = p.id_departamento
WHERE p.id_departamento IS NULL;

SELECT p.id AS teacher_id, p.nombre AS teacher_name, p.apellido1 AS first_last_name, p.apellido2 AS second_last_name
FROM persona p
LEFT JOIN profesor pr ON p.id = pr.id_profesor
LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor
WHERE a.id_profesor IS NULL AND p.tipo = 'profesor';

SELECT a.id AS subject_id, a.nombre AS subject_name
FROM asignatura a
LEFT JOIN profesor p ON a.id_profesor = p.id_profesor
WHERE p.id_profesor IS NULL;

SELECT d.id AS department_id, d.nombre AS department_name
FROM departamento d
LEFT JOIN profesor p ON d.id = p.id_departamento
LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor
LEFT JOIN alumno_se_matricula_asignatura m ON a.id = m.id_asignatura
WHERE m.id_alumno IS NULL
GROUP BY d.id
HAVING COUNT(a.id) = 0;

/* Summary Queries */

SELECT COUNT(*) AS total_students
FROM persona
WHERE tipo = 'alumno';

SELECT COUNT(*) AS students_born_in_1999
FROM persona
WHERE YEAR(fecha_nacimiento) = 1999 AND tipo = 'alumno';

SELECT d.nombre AS department_name, COUNT(p.id_profesor) AS number_of_teachers
FROM departamento d
JOIN profesor p ON d.id = p.id_departamento
GROUP BY d.id
ORDER BY number_of_teachers DESC;

SELECT d.nombre AS department_name, COUNT(p.id_profesor) AS number_of_professors
FROM departamento d
LEFT JOIN profesor p ON d.id = p.id_departamento
GROUP BY d.id, d.nombre
ORDER BY number_of_professors DESC;

SELECT g.nombre AS degree_name, COUNT(a.id) AS number_of_subjects
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.id, g.nombre
ORDER BY number_of_subjects DESC;

SELECT g.nombre AS degree_name, COUNT(a.id) AS number_of_subjects
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.id, g.nombre
HAVING number_of_subjects > 40
ORDER BY number_of_subjects DESC;

SELECT g.nombre AS degree_name, a.tipo AS subject_type, SUM(a.creditos) AS total_credits
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.id, a.tipo
ORDER BY g.nombre, a.tipo;

SELECT ce.anyo_inicio AS school_year_start, COUNT(ama.id_alumno) AS enrolled_students
FROM curso_escolar ce
LEFT JOIN alumno_se_matricula_asignatura ama ON ce.id = ama.id_curso_escolar
GROUP BY ce.anyo_inicio
ORDER BY ce.anyo_inicio;

SELECT p.id AS id, p.nombre AS name, p.apellido1 AS first_last_name, p.apellido2 AS second_last_name, COUNT(a.id) AS number_of_subjects
FROM persona p
LEFT JOIN profesor pr ON p.id = pr.id_profesor
LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor
GROUP BY p.id, p.nombre, p.apellido1, p.apellido2
ORDER BY number_of_subjects DESC;

SELECT *
FROM persona
WHERE tipo = 'alumno'
ORDER BY fecha_nacimiento DESC
LIMIT 1;

SELECT p.*
FROM persona p
JOIN profesor pr ON p.id = pr.id_profesor
LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor
WHERE pr.id_departamento IS NOT NULL
AND a.id IS NULL;

SELECT p.*
FROM persona p
JOIN profesor pr ON p.id = pr.id_profesor
LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor
WHERE pr.id_departamento IS NOT NULL
AND a.id IS NULL;

SELECT p.nombre AS professor_name, p.apellido1 AS professor_last_name, d.nombre AS associate_department
FROM persona p
JOIN profesor pr ON p.id = pr.id_profesor
JOIN departamento d ON pr.id_departamento = d.id
LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor
WHERE a.id IS NULL;
