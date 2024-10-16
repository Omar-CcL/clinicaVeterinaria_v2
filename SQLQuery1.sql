USE master
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'ClinicaVeterinaria')
    DROP DATABASE ClinicaVeterinaria
GO

-- Crear base de datos
CREATE DATABASE ClinicaVeterinaria;
GO

USE ClinicaVeterinaria;
GO

-- Tabla para categorias de estados
CREATE TABLE Categorias (
    categoria_id INT PRIMARY KEY IDENTITY(1,1),
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE
);
GO

-- Tabla para estados
CREATE TABLE Estados (
    estado_id INT PRIMARY KEY IDENTITY(1,1),
    nombre_estado VARCHAR(50) NOT NULL UNIQUE
);
GO

-- Tabla intermedia para los estados con sus respectivas categorías
CREATE TABLE EstadoCategoria (
    estado_categoria_id INT PRIMARY KEY IDENTITY(1,1),
    estado_id INT,
    categoria_id INT,
    FOREIGN KEY (estado_id) REFERENCES Estados(estado_id),
    FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id)
);
GO

-- Tabla para las especies de mascotas
CREATE TABLE Especies (
    especie_id INT PRIMARY KEY IDENTITY(1,1),
    nombre_especie VARCHAR(50) NOT NULL UNIQUE,
	estado_id INT DEFAULT 1, -- Por defecto, estado "Habilitado"
    FOREIGN KEY (estado_id) REFERENCES Estados(estado_id)
);
GO

-- Tabla para las razas de mascotas, relacionadas con las especies
CREATE TABLE Razas (
    raza_id INT PRIMARY KEY IDENTITY(1,1),
    nombre_raza VARCHAR(50) NOT NULL UNIQUE,
    especie_id INT,
	estado_id INT DEFAULT 1, -- Por defecto, estado "Habilitado"
    FOREIGN KEY (especie_id) REFERENCES Especies(especie_id),
	FOREIGN KEY (estado_id) REFERENCES Estados(estado_id)
);
GO

-- Tabla para los clientes de la veterinaria
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL,
    direccion VARCHAR(255),
    fecha_registro DATE DEFAULT GETDATE(),
    estado_id INT DEFAULT 1, -- Por defecto, estado "Habilitado"
    FOREIGN KEY (estado_id) REFERENCES Estados(estado_id)
);
GO

-- Tabla para las mascotas de los clientes
CREATE TABLE Mascotas (
    mascota_id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    especie_id INT, -- Referencia a la tabla Especies
    raza_id INT,    -- Referencia a la tabla Razas
    fecha_nacimiento DATE,
    cliente_id INT,
    estado_id INT DEFAULT 1, -- Por defecto, estado "Habilitado"
    FOREIGN KEY (especie_id) REFERENCES Especies(especie_id),
    FOREIGN KEY (raza_id) REFERENCES Razas(raza_id),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (estado_id) REFERENCES Estados(estado_id)
);
GO

-- Tabla para los servicios ofrecidos por la veterinaria
CREATE TABLE Servicios (
    servicio_id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    estado_id INT DEFAULT 1, -- Por defecto, estado "Habilitado"
    FOREIGN KEY (estado_id) REFERENCES Estados(estado_id)
);
GO

-- Tabla para agendar citas
CREATE TABLE Citas (
    cita_id INT PRIMARY KEY IDENTITY(1,1),
    fecha_cita DATETIME NOT NULL,
    mascota_id INT,
    servicio_id INT,
    cliente_id INT,
    estado_id INT DEFAULT 3, -- Por defecto, estado "Pendiente"
    FOREIGN KEY (mascota_id) REFERENCES Mascotas(mascota_id),
    FOREIGN KEY (servicio_id) REFERENCES Servicios(servicio_id),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (estado_id) REFERENCES Estados(estado_id)
);
GO

-- Tabla para los productos de la tienda en línea
CREATE TABLE Productos (
    producto_id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0,
    estado_id INT DEFAULT 8, -- Por defecto, estado "Disponible"
    FOREIGN KEY (estado_id) REFERENCES Estados(estado_id)
);
GO

