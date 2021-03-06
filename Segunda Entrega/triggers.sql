
------------------- TRIGGER -------------------
--01. PERSONA
CREATE SEQUENCE S_ID_PERSONA
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_PERSONA
BEFORE INSERT ON PERSONA
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idPersona:=S_ID_PERSONA.NEXTVAL;
END;

--02. TELEFONO
CREATE SEQUENCE S_ID_TELEFONO
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_TELEFONO
BEFORE INSERT ON TELEFONO
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idTelefono:=S_ID_TELEFONO.NEXTVAL;
END;

--03. CLIENTE
CREATE SEQUENCE S_ID_CLIENTE
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_CLIENTE
BEFORE INSERT ON CLIENTE
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idCliente:=S_ID_CLIENTE.NEXTVAL;
END;

--04. AUTOR
CREATE SEQUENCE S_ID_AUTOR
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_AUTOR
BEFORE INSERT ON AUTOR
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idAutor:=S_ID_AUTOR.NEXTVAL;
END;

--05. CARGO
CREATE SEQUENCE S_ID_CARGO
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_CARGO
BEFORE INSERT ON CARGO
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idCargo:=S_ID_CARGO.NEXTVAL;
END;

--06. EMPLEADO
CREATE SEQUENCE S_ID_EMPLEADO
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_EMPLEADO
BEFORE INSERT ON EMPLEADO
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idEmpleado:=S_ID_EMPLEADO.NEXTVAL;
END;

--07. EMPLEADO CARGO
CREATE SEQUENCE S_ID_EMPLEADOCARGO
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_EMPLEADOCARGO
BEFORE INSERT ON EMPLEADOCARGO
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idEmpleadoCargo:=S_ID_EMPLEADOCARGO.NEXTVAL;
END;

--08. LIBRERIA
CREATE SEQUENCE S_ID_LIBRERIA
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_LIBRERIA
BEFORE INSERT ON LIBRERIA
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idLibreria:=S_ID_LIBRERIA.NEXTVAL;
END;

--09. BODEGA
CREATE SEQUENCE S_ID_BODEGA
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_BODEGA
BEFORE INSERT ON BODEGA
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idBodega:=S_ID_BODEGA.NEXTVAL;
END;

--10. SUCURSAL
CREATE SEQUENCE S_ID_SUCURSAL
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_SUCURSAL
BEFORE INSERT ON SUCURSAL
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idSucursal:=S_ID_SUCURSAL.NEXTVAL;
END;

--11. SUCURSAL EMPLEADO
CREATE SEQUENCE S_ID_SUCURSALEMPLEADO
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_SUCURSALEMPLEADO
BEFORE INSERT ON SUCURSALEMPLEADO
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idSucursalEmpleado:=S_ID_SUCURSALEMPLEADO.NEXTVAL;
END;

--12. PASILLO
CREATE SEQUENCE S_ID_PASILLO
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_PASILLO
BEFORE INSERT ON PASILLO
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idPasillo:=S_ID_PASILLO.NEXTVAL;
END;

--13. ESTANTE
CREATE SEQUENCE S_ID_ESTANTE
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_ESTANTE
BEFORE INSERT ON ESTANTE
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idEstante:=S_ID_ESTANTE.NEXTVAL;
END;

--14. CUBICULO
CREATE SEQUENCE S_ID_CUBICULO
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_CUBICULO
BEFORE INSERT ON CUBICULO
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idCubiculo:=S_ID_CUBICULO.NEXTVAL;
END;

--15. EDITORIAL
CREATE SEQUENCE S_ID_EDITORIAL
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_EDITORIAL
BEFORE INSERT ON EDITORIAL
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idEditorial:=S_ID_EDITORIAL.NEXTVAL;
END;

--16. IDIOMA
CREATE SEQUENCE S_ID_IDIOMA
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_IDIOMA
BEFORE INSERT ON IDIOMA
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idIdioma:=S_ID_IDIOMA.NEXTVAL;
END;

--17. GENERO
CREATE SEQUENCE S_ID_GENERO
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_GENERO
BEFORE INSERT ON GENERO
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idGenero:=S_ID_GENERO.NEXTVAL;
END;

--18. CATEGORIA
CREATE SEQUENCE S_ID_CATEGORIA
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_CATEGORIA
BEFORE INSERT ON CATEGORIA
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idCategoria:=S_ID_CATEGORIA.NEXTVAL;
END;

--19. TIPO PROVEEDOR
CREATE SEQUENCE S_ID_TIPOPROVEEDOR
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_TIPOPROVEEDOR
BEFORE INSERT ON TIPOPROVEEDOR
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idTipoProveedor:=S_ID_TIPOPROVEEDOR.NEXTVAL;
END;

