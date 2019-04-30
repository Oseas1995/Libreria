--6 Compra de libros

--entrada: id del proveedor, id del tipo de prov, cantidad, idLibro, nombre,aniPublicacion,idCategoria,idIdioma,PrecioCosto,PrecioVenta

--proceso: Sumarle cantidad a existencia

--salida: update en Libro o Insert


CREATE OR REPLACE PROCEDURE SP_GESTION_COMPRASLIBROS(
		pnidProveedor IN INTEGER,
		pnidTipoProveedor IN INTEGER,
		pnCantidad IN INTEGER,
		pnidLibro IN INTEGER,
		pcnombreLibro IN VARCHAR2,		

		pbocurreError         OUT  INTEGER,
		pcmensajeError        OUT  VARCHAR2

)

IS
	vctempMensaje VARCHAR2(1000);
	vnconteo INTEGER;
	vcnombrelibro VARCHAR2(45);
	vcprov VARCHAR2(45);


BEGIN
	vctempMensaje:='';
	vnconteo:=0;
	pbocurreError:=0;

	--validaciones
	IF pnidProveedor='' OR pnidProveedor IS NULL THEN
		vctempMensaje:='id Proveedor, ';
	END IF;

	 IF pnidTipoProveedor='' OR pnidTipoProveedor IS NULL THEN
		vctempMensaje:=vctempMensaje||'id tipo proveedor, ';
	END IF;

	IF pnCantidad='' OR pnCantidad IS NULL THEN
		vctempMensaje:=vctempMensaje||'cantidad, ';
	END IF;

	IF pnidLibro='' OR pnidLibro IS NULL THEN
		vctempMensaje:=vctempMensaje||'id libro, ';
	END IF;

	IF pcnombreLibro='' OR pcnombreLibro IS NULL THEN
		vctempMensaje:=vctempMensaje||'nombre, ';
	END IF;

	IF vctempMensaje<>'' THEN
		pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
		pbocurreError:=1;
	END IF;

	pcmensajeError:='';

	--que libro compra?

	SELECT COUNT(*) INTO vnconteo FROM Libro lib
	WHERE idLibro=pnidLibro;


    IF (vnconteo>0) THEN
        UPDATE Libro
        SET Existencia=Existencia+pnCantidad;
        pcmensajeError:='Libro Comprado Exitosamente';
        pbocurreError:=0;
        return;
    END IF;

    IF (vnconteo='' OR vnconteo IS NULL) THEN
        pcmensajeError:='Error, debe registrarlo como libro nuevo primero';
        pbocurreError:=0;
        return;
    END IF;

	

END;