-- Tabla para los pedidos en la tienda en línea
CREATE TABLE Pedidos (
    pedido_id INT PRIMARY KEY IDENTITY(1,1),
    cliente_id INT,
    fecha_pedido DATE DEFAULT GETDATE(),
    total DECIMAL(10, 2),
    estado_id INT DEFAULT 3, -- Por defecto, estado "Pendiente"
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (estado_id) REFERENCES Estados(estado_id)
);
GO

-- Tabla para los detalles de los pedidos
CREATE TABLE DetallesPedidos (
    detalle_id INT PRIMARY KEY IDENTITY(1,1),
    pedido_id INT,
    producto_id INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);
GO

-- Tabla para consejos de salud y cuidados generales
CREATE TABLE Consejos (
    consejo_id INT PRIMARY KEY IDENTITY(1,1),
    titulo VARCHAR(100) NOT NULL,
    contenido TEXT,
	especie_id INT, -- Puede ser NULL si no es específico por especie
    raza_id INT, -- Puede ser NULL si no es específico por raza
    fecha_publicacion DATE DEFAULT GETDATE(),
	estado_id INT DEFAULT 1, -- Por defecto, estado "Habilitado"
	FOREIGN KEY (especie_id) REFERENCES Especies(especie_id),
	FOREIGN KEY (raza_id) REFERENCES Razas(raza_id),
    FOREIGN KEY (estado_id) REFERENCES Estados(estado_id)
);
GO

-- Tabla para adopciones de mascotas
CREATE TABLE Adopciones (
    adopcion_id INT PRIMARY KEY IDENTITY(1,1),
    cliente_id INT,
	mascota_id INT,
    estado_id INT DEFAULT 11, -- Por defecto, estado "En Adopción"
    fecha_publicacion DATE DEFAULT GETDATE(),
	fecha_adopcion DATE,
	FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (mascota_id) REFERENCES Mascotas(mascota_id),
    FOREIGN KEY (estado_id) REFERENCES Estados(estado_id)
);
GO

-- Tabla para cuidados específicos por especie y raza
CREATE TABLE Cuidados (
    cuidado_id INT PRIMARY KEY IDENTITY(1,1),
    especie_id INT NOT NULL,
    raza_id INT, -- Puede ser NULL si no es específico por raza
    consejos TEXT, -- Detalles de los cuidados
    recomendaciones_especificas TEXT, -- Recomendaciones adicionales para la especie/raza
	estado_id INT DEFAULT 1, -- Por defecto, estado "Habilitado"
    FOREIGN KEY (especie_id) REFERENCES Especies(especie_id),
    FOREIGN KEY (raza_id) REFERENCES Razas(raza_id),
    FOREIGN KEY (estado_id) REFERENCES Estados(estado_id)
);
GO

-- Insertar categorías de estado
INSERT INTO Categorias (nombre_categoria) VALUES 
('Cliente'),
('Mascota'),
('Servicio'),
('Cita'),
('Producto'),
('Pedido'),
('Consejo'),
('Adopciones');
GO

-- Insertar nuevos estados
INSERT INTO Estados (nombre_estado) VALUES 
('Habilitado'),      -- Para Clientes, Mascotas, Servicios, etc.
('Deshabilitado'),   -- Para Clientes, Mascotas, Servicios, etc.
('Pendiente'),       -- Para Citas y Pedidos
('Confirmada'),      -- Para Citas y Pedidos
('Cancelada'),       -- Para Citas y Pedidos
('Realizada'),       -- Para Citas
('Entregado'),		 -- Para Pedidos
('Disponible'),      -- Para Productos
('No disponible'),   -- Para Productos
('Descontinuado'),   -- Para Productos
('En Adopción'),     -- Para Adopciones
('Adoptado');        -- Para Adopciones
GO