--20. PVARIOS
CREATE SEQUENCE S_ID_PVARIOS
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_PVARIOS
BEFORE INSERT ON PVARIOS
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idPVarios:=S_ID_PVARIOS.NEXTVAL;
END;

--21. PROVEEDOR
CREATE SEQUENCE S_ID_PROVEEDOR
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_PROVEEDOR
BEFORE INSERT ON PROVEEDOR
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idProveedor:=S_ID_PROVEEDOR.NEXTVAL;
END;

--22. PROV PV
CREATE SEQUENCE S_ID_PROVPV
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_PROVPV
BEFORE INSERT ON PROVPV
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idProvpv:=S_ID_PROVPV.NEXTVAL;
END;

--23. LIBRO
CREATE SEQUENCE S_ID_LIBRO
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_LIBRO
BEFORE INSERT ON LIBRO
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idLibro:=S_ID_LIBRO.NEXTVAL;
END;

--24. PROV LIB
CREATE SEQUENCE S_ID_PROVLIB
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_PROVLIB
BEFORE INSERT ON PROVLIB
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idProvLib:=S_ID_PROVLIB.NEXTVAL;
END;

--25. AUTORES LIBROS
CREATE SEQUENCE S_ID_AUTORESLIBROS
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_AUTORESLIBROS
BEFORE INSERT ON AUTORESLIBROS
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idAutoresLibros:=S_ID_AUTORESLIBROS.NEXTVAL;
END;

--26. GENEROS LIBROS
CREATE SEQUENCE S_ID_GENEROSLIBROS
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_GENEROSLIBROS
BEFORE INSERT ON GENEROSLIBROS
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idGenerosLibros:=S_ID_GENEROSLIBROS.NEXTVAL;
END;

--27. EDICION
CREATE SEQUENCE S_ID_EDICION
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_EDICION
BEFORE INSERT ON EDICION
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idEdicion:=S_ID_EDICION.NEXTVAL;
END;

--28. LIB EDIT
CREATE SEQUENCE S_ID_LIBEDIT
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_LIBEDIT
BEFORE INSERT ON LIBEDIT
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idLibEdit:=S_ID_LIBEDIT.NEXTVAL;
END;


--29. POSICION LIBRO
CREATE SEQUENCE S_ID_POSICIONLIBRO
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_POSICIONLIBRO
BEFORE INSERT ON POSICIONLIBRO
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idPosicionLibro:=S_ID_POSICIONLIBRO.NEXTVAL;
END;

--30. TIPO OBTENCION
CREATE SEQUENCE S_ID_TIPOOBTENCION
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_TIPOOBTENCION
BEFORE INSERT ON TIPOOBTENCION
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idTipoObtencion:=S_ID_TIPOOBTENCION.NEXTVAL;
END;

--31. PRESTAMO
CREATE SEQUENCE S_ID_PRESTAMO
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_PRESTAMO
BEFORE INSERT ON PRESTAMO
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idPrestamo:=S_ID_PRESTAMO.NEXTVAL;
END;

--32. DESCUENTO
CREATE SEQUENCE S_ID_DESCUENTO
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_DESCUENTO
BEFORE INSERT ON DESCUENTO
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idDescuento:=S_ID_DESCUENTO.NEXTVAL;
END;

--33. TIPO PAGO
CREATE SEQUENCE S_ID_TIPOPAGO
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_TIPOPAGO
BEFORE INSERT ON TIPOPAGO
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idTipoPago:=S_ID_TIPOPAGO.NEXTVAL;
END;

--34. PAGO
CREATE SEQUENCE S_ID_PAGO
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_PAGO
BEFORE INSERT ON PAGO
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idPago:=S_ID_PAGO.NEXTVAL;
END;

--35. MORA
CREATE SEQUENCE S_ID_MORA
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_MORA
BEFORE INSERT ON MORA
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idMora:=S_ID_MORA.NEXTVAL;
END;

--36. FACTURA
CREATE SEQUENCE S_ID_FACTURA
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_FACTURA
BEFORE INSERT ON FACTURA
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idFactura:=S_ID_FACTURA.NEXTVAL;
END;

--37. DETALLE FACTURA
CREATE SEQUENCE S_ID_DETALLEFACTURA
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TR_DETALLEFACTURA
BEFORE INSERT ON DETALLEFACTURA
FOR EACH ROW
DECLARE
BEGIN
	:NEW.idDetalleFactura:=S_ID_DETALLEFACTURA.NEXTVAL;
END;
