USE facultad_ingenieria;

-- ============================================
-- DOCENTE (5 filas)
-- ============================================

INSERT INTO docente (nombre) VALUES
('Carlos Andrés Rodríguez'),
('María Fernanda Gómez'),
('Jorge Luis Pérez'),
('Ana Lucía Martínez'),
('Ricardo Alberto Torres');

-- ============================================
-- ESTUDIANTE (5 filas)
-- ============================================

INSERT INTO estudiante (codigoCarnet, nombre) VALUES
(20190001, 'Juan Sebastián López'),
(20190002, 'Laura Camila Hernández'),
(20190003, 'Andrés Felipe Ramírez'),
(20190004, 'Diana Carolina Castro'),
(20190005, 'Mateo Alejandro Ruiz');

-- ============================================
-- CURSO (5 filas)
-- ============================================

INSERT INTO curso (nombre, facultad, plan_estudios, tipologia, creditos, código, descripcion) VALUES
('Cálculo Diferencial', 'Ingeniería', 'Plan 2019', 'Fundamentación obligatoria', 4, 101, 'Curso de cálculo diferencial para ingeniería.'),
('Álgebra Lineal', 'Ingeniería', 'Plan 2019', 'Fundamentación obligatoria', 3, 102, 'Curso de álgebra lineal aplicado a ingeniería.'),
('Programación Orientada a Objetos', 'Ingeniería', 'Plan 2019', 'Disciplinar obligatoria', 4, 103, 'Introducción a la programación orientada a objetos.'),
('Bases de Datos', 'Ingeniería', 'Plan 2019', 'Disciplinar optativa', 3, 104, 'Curso sobre diseño y gestión de bases de datos.'),
('Ingeniería de Software', 'Ingeniería', 'Plan 2019', 'Trabajo de grado', 5, 105, 'Fundamentos de ingeniería de software y metodologías.');


-- ============================================
-- PERIODO (5 semestres)
-- ============================================

INSERT INTO periodo (nombre, fecha_inicio, fecha_fin) VALUES
('2019-2', '2019-07-01', '2019-12-01'),  -- Segundo semestre 2019
('2020-1', '2020-01-15', '2020-06-15'),  -- Primer semestre 2020
('2020-2', '2020-07-01', '2020-12-01'),  -- Segundo semestre 2020
('2021-1', '2021-01-15', '2021-06-15'),  -- Primer semestre 2021
('2021-2', '2021-07-01', '2021-12-01');  -- Segundo semestre 2021


-- ============================================
-- MATRICULA (5 filas)
-- ============================================

INSERT INTO matricula (id_estudiante, id_periodo) VALUES
(1, 5),
(2, 5),
(3, 5),
(4, 4),
(5, 3);

-- ============================================
-- CURSO_PERIODO
-- ============================================

INSERT INTO curso_periodo (id_curso, id_periodo, id_docente) VALUES
(1, 5, 1),
(2, 5, 2),
(3, 5, 3),
(4, 4, 5),
(5, 3, 1);

-- ============================================
-- MATRICULA_CURSO (con calificaciones)
-- ============================================

INSERT INTO matricula_curso (id_matricula, id_curso, calificacion) VALUES
(1, 1, 4.2),
(1, 2, 4.0),
(2, 1, 3.8),
(2, 3, 4.5),
(3, 3, 4.1),
(3, 4, 4.3),
(4, 5, 3.9),
(5, 2, 4.0);
