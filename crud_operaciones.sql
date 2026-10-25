-- ==========================================
-- PARTE 7: CRUD COMPLETO (SQL)
-- ==========================================

-- ==========================================
-- 1. CLIENTES (CREATE, READ, UPDATE, DELETE)
-- ==========================================

-- CREATE (Alta de un nuevo cliente)
INSERT INTO cliente (nombre, apellido, dni, email, telefono) 
VALUES ('Roberto', 'Giménez', '36789123', 'roberto@mail.com', '1155443322');

-- READ (Consultar cliente por ID o DNI)
SELECT * FROM cliente WHERE dni = '36789123';

-- UPDATE (Modificar datos de un cliente, por ejemplo, el teléfono)
UPDATE cliente 
SET telefono = '1199887766' 
WHERE dni = '36789123';

-- DELETE / BAJA (Eliminar un cliente)
DELETE FROM cliente 
WHERE dni = '36789123';


-- ==========================================
-- 2. PÓLIZAS (CREATE, READ, UPDATE, DELETE)
-- ==========================================

-- CREATE (Alta de una póliza asociada a un cliente)
INSERT INTO poliza (numero_poliza, id_cliente, id_cobertura, fecha_inicio, fecha_vencimiento, estado) 
VALUES ('POL-010', 1, 2, '2026-03-01', '2027-03-01', 'Activa');

-- READ (Consultar póliza)
SELECT * FROM poliza WHERE numero_poliza = 'POL-010';

-- UPDATE (Modificar el estado de la póliza, por ejemplo, a Suspendida)
UPDATE poliza 
SET estado = 'Suspendida' 
WHERE numero_poliza = 'POL-010';

-- DELETE / BAJA (Eliminar póliza)
DELETE FROM poliza 
WHERE numero_poliza = 'POL-010';


-- ==========================================
-- 3. SINIESTROS (CREATE, READ, UPDATE, DELETE)
-- ==========================================

-- CREATE (Registrar un siniestro sobre una póliza)
INSERT INTO siniestro (id_poliza, fecha, tipo, descripcion, estado) 
VALUES (1, '2026-03-10', 'Caída', 'Caída de nivel en domicilio particular', 'En revisión');

-- READ (Consultar siniestros)
SELECT * FROM siniestro WHERE id_poliza = 1;

-- UPDATE (Modificar el estado del siniestro, ej: de En revisión a Cerrado)
UPDATE siniestro 
SET estado = 'Cerrado' 
WHERE id_siniestro = 1;

-- DELETE / BAJA (Eliminar registro de siniestro)
DELETE FROM siniestro 
WHERE id_siniestro = 1;