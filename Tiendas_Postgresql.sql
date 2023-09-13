CREATE TABLE cliente (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    telefono INTEGER NOT NULL
 );
  
CREATE TABLE sucursal (
    id SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    direccion TEXT NOT NULL
 );

CREATE TABLE orden (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER,
    sucursal_id INTEGER,
    fecha_de_orden DATE NOT NULL,
    total INTEGER,
    CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    CONSTRAINT fk_sucursal FOREIGN KEY (sucursal_id) REFERENCES sucursal(id)
);

CREATE TABLE stock (
    id SERIAL PRIMARY KEY,
    sucursal_id INTEGER,
    producto_id INTEGER,
    cantidad INTEGER,
    UNIQUE (sucursal_id, producto_id),
    CONSTRAINT fk_sucursal FOREIGN KEY (sucursal_id) REFERENCES sucursal(id),
    CONSTRAINT fk_producto FOREIGN KEY (producto_id) REFERENCES producto(id)
);

CREATE TABLE producto (
	id SERIAL PRIMARY KEY,
	nombre TEXT NOT NULL,
	marca TEXT NOT NULL,
	precio_unitario INTEGER NOT NULL,
	categoria_id INTEGER,
    CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) REFERENCES Categoria(id)
);

CREATE TABLE item(
	id  SERIAL PRIMARY KEY,
	cantidad INT NOT NULL,
	monto_venta INTEGER NOT NULL,
	orden_id INTEGER,
	producto_id INTEGER,
    CONSTRAINT fk_uorden FOREIGN KEY (orden_id) REFERENCES Orden(id),
    CONSTRAINT fk_producto FOREIGN KEY (producto_id) REFERENCES Producto(id)
	);

CREATE TABLE Categoria(
	id INTEGER PRIMARY KEY,
	nombre TEXT NOT NULL
);
