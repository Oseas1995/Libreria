--4 Mostrar proveedores, productos que proveen y cantidad.

Create view vw_Proveedores as
select prov.Nombre, prov.Telefono, tp.descripcion as tipoProveedor, pv.descripcion, ppv.cantidad from Proveedor prov
inner join TipoProveedor tp on tp.idTipoProveedor=prov.TipoProveedor_idTipoProveedor
inner join Provpv ppv on ppv.Proveedor_idProveedor=prov.idProveedor
inner join PVarios pv on pv.idPVarios=ppv.PVarios_idPVarios;