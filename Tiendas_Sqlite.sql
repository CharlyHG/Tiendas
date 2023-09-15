CREATE TABLE Cliente (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    telefono INTEGER NOT NULL
 );
  
CREATE TABLE Sucursal (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    direccion TEXT NOT NULL
 );

CREATE TABLE Orden (
    id INTEGER PRIMARY KEY,
    cliente_id INTEGER,
    sucursal_id INTEGER,
    fecha_de_orden DATE NOT NULL,
    total INTEGER,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id),
    FOREIGN KEY (sucursal_id) REFERENCES Sucursal(id)
);

CREATE TABLE Stock (
    id INTEGER PRIMARY KEY,
    sucursal_id INTEGER,
    producto_id INTEGER,
    cantidad INTEGER,
    UNIQUE (sucursal_id, producto_id),
    FOREIGN KEY (sucursal_id) REFERENCES Sucursal(id),
    FOREIGN KEY (producto_id) REFERENCES Producto(id)
);

CREATE TABLE Producto (
	id INTEGER PRIMARY KEY,
	nombre TEXT NOT NULL,
	marca TEXT NOT NULL,
	precio_unitario INTEGER NOT NULL,
	categoria_id INTEGER,
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id)
);

CREATE TABLE Item(
	id  INTEGER PRIMARY KEY,
	cantidad INT NOT NULL,
	monto_venta INTEGER NOT NULL,
	orden_id INTEGER,
	producto_id INTEGER,
    FOREIGN KEY (orden_id) REFERENCES Orden(id),
    FOREIGN KEY (producto_id) REFERENCES Producto(id)
	);

CREATE TABLE Categoria(
	id INTEGER PRIMARY KEY,
	nombre TEXT NOT NULL
);