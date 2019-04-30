
--5 Mostrar sucursal y cantidad de libros por sucursal.

Create view vw_SucLibros AS
SELECT su.nombre AS nombreSucursal, COUNT(li.idLibro) AS LibroTotales FROM Sucursal su
INNER JOIN Bodega bo ON bo.idBodega=su.Bodega_idBodega
INNER JOIN Pasillo pa ON bo.idBodega=pa.Bodega_idBodega
INNER JOIN Estante es ON es.Pasillo_idPasillo=pa.idPasillo
INNER JOIN Cubiculo cu ON cu.Estante_idEstante=es.idEstante
INNER JOIN posicionLibro pl ON pl.Cubiculo_idCubiculo=cu.idCubiculo
INNER JOIN Libro li ON li.idLibro=pl.Libro_idLibro
GROUP BY su.nombre;
