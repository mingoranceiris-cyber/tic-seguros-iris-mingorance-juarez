-- 1. Tabla cliente (proporcionada por el profe)
CREATE TABLE cliente (
       id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
       nombre TEXT NOT NULL,
       apellido TEXT NOT NULL,
       dni TEXT UNIQUE NOT NULL,
       email TEXT,
       telefono TEXT
);

-- 2. Tabla poliza (proporcionada por el profe, relacionada al cliente)
CREATE TABLE poliza (
     id_poliza INTEGER PRIMARY KEY AUTOINCREMENT,
     numero_poliza TEXT UNIQUE NOT NULL,
     id_cliente INTEGER NOT NULL,
     fecha_inicio DATE,
     fecha_fin DATE,
     estado TEXT,
     FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);