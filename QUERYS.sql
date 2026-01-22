USE facultad_ingenieria;

select * from curso;
select * from curso_periodo;
select * from docente;
select * from estudiante;
select * from matricula;
select * from matricula_curso;
select * from periodo;
-- =============================================================
-- 1.¿Cuántos docentes activos hay en la Facultad de Ingeniería?
-- =============================================================

SELECT COUNT(DISTINCT cp.id_docente) AS docentes_activos
FROM curso_periodo cp
JOIN periodo p ON cp.id_periodo = p.id_periodo
WHERE p.fecha_inicio = (
    SELECT MAX(fecha_inicio)
    FROM periodo
);

-- =============================================================
-- 2.¿Cuáles son los cursos que se dictaron en un periodo dado?
-- =============================================================

SELECT c.id_curso, c.nombre
FROM curso c
JOIN curso_periodo cp ON c.id_curso = cp.id_curso
WHERE cp.id_periodo = 5;

-- =============================================================
-- 3.¿Cuál es la lista de estudiantes para el periodo actual?
-- =============================================================

SELECT DISTINCT e.id_estudiante, e.nombre
FROM estudiante e
JOIN matricula m ON e.id_estudiante = m.id_estudiante
JOIN periodo p ON m.id_periodo = p.id_periodo
WHERE p.fecha_inicio = (
    SELECT MAX(fecha_inicio)
    FROM periodo
);

-- =============================================================
-- 4.¿Cuál es el promedio de las calificaciones obtenidas en un 
--   curso los últimos 5 años?
-- =============================================================

SELECT AVG(mc.calificacion) AS promedio_calificaciones
FROM matricula_curso mc
JOIN matricula m ON mc.id_matricula = m.id_matricula
JOIN periodo p ON m.id_periodo = p.id_periodo
WHERE mc.id_curso = 3
  AND p.fecha_inicio >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR);

-- =============================================================
-- 5.¿Cuál sería el procedimiento para crear un nuevo curso 
--    y asignarle un docente?
-- =============================================================
  DELIMITER $$

CREATE PROCEDURE crear_curso_y_asignar_docente (
    IN p_nombre_curso VARCHAR(100),
    IN p_facultad VARCHAR(100),
    IN p_plan_estudios VARCHAR(100),
    IN p_tipologia ENUM(
        'Fundamentación obligatoria',
        'Disciplinar obligatoria',
        'Disciplinar optativa',
        'Libre elección',
        'Trabajo de grado',
        'Nivelación'
    ),
    IN p_creditos TINYINT,
    IN p_codigo INT,
    IN p_descripcion VARCHAR(500),
    IN p_id_docente INT
)
BEGIN
    DECLARE v_id_curso INT;
    DECLARE v_id_periodo INT;

    -- Crear el curso con todos los datos obligatorios
    INSERT INTO curso (nombre, facultad, plan_estudios, tipologia, creditos, código, descripcion)
    VALUES (p_nombre_curso, p_facultad, p_plan_estudios, p_tipologia, p_creditos, p_codigo, p_descripcion);

    -- Obtener el ID del curso creado
    SET v_id_curso = LAST_INSERT_ID();

    -- Obtener el ID del periodo con fecha de inicio más reciente
    SELECT id_periodo INTO v_id_periodo
    FROM periodo
    ORDER BY fecha_inicio DESC
    LIMIT 1;

    -- Asignar docente al curso en el periodo más reciente
    INSERT INTO curso_periodo (id_curso, id_periodo, id_docente)
    VALUES (v_id_curso, v_id_periodo, p_id_docente);
END $$

DELIMITER ;

CALL crear_curso_y_asignar_docente(
    'Optimización',
    'Ingeniería',
    'Plan 2019',
    'Disciplinar optativa',
    3,
    106,
    'Curso de optimización de procesos y recursos.',
    1   -- ID del docente
);

