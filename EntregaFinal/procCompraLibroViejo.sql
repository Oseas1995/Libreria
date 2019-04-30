--6 Compra de libros

--entrada: id del proveedor, id del tipo de prov, cantidad, idLibro, nombre,aniPublicacion,idCategoria,idIdioma,PrecioCosto,PrecioVenta

--proceso: Sumarle cantidad a existencia

--salida: update en Libro o Insert


CREATE OR REPLACE PROCEDURE SP_GESTION_COMPRASLIBROS(
		pnidProveedor IN INTEGER,
		pnCantidad IN INTEGER,
		pnidLibro IN INTEGER,

		pbocurreError         OUT  INTEGER,
		pcmensajeError        OUT  VARCHAR2

)

IS
	vctempMensaje VARCHAR2(1000);
	vnconteo INTEGER;
	vcprov VARCHAR2(45);


BEGIN
	pcmensajeError:='';
	vctempMensaje:='';
	vnconteo:=0;
	pbocurreError:=0;

	--validaciones
	IF pnidProveedor='' OR pnidProveedor IS NULL THEN
		vctempMensaje:='id Proveedor, ';
	END IF;

	IF pnCantidad='' OR pnCantidad IS NULL THEN
		vctempMensaje:=vctempMensaje||'cantidad, ';
	END IF;

	IF pnidLibro='' OR pnidLibro IS NULL THEN
		vctempMensaje:=vctempMensaje||'id libro';
	END IF;

	IF vctempMensaje<>'' OR vctempMensaje IS NOT NULL THEN
		pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
		pbocurreError:=1;
		RETURN;
	END IF;

	--Validar que el proveedor exista
	SELECT COUNT(*) INTO vnconteo FROM Proveedor
	WHERE idProveedor=pnidProveedor;

	IF vnconteo=0 THEN
		pcmensajeError:='id Proveedor no Existe.';
		pbocurreError:=1;
		RETURN;
	END IF;


	--que libro compra?
	SELECT COUNT(*) INTO vnconteo FROM Libro
	WHERE idLibro=pnidLibro;

	IF vnconteo = 0 THEN
		pcmensajeError:='Error, el libro no existe, debe registrarlo como libro nuevo primero.';
        pbocurreError:=1;
        RETURN;
	END IF;

    IF (vnconteo > 0) THEN
    	INSERT INTO ProvLib (cantidad, Proveedor_idProveedor, Libro_idLibro)
    	VALUES (pnCantidad, pnidProveedor, pnidLibro);

        UPDATE Libro
        SET Existencia=Existencia+pnCantidad
        WHERE idLibro = pnidLibro;

        pcmensajeError:='Libro Comprado Exitosamente';
        pbocurreError:=0;
        RETURN;
    END IF;

END;