-- ============================================
-- Base de Datos: Facultad de Ingeniería
-- Motor: MySQL
-- ============================================

DROP DATABASE IF EXISTS facultad_ingenieria;
CREATE DATABASE facultad_ingenieria;
USE facultad_ingenieria;

-- ============================================
-- TABLAS PRINCIPALES
-- ============================================

CREATE TABLE docente (
    id_docente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE estudiante (
    id_estudiante INT AUTO_INCREMENT PRIMARY KEY,
    codigoCarnet INT NOT NULL,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    facultad VARCHAR(100) NOT NULL,
    plan_estudios VARCHAR(100) NOT NULL,
    tipologia ENUM(
        'Fundamentación obligatoria',
        'Disciplinar obligatoria',
        'Disciplinar optativa',
        'Libre elección',
        'Trabajo de grado',
        'Nivelación'
    ) NOT NULL,
    creditos TINYINT NOT NULL CHECK (creditos BETWEEN 1 AND 15),
    código INT NOT NULL,
    descripcion VARCHAR(500) NOT NULL
);

CREATE TABLE periodo (
    id_periodo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL
);

-- Matrícula del estudiante en un periodo
CREATE TABLE matricula (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_estudiante INT,
    id_periodo INT,
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante),
    FOREIGN KEY (id_periodo) REFERENCES periodo(id_periodo)
);

-- ============================================
-- TABLAS RELACIONALES
-- ============================================

-- Curso dictado por un docente en un periodo
CREATE TABLE curso_periodo (
    id_curso INT,
    id_periodo INT,
    id_docente INT,
    PRIMARY KEY (id_curso, id_periodo),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso),
    FOREIGN KEY (id_periodo) REFERENCES periodo(id_periodo),
    FOREIGN KEY (id_docente) REFERENCES docente(id_docente)
);


-- Relación muchos a muchos entre matrícula y curso
CREATE TABLE matricula_curso (
    id_matricula INT,
    id_curso INT,
    calificacion DECIMAL(4,2),
    PRIMARY KEY (id_matricula, id_curso),
    FOREIGN KEY (id_matricula) REFERENCES matricula(id_matricula),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

