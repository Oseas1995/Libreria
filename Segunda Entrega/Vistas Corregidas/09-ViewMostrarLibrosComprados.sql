--9 Mostrar los libros que han sido comprados

CREATE VIEW vw_LibrosComprados AS
SELECT lib.idLibro, lib.nombre FROM Libro lib
INNER JOIN DetalleFactura df on df.Libro_idLibro=lib.idLibro
INNER JOIN Factura fac on fac.idFactura=df.Factura_idFactura
INNER JOIN TipoObtencion ob on ob.idTipoObtencion=fac.TipoObtencion_idTipoObtencion
WHERE ob.idTipoObtencion=1;