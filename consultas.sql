-- 1. Mostrar todos los clientes.
SELECT * 
FROM cliente;

-- 2. Ordenar clientes alfabéticamente por apellido.
SELECT * 
FROM cliente 
ORDER BY apellido ASC;

-- 3. Buscar clientes cuyo apellido comience con A.
SELECT * 
FROM cliente 
WHERE apellido LIKE 'A%';

-- 4. Buscar una póliza por número.
SELECT * 
FROM poliza 
WHERE numero_poliza = 'POL-001';

-- 5. Contar la cantidad de clientes.
SELECT COUNT(*) AS total_clientes 
FROM cliente;

-- 6. Contar la cantidad de pólizas activas.
SELECT COUNT(*) AS total_polizas_activas 
FROM poliza 
WHERE estado = 'Activa';

-- 7. Contar la cantidad de siniestros.
SELECT COUNT(*) AS total_siniestros 
FROM siniestro;

-- 8. Calcular el promedio de pagos.
SELECT AVG(importe) AS promedio_pagos 
FROM pago;

-- ==========================================
-- 11. JOIN OBLIGATORIOS
-- ==========================================

-- 1. Cliente + Póliza: Muestra el nombre del cliente, su DNI y el número y estado de su póliza
SELECT 
    c.nombre, 
    c.apellido, 
    c.dni, 
    p.numero_poliza, 
    p.estado AS estado_poliza,
    p.fecha_inicio
FROM cliente c
JOIN poliza p ON c.id_cliente = p.id_cliente;


-- 2. Póliza + Siniestro: Muestra el número de póliza, la fecha del siniestro, el tipo y su descripción
SELECT 
    p.numero_poliza, 
    s.fecha AS fecha_siniestro, 
    s.tipo AS tipo_siniestro, 
    s.descripcion, 
    s.estado AS estado_siniestro
FROM poliza p
JOIN siniestro s ON p.id_poliza = s.id_poliza;


-- 3. Cliente + Póliza + Siniestro: Junta las 3 tablas para ver quién es el cliente que tuvo cada siniestro
SELECT 
    c.nombre, 
    c.apellido, 
    p.numero_poliza, 
    s.fecha AS fecha_siniestro, 
    s.tipo AS tipo_siniestro, 
    s.descripcion
FROM cliente c
JOIN poliza p ON c.id_cliente = p.id_cliente
JOIN siniestro s ON p.id_poliza = s.id_poliza;

-- 1. Cantidad de clientes totales
SELECT COUNT(*) AS total_clientes 
FROM cliente;

-- 2. Cantidad de pólizas activas
SELECT COUNT(*) AS total_polizas_activas 
FROM poliza 
WHERE estado = 'Activa';

-- 3. Cantidad de siniestros abiertos (En revisión)
SELECT COUNT(*) AS siniestros_abiertos 
FROM siniestro 
WHERE estado = 'En revisión';

-- 4. Cantidad de siniestros cerrados
SELECT COUNT(*) AS siniestros_cerrados 
FROM siniestro 
WHERE estado = 'Cerrado';

-- Gráfico 1: Pólizas agrupadas por estado
SELECT estado, COUNT(*) AS cantidad 
FROM poliza 
GROUP BY estado;

-- Gráfico 2: Siniestros agrupados por tipo
SELECT tipo, COUNT(*) AS cantidad 
FROM siniestro 
GROUP BY tipo;

-- Gráfico 3: Siniestros agrupados por mes (extrayendo el mes de la fecha)
SELECT SUBSTR(fecha, 6, 2) AS mes, COUNT(*) AS cantidad 
FROM siniestro 
GROUP BY mes;