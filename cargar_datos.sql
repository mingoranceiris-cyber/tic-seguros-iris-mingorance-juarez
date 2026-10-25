-- ==========================================
-- 1. CREACIÓN DE LAS TABLAS
-- ==========================================

CREATE TABLE IF NOT EXISTS cliente (
       id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
       nombre TEXT NOT NULL,
       apellido TEXT NOT NULL,
       dni TEXT UNIQUE NOT NULL,
       email TEXT,
       telefono TEXT
);

CREATE TABLE IF NOT EXISTS cobertura (
       id_cobertura INTEGER PRIMARY KEY AUTOINCREMENT,
       nombre TEXT NOT NULL,
       descripcion TEXT
);

CREATE TABLE IF NOT EXISTS poliza (
     id_poliza INTEGER PRIMARY KEY AUTOINCREMENT,
     numero_poliza TEXT UNIQUE NOT NULL,
     id_cliente INTEGER NOT NULL,
     id_cobertura INTEGER NOT NULL,
     fecha_inicio DATE,
     fecha_fin DATE,
     estado TEXT,
     FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
     FOREIGN KEY (id_cobertura) REFERENCES cobertura(id_cobertura)
);

CREATE TABLE IF NOT EXISTS pago (
     id_pago INTEGER PRIMARY KEY AUTOINCREMENT,
     id_poliza INTEGER NOT NULL,
     fecha DATE,
     importe REAL,
     estado TEXT,
     FOREIGN KEY (id_poliza) REFERENCES poliza(id_poliza)
);

CREATE TABLE IF NOT EXISTS siniestro (
     id_siniestro INTEGER PRIMARY KEY AUTOINCREMENT,
     id_poliza INTEGER NOT NULL,
     fecha DATE,
     tipo TEXT,
     descripcion TEXT,
     estado TEXT,
     FOREIGN KEY (id_poliza) REFERENCES poliza(id_poliza)
);

-- ==========================================
-- 2. DATOS DE PRUEBA (5 Coberturas)
-- ==========================================
INSERT INTO cobertura (nombre, descripcion) VALUES ('Accidentes Totales', 'Cobertura por muerte accidental e invalidez.');
INSERT INTO cobertura (nombre, descripcion) VALUES ('Asistencia Médica', 'Cobertura por gastos médicos y farmacéuticos.');
INSERT INTO cobertura (nombre, descripcion) VALUES ('Renta Diaria', 'Pago diario por internación.');
INSERT INTO cobertura (nombre, descripcion) VALUES ('Invalidez Parcial', 'Indemnización por pérdida parcial.');
INSERT INTO cobertura (nombre, descripcion) VALUES ('Completa Plus', 'Cobertura total médica y de vida.');

-- (10 Clientes)
INSERT INTO cliente (nombre, apellido, dni, email, telefono) VALUES ('Juan', 'Pérez', '35111222', 'juan@mail.com', '1122334455');
INSERT INTO cliente (nombre, apellido, dni, email, telefono) VALUES ('María', 'Gómez', '35222333', 'maria@mail.com', '1122334456');
INSERT INTO cliente (nombre, apellido, dni, email, telefono) VALUES ('Carlos', 'López', '35333444', 'carlos@mail.com', '1122334457');
INSERT INTO cliente (nombre, apellido, dni, email, telefono) VALUES ('Ana', 'Martínez', '35444555', 'ana@mail.com', '1122334458');
INSERT INTO cliente (nombre, apellido, dni, email, telefono) VALUES ('Luis', 'Rodríguez', '35555666', 'luis@mail.com', '1122334459');
INSERT INTO cliente (nombre, apellido, dni, email, telefono) VALUES ('Sofía', 'Fernández', '35666777', 'sofia@mail.com', '1122334460');
INSERT INTO cliente (nombre, apellido, dni, email, telefono) VALUES ('Jorge', 'Díaz', '35777888', 'jorge@mail.com', '1122334461');
INSERT INTO cliente (nombre, apellido, dni, email, telefono) VALUES ('Lucía', 'Paz', '35888999', 'lucia@mail.com', '1122334462');
INSERT INTO cliente (nombre, apellido, dni, email, telefono) VALUES ('Miguel', 'Torres', '35999000', 'miguel@mail.com', '1122334463');
INSERT INTO cliente (nombre, apellido, dni, email, telefono) VALUES ('Valeria', 'Ruiz', '35000111', 'valeria@mail.com', '1122334464');

