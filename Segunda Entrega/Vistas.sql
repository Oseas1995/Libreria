--1 Mostrar Clientes.

Create view wv_Clientes as
select (per.pnombre||' '||per.snombre||' '||per.papellido||' '||per.sapellido) nombreCompleto, tel.numero as numeroTelefono, per.direccion, per.correo from Cliente Cli
inner join Persona per ON per.idPersona=Cli.Persona_idPersona
inner join Telefono tel ON tel.Persona_idPersona=per.idPersona;


--2 Mostrar informacion de libros.

Create view wv_libros as
select li.nombre, li.anioPublicacion, (per.pnombre||' '||per.papellido) as autor, idi.descripcion as idioma, gen.descripcion as genero, cat.descripcion as categoria, edi.nombre as editorial from Libro li
inner join Idioma idi on idi.idIdioma=li.Idioma_idIdioma
inner join Generos/Libros gl ON gl.Libro_idLibro=li.idLibro
inner join Genero gen on gen.idGenero=gl.Genero_idGenero
inner join Categoria cat on cat.Categoria_ID=li.Categoria_Categoria_ID
inner join Autores/Libros al on al.Libro_idLibro=li.idLibro
inner join Autor au on au.idAutor=al.Autor_idAutor
inner join Persona per on per.idPersona=au.Persona_idPersona
inner join Libros/Editoriales le on le.Libro_idLibro=li.idLibro
inner join Editorial edi on edi.idEditorial=le.Editorial_idEditorial;

--3 Mostrar Empleados.

Create view wv_Empleados as
select (per.pnombre||' '||per.snombre||' '||per.papellido||' '||per.sapellido) nombreCompleto, tel.numero as numeroTelefono, per.direccion, per.correo from Empleado em
inner join Persona per ON per.idPersona=em.Persona_idPersona
inner join Telefono tel ON tel.Persona_idPersona=per.idPersona;


--4 Mostrar proveedores, productos que proveen y cantidad.

Create view wv_Proveedores as
select prov.Nombre, prov.Telefono, tp.descripcion as tipoProveedor, pv.descripcion, ppv.cantidad from Proveedor prov
inner join TipoProveedor tp on tp.idTipoProveedor=prov.TipoProveedor_idTipoProveedor
inner join Prov/pv ppv on ppv.Proveedor_idProveedor=prov.idProveedor
inner join ProductosVarios pv on pv.idProductosVarios=ppv.ProductosVarios_idProductosVarios;



--5 Mostrar sucursal y cantidad de libros por sucursal.

Create view wv_SucLibros AS
SELECT su.nombre AS nombreSucursal, COUNT(li.idLibro) AS LibroTotales FROM Sucursal su
INNER JOIN Bodega bo ON bo.idBodega=su.Bodega_idBodega
INNER JOIN Pasillo pa ON bo.idBodega=pa.Bodega_idBodega
INNER JOIN Estante es ON es.Pasillo_idPasillo=pa.idPasillo 
INNER JOIN Cubiculo cu ON cu.Estante_idEstante=es.idEstante
INNER JOIN posicionLibro pl ON pl.Cubiculo_idCubiculo=cu.idCubiculo 
INNER JOIN Libro li ON li.idLibro=pl.Libro_idLibro
GROUP BY su.nombre;


--6 Mostrar cargos de los empleados.

CREATE VIEW wv_CargoEmpleados AS
SELECT (p.pnombre||' '||p.snombre||' '||p.papellido||' '||p.sapellido) NombreCompleto, c.descripcion cargo  FROM Persona p 
INNER JOIN Empleado e ON p.idPersona = e.Persona_idPersona
INNER JOIN Empleado/Cargo ec ON e.idEmpleado = ec.Empleado_idEmpleado
INNER JOIN Cargo c ON ec.Cargo_idCargo = c.idCargo;


--7 Mostrar Detalle Factura.

CREATE VIEW vw_DetalleFactura AS
SELECT f.IDFACTURA, (p.PNOMBRE||' '||p.PAPELLIDO) nombre, l.NOMBRE libro, df.CANTIDAD, tiob.DESCRIPCION TipoObtencion, f.FECHAREGISTRO, tp.DESCRIPCION tipoPago  FROM Factura f 
INNER JOIN DETALLEFACTURA df ON f.IDFACTURA = df.FACTURA_IDFACTURA
INNER JOIN CLIENTE c ON f.CLIENTE_IDCLIENTE = c.IDCLIENTE
INNER JOIN Persona p ON c.PERSONA_IDPERSONA = p.IDPERSONA
INNER JOIN LIBRO l ON df.LIBRO_IDLIBRO = l.IDLIBRO
INNER JOIN TIPOOBTENCION tiob ON f.TIPOOBTENCION_IDTIPOOBTENCION = tiob.IDTIPOOBTENCION
INNER JOIN PAGO pa ON f.PAGO_IDPAGO = pa.IDPAGO
INNER JOIN TIPOPAGO tp ON pa.TIPOPAGO_IDTIPOPAGO = tp.IDTIPOPAGO;


--8 Mostrar los Empleados que tengas dos o más de dos telefonos.

SELECT (p.PNOMBRE||' '||p.PAPELLIDO) nombre, COUNT(t.IDTELEFONO) CantidadTelefonos FROM TELEFONO t
INNER JOIN PERSONA p ON t.PERSONA_IDPERSONA = p.IDPERSONA
INNER JOIN EMPLEADO e ON p.IDPERSONA = e.PERSONA_IDPERSONA
GROUP BY p.PNOMBRE||' '||p.PAPELLIDO
HAVING COUNT(t.IDTELEFONO) > 1;


--9 Mostrar los jefes y sus subordinados