-- Insertar relaciones entre estados y categorías
INSERT INTO EstadoCategoria (estado_id, categoria_id) VALUES 
(1, 1),  -- Habilitado (Cliente)
(2, 1),  -- Deshabilitado (Cliente)
(1, 2),  -- Habilitado (Mascota)
(2, 2),  -- Deshabilitado (Mascota)
(11, 8),  -- En Adopción (Adopciones)
(12, 8), -- Adoptado (Adopciones)
(1, 3),  -- Habilitado (Servicio)
(2, 3),  -- Deshabilitado (Servicio)
(3, 4),  -- Pendiente (Cita)
(4, 4),  -- Confirmada (Cita)
(5, 4),  -- Cancelada (Cita)
(6, 4),  -- Realizada (Cita)
(8, 5),  -- Disponible (Producto)
(9, 5),  -- No disponible (Producto)
(10, 5),  -- Descontinuado (Producto)
(3, 6),  -- Pendiente (Pedido)
(4, 6),  -- Confirmado (Pedido)
(7, 6),  -- Entregado (Pedido)
(5, 6),  -- Cancelado (Pedido)
(1, 7),  -- Activo (Consejo)
(2, 7);  -- Inactivo (Consejo)
GO

-- Stored Procedure de Especies
CREATE OR ALTER PROCEDURE usp_Especies(
    @Accion VARCHAR(10),
    @especie_id INT = NULL,
    @nombre_especie VARCHAR(50) = NULL,
    @estado_id INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON;

    IF @Accion = 'Insert'
		BEGIN
			INSERT INTO Especies (nombre_especie, estado_id)
			VALUES (@nombre_especie, COALESCE(@estado_id, 1)); -- Por defecto, estado "Habilitado"
		END
	ELSE IF @Accion = 'Select'
		BEGIN
			SELECT * FROM Especies;
		END
    ELSE IF @Accion = 'Update'
		BEGIN
			UPDATE Especies
			SET nombre_especie = @nombre_especie,
				estado_id = COALESCE(@estado_id, estado_id)
			WHERE especie_id = @especie_id;
		END
    ELSE IF @Accion = 'Status'
		BEGIN
			UPDATE Especies
			SET estado_id = @estado_id
			WHERE especie_id = @especie_id;
		END
END
GO

-- Stored Procedure de Razas
CREATE PROCEDURE usp_Razas(
    @Accion VARCHAR(10),
    @raza_id INT = NULL,
    @nombre_raza VARCHAR(50) = NULL,
    @especie_id INT = NULL,
    @estado_id INT = NULL
)
AS
BEGIN
    IF @Accion = 'Insert'
    BEGIN
        INSERT INTO Razas (nombre_raza, especie_id, estado_id)
        VALUES (@nombre_raza, @especie_id, COALESCE(@estado_id, 1)); -- Por defecto, estado "Habilitado"
    END
    ELSE IF @Accion = 'Update'
    BEGIN
        UPDATE Razas
        SET nombre_raza = @nombre_raza,
            especie_id = @especie_id,
            estado_id = COALESCE(@estado_id, estado_id)
        WHERE raza_id = @raza_id;
    END
    ELSE IF @Accion = 'Select'
    BEGIN
        SELECT * FROM Razas;
    END
    ELSE IF @Accion = 'Status'
    BEGIN
        UPDATE Razas
        SET estado_id = @estado_id
        WHERE raza_id = @raza_id;
    END
END;
GO

-- Stored Procedure de Clientes
CREATE PROCEDURE usp_Clientes(
    @Accion VARCHAR(10),
    @cliente_id INT = NULL,
    @nombre VARCHAR(100) = NULL,
    @email VARCHAR(100) = NULL,
    @telefono VARCHAR(20) = NULL,
    @direccion VARCHAR(255) = NULL,
    @estado_id INT = NULL
)
AS
BEGIN

    IF @Accion = 'Insert'
    BEGIN
        INSERT INTO Clientes (nombre, email, telefono, direccion, estado_id)
        VALUES (@nombre, @email, @telefono, @direccion, COALESCE(@estado_id, 1)); -- Por defecto, estado "Habilitado"
    END
    ELSE IF @Accion = 'Update'
    BEGIN
        UPDATE Clientes
        SET nombre = @nombre,
            email = @email,
            telefono = @telefono,
            direccion = @direccion,
            estado_id = COALESCE(@estado_id, estado_id)
        WHERE cliente_id = @cliente_id;
    END
    ELSE IF @Accion = 'Select'
    BEGIN
        SELECT * FROM Clientes;
    END
    ELSE IF @Accion = 'Status'
    BEGIN
        UPDATE Clientes
        SET estado_id = @estado_id
        WHERE cliente_id = @cliente_id;
    END
END;
GO

-- Stored Procedure de Mascotas
CREATE PROCEDURE usp_Mascotas(
    @Accion VARCHAR(10),
    @mascota_id INT = NULL,
    @nombre VARCHAR(100) = NULL,
    @especie_id INT = NULL,
    @raza_id INT = NULL,
    @fecha_nacimiento DATE = NULL,
    @cliente_id INT = NULL,
    @estado_id INT = NULL
)
AS
BEGIN
    IF @Accion = 'Insert'
    BEGIN
        INSERT INTO Mascotas (nombre, especie_id, raza_id, fecha_nacimiento, cliente_id, estado_id)
        VALUES (@nombre, @especie_id, @raza_id, @fecha_nacimiento, @cliente_id, COALESCE(@estado_id, 1)); -- Por defecto, estado "Habilitado"
    END
    ELSE IF @Accion = 'Update'
    BEGIN
        UPDATE Mascotas
        SET nombre = @nombre,
            especie_id = @especie_id,
            raza_id = @raza_id,
            fecha_nacimiento = @fecha_nacimiento,
            cliente_id = @cliente_id,
            estado_id = COALESCE(@estado_id, estado_id)
        WHERE mascota_id = @mascota_id;
    END
    ELSE IF @Accion = 'Select'
    BEGIN
        SELECT * FROM Mascotas;
    END
    ELSE IF @Accion = 'Status'
    BEGIN
        UPDATE Mascotas
        SET estado_id = @estado_id
        WHERE mascota_id = @mascota_id;
    END
END;
GO

-- Stored Procedure de Servicios
CREATE PROCEDURE usp_Servicios(
    @Accion VARCHAR(10),
    @servicio_id INT = NULL,
    @nombre VARCHAR(100) = NULL,
    @descripcion TEXT = NULL,
    @precio DECIMAL(10, 2) = NULL,
    @estado_id INT = NULL
)
AS
BEGIN
    IF @Accion = 'Insert'
    BEGIN
        INSERT INTO Servicios (nombre, descripcion, precio, estado_id)
        VALUES (@nombre, @descripcion, @precio, COALESCE(@estado_id, 1)); -- Por defecto, estado "Habilitado"
    END
    ELSE IF @Accion = 'Update'
    BEGIN
        UPDATE Servicios
        SET nombre = @nombre,
            descripcion = @descripcion,
            precio = @precio,
            estado_id = COALESCE(@estado_id, estado_id)
        WHERE servicio_id = @servicio_id;
    END
    ELSE IF @Accion = 'Select'
    BEGIN
        SELECT * FROM Servicios;
    END
    ELSE IF @Accion = 'Status'
    BEGIN
        UPDATE Servicios
        SET estado_id = @estado_id
        WHERE servicio_id = @servicio_id;
    END
END;
GO

-- Stored Procedure de Citas
CREATE PROCEDURE usp_Citas(
    @Accion VARCHAR(10),
    @cita_id INT = NULL,
    @fecha_cita DATETIME = NULL,
    @mascota_id INT = NULL,
    @servicio_id INT = NULL,
    @cliente_id INT = NULL,
    @estado_id INT = NULL
)
AS
BEGIN
    IF @Accion = 'Insert'
    BEGIN
        INSERT INTO Citas (fecha_cita, mascota_id, servicio_id, cliente_id, estado_id)
        VALUES (@fecha_cita, @mascota_id, @servicio_id, @cliente_id, COALESCE(@estado_id, 3)); -- Por defecto, estado "Pendiente"
    END
    ELSE IF @Accion = 'Update'
    BEGIN
        UPDATE Citas
        SET fecha_cita = @fecha_cita,
            mascota_id = @mascota_id,
            servicio_id = @servicio_id,
            cliente_id = @cliente_id,
            estado_id = COALESCE(@estado_id, estado_id)
        WHERE cita_id = @cita_id;
    END
    ELSE IF @Accion = 'Select'
    BEGIN
        SELECT * FROM Citas;
    END
    ELSE IF @Accion = 'Status'
    BEGIN
        UPDATE Citas
        SET estado_id = @estado_id
        WHERE cita_id = @cita_id;
    END
END;
GO

-- Stored Procedure de Productos
CREATE PROCEDURE usp_Productos(
    @Accion VARCHAR(10),
    @producto_id INT = NULL,
    @nombre VARCHAR(100) = NULL,
    @descripcion TEXT = NULL,
    @precio DECIMAL(10, 2) = NULL,
    @stock INT = NULL,
    @estado_id INT = NULL
)
AS
BEGIN
    IF @Accion = 'Insert'
    BEGIN
        INSERT INTO Productos (nombre, descripcion, precio, stock, estado_id)
        VALUES (@nombre, @descripcion, @precio, COALESCE(@stock, 0), COALESCE(@estado_id, 1)); -- Por defecto, estado "Habilitado"
    END
    ELSE IF @Accion = 'Update'
    BEGIN
        UPDATE Productos
        SET nombre = @nombre,
            descripcion = @descripcion,
            precio = @precio,
            stock = @stock,
            estado_id = COALESCE(@estado_id, estado_id)
        WHERE producto_id = @producto_id;
    END
    ELSE IF @Accion = 'Select'
    BEGIN
        SELECT * FROM Productos;
    END
    ELSE IF @Accion = 'Status'
    BEGIN
        UPDATE Productos
        SET estado_id = @estado_id
        WHERE producto_id = @producto_id;
    END
END;
GO

-- Stored Procedure de Pedidos
CREATE PROCEDURE usp_Pedidos(
    @Accion VARCHAR(10),
    @pedido_id INT = NULL,
    @cliente_id INT = NULL,
    @fecha_pedido DATETIME = NULL,
    @total DECIMAL(10, 2) = NULL,
    @estado_id INT = NULL
)
AS
BEGIN
    IF @Accion = 'Insert'
    BEGIN
        INSERT INTO Pedidos (cliente_id, fecha_pedido, total, estado_id)
        VALUES (@cliente_id, @fecha_pedido, @total, COALESCE(@estado_id, 1)); -- Estado "Habilitado" por defecto
    END
    ELSE IF @Accion = 'Update'
    BEGIN
        UPDATE Pedidos
        SET cliente_id = @cliente_id,
            fecha_pedido = @fecha_pedido,
            total = @total,
            estado_id = COALESCE(@estado_id, estado_id)
        WHERE pedido_id = @pedido_id;
    END
    ELSE IF @Accion = 'Select'
    BEGIN
        SELECT * FROM Pedidos;
    END
    ELSE IF @Accion = 'Status'
    BEGIN
        UPDATE Pedidos
        SET estado_id = @estado_id
        WHERE pedido_id = @pedido_id;
    END
END;
GO

-- Stored Procedure de DetallesPedidos
CREATE PROCEDURE usp_DetallesPedidos(
    @Accion VARCHAR(10),
    @detalle_id INT = NULL,
    @pedido_id INT = NULL,
    @producto_id INT = NULL,
    @cantidad INT = NULL,
    @precio DECIMAL(10, 2) = NULL
)
AS
BEGIN
    IF @Accion = 'Insert'
    BEGIN
        INSERT INTO DetallesPedidos (pedido_id, producto_id, cantidad, precio_unitario)
        VALUES (@pedido_id, @producto_id, @cantidad, @precio);
    END
    ELSE IF @Accion = 'Update'
    BEGIN
        UPDATE DetallesPedidos
        SET pedido_id = @pedido_id,
            producto_id = @producto_id,
            cantidad = @cantidad,
            precio_unitario = @precio
        WHERE detalle_id = @detalle_id;
    END
    ELSE IF @Accion = 'Select'
    BEGIN
        SELECT * FROM DetallesPedidos;
    END
END;
GO

-- Stored Procedure de Consejos
CREATE PROCEDURE usp_Consejos(
    @Accion VARCHAR(10),
    @consejo_id INT = NULL,
    @titulo VARCHAR(100) = NULL,
    @contenido TEXT = NULL,
    @estado_id INT = NULL
)
AS
BEGIN
    IF @Accion = 'Insert'
    BEGIN
        INSERT INTO Consejos (titulo, contenido, estado_id)
        VALUES (@titulo, @contenido, COALESCE(@estado_id, 1)); -- Estado "Habilitado" por defecto
    END
    ELSE IF @Accion = 'Update'
    BEGIN
        UPDATE Consejos
        SET titulo = @titulo,
            contenido = @contenido,
            estado_id = COALESCE(@estado_id, estado_id)
        WHERE consejo_id = @consejo_id;
    END
    ELSE IF @Accion = 'Select'
    BEGIN
        SELECT * FROM Consejos;
    END
    ELSE IF @Accion = 'Status'
    BEGIN
        UPDATE Consejos
        SET estado_id = @estado_id
        WHERE consejo_id = @consejo_id;
    END
END;
GO

-- Stored Procedure de Adopciones
CREATE PROCEDURE usp_Adopciones(
    @Accion VARCHAR(10),
    @adopcion_id INT = NULL,
    @mascota_id INT = NULL,
    @fecha_adopcion DATE = NULL,
    @cliente_id INT = NULL,
    @estado_id INT = NULL
)
AS
BEGIN
    IF @Accion = 'Insert'
    BEGIN
        INSERT INTO Adopciones (mascota_id, estado_id)
        VALUES (@mascota_id, COALESCE(@estado_id, 11)); -- Estado "En Adopción" por defecto
    END
    ELSE IF @Accion = 'Update'
    BEGIN
        UPDATE Adopciones
        SET mascota_id = @mascota_id,
            fecha_adopcion = @fecha_adopcion,
            cliente_id = @cliente_id,
            estado_id = COALESCE(@estado_id, estado_id)
        WHERE adopcion_id = @adopcion_id;
    END
    ELSE IF @Accion = 'Select'
    BEGIN
        SELECT * FROM Adopciones;
    END
    ELSE IF @Accion = 'Status'
    BEGIN
        UPDATE Adopciones
        SET estado_id = @estado_id
        WHERE adopcion_id = @adopcion_id;
    END
END;
GO

-- Stored Procedure de Cuidados
CREATE PROCEDURE usp_Cuidados(
    @accion NVARCHAR(10),						-- 'INSERT', 'UPDATE', 'SELECT', 'DISABLE'
    @cuidado_id INT = NULL,						-- Para operaciones UPDATE, SELECT, DISABLE
    @especie_id INT = NULL,						-- Para INSERT y UPDATE
    @raza_id INT = NULL,						-- Para INSERT y UPDATE (puede ser NULL)
    @consejos TEXT = NULL,						-- Para INSERT y UPDATE
    @recomendaciones_especificas TEXT = NULL,	-- Para INSERT y UPDATE
    @estado_id INT = NULL						-- Para UPDATE o DISABLE (cambiar estado)
)
AS
BEGIN
	SET NOCOUNT ON;
    IF @accion = 'INSERT'
		BEGIN
			INSERT INTO Cuidados (especie_id, raza_id, consejos, recomendaciones_especificas, estado_id)
			VALUES (@especie_id, @raza_id, @consejos, @recomendaciones_especificas, 1); -- Estado habilitado por defecto
		END
    ELSE IF @accion = 'UPDATE'
		BEGIN
			UPDATE Cuidados
			SET especie_id = @especie_id,
				raza_id = @raza_id,
				consejos = @consejos,
				recomendaciones_especificas = @recomendaciones_especificas,
				estado_id = COALESCE(@estado_id, estado_id) -- Si no se pasa, mantiene el estado actual
			WHERE cuidado_id = @cuidado_id;
		END
    ELSE IF @accion = 'SELECT'
		BEGIN
			SELECT * FROM Cuidados;
		END
    ELSE IF @accion = 'STATUS'
		BEGIN
			UPDATE Cuidados
			SET estado_id = 2 -- Estado "Deshabilitado"
			WHERE cuidado_id = @cuidado_id;
		END
END;
GO