-- (10 Pólizas)
INSERT INTO poliza (numero_poliza, id_cliente, id_cobertura, fecha_inicio, fecha_fin, estado) VALUES ('POL-001', 1, 1, '2026-01-01', '2027-01-01', 'Activa');
INSERT INTO poliza (numero_poliza, id_cliente, id_cobertura, fecha_inicio, fecha_fin, estado) VALUES ('POL-002', 2, 2, '2026-01-05', '2027-01-05', 'Activa');
INSERT INTO poliza (numero_poliza, id_cliente, id_cobertura, fecha_inicio, fecha_fin, estado) VALUES ('POL-003', 3, 3, '2026-01-10', '2027-01-10', 'Activa');
INSERT INTO poliza (numero_poliza, id_cliente, id_cobertura, fecha_inicio, fecha_fin, estado) VALUES ('POL-004', 4, 4, '2026-02-01', '2027-02-01', 'Activa');
INSERT INTO poliza (numero_poliza, id_cliente, id_cobertura, fecha_inicio, fecha_fin, estado) VALUES ('POL-005', 5, 5, '2026-02-15', '2027-02-15', 'Activa');
INSERT INTO poliza (numero_poliza, id_cliente, id_cobertura, fecha_inicio, fecha_fin, estado) VALUES ('POL-006', 6, 1, '2026-03-01', '2027-03-01', 'Activa');
INSERT INTO poliza (numero_poliza, id_cliente, id_cobertura, fecha_inicio, fecha_fin, estado) VALUES ('POL-007', 7, 2, '2026-03-10', '2027-03-10', 'Suspendida');
INSERT INTO poliza (numero_poliza, id_cliente, id_cobertura, fecha_inicio, fecha_fin, estado) VALUES ('POL-008', 8, 3, '2026-04-01', '2027-04-01', 'Activa');
INSERT INTO poliza (numero_poliza, id_cliente, id_cobertura, fecha_inicio, fecha_fin, estado) VALUES ('POL-009', 9, 4, '2026-04-15', '2027-04-15', 'Activa');
INSERT INTO poliza (numero_poliza, id_cliente, id_cobertura, fecha_inicio, fecha_fin, estado) VALUES ('POL-010', 10, 5, '2026-05-01', '2027-05-01', 'Activa');

-- (15 Pagos)
INSERT INTO pago (id_poliza, fecha, importe, estado) VALUES (1, '2026-01-02', 15000.0, 'Aprobado');
INSERT INTO pago (id_poliza, fecha, importe, estado) VALUES (1, '2026-02-02', 15000.0, 'Aprobado');
INSERT INTO pago (id_poliza, fecha, importe, estado) VALUES (2, '2026-01-06', 12000.0, 'Aprobado');
INSERT INTO pago (id_poliza, fecha, importe, estado) VALUES (2, '2026-02-06', 12000.0, 'Aprobado');
INSERT INTO pago (id_poliza, fecha, importe, estado) VALUES (3, '2026-01-11', 18000.0, 'Aprobado');
INSERT INTO pago (id_poliza, fecha, importe, estado) VALUES (4, '2026-02-02', 20000.0, 'Aprobado');
INSERT INTO pago (id_poliza, fecha, importe, estado) VALUES (5, '2026-02-16', 25000.0, 'Aprobado');
INSERT INTO pago (id_poliza, fecha, importe, estado) VALUES (6, '2026-03-02', 15000.0, 'Aprobado');
INSERT INTO pago (id_poliza, fecha, importe, estado) VALUES (7, '2026-03-11', 12000.0, 'Pendiente');
INSERT INTO pago (id_poliza, fecha, importe, estado) VALUES (8, '2026-04-02', 18000.0, 'Aprobado');
INSERT INTO pago (id_poliza, fecha, importe, estado) VALUES (9, '2026-04-16', 20000.0, 'Aprobado');
INSERT INTO pago (id_poliza, fecha, importe, estado) VALUES (10, '2026-05-02', 25000.0, 'Aprobado');
INSERT INTO pago (id_poliza, fecha, importe, estado) VALUES (3, '2026-02-11', 18000.0, 'Aprobado');
INSERT INTO pago (id_poliza, fecha, importe, estado) VALUES (4, '2026-03-02', 20000.0, 'Aprobado');
INSERT INTO pago (id_poliza, fecha, importe, estado) VALUES (5, '2026-03-16', 25000.0, 'Aprobado');

-- (10 Siniestros)
INSERT INTO siniestro (id_poliza, fecha, tipo, descripcion, estado) VALUES (1, '2026-01-15', 'Caída', 'Caída de altura en vía pública', 'Cerrado');
INSERT INTO siniestro (id_poliza, fecha, tipo, descripcion, estado) VALUES (2, '2026-01-20', 'Accidente vial', 'Choque leve en moto', 'En revisión');
INSERT INTO siniestro (id_poliza, fecha, tipo, descripcion, estado) VALUES (3, '2026-02-05', 'Laboral', 'Golpe con herramienta pesada', 'Cerrado');
INSERT INTO siniestro (id_poliza, fecha, tipo, descripcion, estado) VALUES (4, '2026-02-18', 'Caída', 'Resbalón en escalera de la oficina', 'Cerrado');
INSERT INTO siniestro (id_poliza, fecha, tipo, descripcion, estado) VALUES (5, '2026-03-01', 'Accidente vial', 'Accidente en transporte público', 'En revisión');
INSERT INTO siniestro (id_poliza, fecha, tipo, descripcion, estado) VALUES (6, '2026-03-12', 'Laboral', 'Corte leve en mano manipulando material', 'Cerrado');
INSERT INTO siniestro (id_poliza, fecha, tipo, descripcion, estado) VALUES (7, '2026-03-20', 'Caída', 'Tropiezo en la vía pública', 'Pendiente');
INSERT INTO siniestro (id_poliza, fecha, tipo, descripcion, estado) VALUES (8, '2026-04-05', 'Accidente vial', 'Colisión menor conduciendo bicicleta', 'Cerrado');
INSERT INTO siniestro (id_poliza, fecha, tipo, descripcion, estado) VALUES (9, '2026-04-20', 'Laboral', 'Escuincle/esguince de muñeca trabajando', 'En revisión');
INSERT INTO siniestro (id_poliza, fecha, tipo, descripcion, estado) VALUES (10, '2026-05-05', 'Caída', 'Caída bajando del colectivo', 'Cerrado');