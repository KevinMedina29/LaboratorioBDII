use Ferreteria;

insert into Cargo values
	('Ordenanza'),
	('Cajero'),
	('Atencion al Cliente'),
	('Jefe'),
	('Despachador');

select*from Cargo;

insert into Departamento values
	('Sonsonate'),
	('San Salvador'),
	('Santa Ana'),
	('La Libertad'),
	('San Miguel');

select*from Departamento;

insert into Municipio values
	('Sonsonate Centro', '1'),
	('San Salvador Sur', '2'),
	('Santa Ana Norte', '3'),
	('La Libertad Centro', '4'),
	('San Miguel Oeste', '5');

select*from Municipio;
	
insert into Distrito values
	('San Antonio del Monte', '1'),
	('San Marcos', '2'),
	('Metapan', '3'),
	('San Juan Opico', '4'),
	('Chinameca', '5');

select*from Distrito;
	
insert into Direcciones values
	('Principal', 'Ida', 'A', '2', '1', '321'),
	('2da', 'Juan Perez', 'C', '43', '2', '123'),
	('1ra', 'Campestre', 'A', '13', '3', '231'),
	('6ta Avenida', 'Maria', 'A', '30', '4', '132'),
	('2da', 'Santacruz', 'B', '41', '5', '312');

select*from Direcciones;
	
insert into Proveedor values
	('Manuel Martinez', '2', '1111-1111'),
	('Juana Cruz', '3', '2222-2222'),
	('Celeste Medina', '4', '3333-3333'),
	('Jesus Rivas', '5', '4444-4444'),
	('Angie Garcia', '1', '5555-5555');
	
select*from Proveedor;

insert into Productos values
	('Clavos', 'regvwev', '5'),
	('Pernos', 'h5hwr6wywr', '4'),
	('Cinta Metrica', 'wryjtwynr', '3'),
	('LLave inglesa', 'wnywruj', '2'),
	('Destornillador', 'wmwt6k', '1');

select*from Productos;

insert into Empleados values
	('Martin', 'Palermo', '11111111-1','505050505', '1212-1212', 'martinpalermo@gmail.com','3', '2'),
	('Josue', 'Perez', '22222222-2','515151515', '1313-1313', 'josueperez@gmail.com','2', '4'),
	('Alejandro', 'Magno', '33333333-3','242424242', '1414-1414', 'alejandromagno@gmail.com','5', '1'),
	('Marco', 'Polo', '44444444-4','161616161', '1515-1551', 'marcopolo@gmail.com','1', '3'),
	('Luis', 'Cortez', '55555555-5','988989899', '1343-3211', 'luiscortez@gmail.com','4', '5');

select*from Empleados;
	
insert into Clientes values
	('Angie', 'Garcia', '14141414-4','545454545', '2020-2020', '@gmail.com','2'),
	('Miguel', 'Leiva', '66666666-6','5353535353', '2222-2222', '@gmail.com','5'),
	('Douglas', 'Escobar', '77777777-7','272727277', '2211-2233', '@gmail.com','3'),
	('Beto', 'Moran', '88888888-8','244788621', '3322-3344', '@gmail.com','4'),
	('Steven', 'Coreas', '99999999-9','463738428', '1122-3344', '@gmail.com','1');

select*from Clientes;
	
insert into Ventas values
	('1', '2', '2023-09-10'),
	('5', '2', '2023-07-31'),
	('2', '1', '2023-02-22'),
	('4', '4', '2023-05-25'),
	('3', '3', '2023-06-12');

select*from Ventas;
	
insert into DetallesVentas values
	('1', '5', '3', '3.00'),
	('2', '3', '1', '2.00'),
	('3', '3', '1', '2.00'),
	('4', '2', '12', '0.15'),
	('5', '1', '10', '0.10');

select*from DetallesVentas;
	
insert into Compras values
	('3', '2023-01-14'),
	('2', '2023-01-14'),
	('5', '2022-12-12'),
	('1', '2022-12-12'),
	('4', '2023-01-14');

select*from Compras;
	
insert into Suministro values
	('1', '4', '50', '1.00'),
	('2', '3', '50', '1.50'),
	('3', '2', '200', '0.10'),
	('4', '1', '200', '0.08'),
	('5', '5', '50', '2.00');

select*from Suministro;
	
insert into Factura values
	('1', '2023-09-10', '9.00', 'nuevo', 'efectivo'),
	('2', '2023-07-31', '2.00', 'nuevo', 'efectivo'),
	('3', '2023-02-22', '2.00', 'nuevo', 'tarjeta'),
	('4', '2023-05-25', '1.80', 'nuevo', 'tarjeta'),
	('5', '2023-06-12', '10.00', 'nuevo', 'bitcoin');
	
select*from Factura;

-- Consultas
-- buscar empleados
select nombre_empleado
from Empleados
where nombre_empleado= 'Martin' 
or nombre_empleado= 'Alejandro';

--contar clientes
select COUNT(id_cliente) Cantidad_clientes
from Clientes;

-- buscar los cargos
select id_empleado, nombre_empleado, id_cargo
from Empleados
where id_cargo=4 or id_cargo=3;

-- factura que se pago mas de $5
select id_venta, total
from Factura
where total>5;

-- ventas en el segundo semestre del año
select id_venta, fecha_venta
from Ventas
where fecha_venta between '2023-06-02' and '2023-12-31';

-- empleado con nombre de cargo y venta
select e.id_empleado, e.nombre_empleado, c.nombre_cargo, v.id_venta
from Empleados e, Cargo c, Ventas v
where e.id_cargo=c.id_cargo
and e.id_empleado=v.id_empleado;

-- direccion completa clientes
select (c.nombre_cliente+' '+c.apellido_cliente) Nombre, di.id_direccion, d.nombre_distrito, m.nombre_municipio, de.nombre_departamento
from Clientes c, Distrito d, Municipio m, Departamento de, Direcciones di 
where c.id_direccion=di.id_direccion and di.id_distrito=d.id_distrito
and d.id_municipio=m.id_municipio and m.id_departamento=de.id_departamento;

-- producto y su proveedor
select pd.id_producto, pd.nombre_producto, pv.nombre_proveedor
from Productos pd
inner join Proveedor pv on pv.id_proveedor=pd.id_proveedor;

select p.nombre_producto, s.cantidad, s.precio_unitario, c.fecha_compra
from Compras c
inner join Suministro s on c.id_compra=s.id_compra
inner join Productos p on s.id_producto=p.id_producto
where cantidad=200;

select*from Factura 
where id_factura in
(select id_factura from Factura where id_factura=2);



