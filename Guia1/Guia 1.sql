create database Ferreteria;
use Ferreteria;

create table Departamento (
    id_departamento int identity(1,1) primary key,
    nombre_departamento varchar(100) not null
);

create table Municipio (
    id_municipio int identity(1,1) primary key,
    nombre_municipio varchar(100) not null,
    id_departamento int not null,
    foreign key (id_departamento) references Departamento(id_departamento)
);

create table Distrito (
    id_distrito int identity(1,1) primary key,
    nombre_distrito varchar(100) not null,
    id_municipio int not null,
    foreign key (id_municipio) references Municipio(id_municipio)
);

create table Direcciones (
    id_direccion int identity(1,1) primary key,
    calle varchar(50) not null,
	colonia varchar(50) not null,
	pasaje varchar(10) not null,
	num_casa int not null,
    id_distrito int not null,
	codigo_postal char(5) not null,
    foreign key (id_distrito) references Distrito(id_distrito)
);

create table Proveedor (
    id_proveedor int identity(1,1) primary key,
    nombre_proveedor varchar(100) not null,
    id_direccion int not null,
    telefono varchar(15) not null,
    foreign key (id_direccion) references Direcciones(id_direccion)
);

create table Productos (
    id_producto int identity(1,1) primary key,
    nombre_producto varchar(100) not null,
    descripcion varchar(200),
    id_proveedor int not null,
    foreign key (id_proveedor) references Proveedor(id_proveedor)
);

create table Cargo (
	id_cargo int identity(1,1) primary key,
	nombre_cargo varchar(100) not null
);

create table Empleados (
    id_empleado int identity(1,1) primary key,
    nombre_empleado varchar(100) not null,
	apellido_empleado varchar(100) not null,
	DUI varchar(10) not null,
	ISSS varchar(15) not null,
	telefono varchar(15) not null,
	email varchar(100) not null,
    id_cargo int not null,
    id_direccion int not null,
	foreign key (id_cargo) references Cargo(id_cargo),
    foreign key (id_direccion) references Direcciones(id_direccion)
);

create table Clientes (
    id_cliente int identity(1,1) primary key,
    nombre_cliente varchar(100) not null,
	apellido_cliente varchar(100) not null,
	DUI varchar(10) not null,
	ISSS varchar(15) not null,
	telefono varchar(15) not null,
	email varchar(100) not null,
    id_direccion int not null,
    foreign key (id_direccion) references Direcciones(id_direccion)
);

create table Ventas (
    id_venta int identity(1,1) primary key,
    id_cliente int not null,
    id_empleado int not null,
    fecha_venta date not null,
    foreign key (id_cliente) references Clientes(id_cliente),
    foreign key (id_empleado) references Empleados(id_empleado)
);

create table DetallesVentas (
    id_detalles int identity(1,1) primary key,
    id_venta int not null,
    id_producto int not null,
    cantidad int not null,
    precio_unitario decimal(10, 2) not null,
    foreign key (id_venta) references Ventas(id_venta),
    foreign key (id_producto) references Productos(id_producto)
);

create table Compras (
    id_compra int identity(1,1) primary key,
    id_proveedor int not null,
    fecha_compra date not null,
    foreign key (id_proveedor) references Proveedor(id_proveedor)
);

create table Suministro (
    id_suministro int identity(1,1) primary key,
    id_compra int not null,
    id_producto int not null,
    cantidad int not null,
    precio_unitario decimal(10, 2) not null,
    foreign key (id_compra) references Compras(id_compra),
    foreign key (id_producto) references Productos(id_producto)
);

create table Factura (
    id_factura int identity(1,1) primary key,
    id_venta int not null,
    fecha_factura date not null,
	total decimal(10, 2) not null,
    estado varchar(20) not null,
    forma_pago varchar(50),
    foreign key (id_venta) references Ventas(id_venta)
);
