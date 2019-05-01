--7. Prestamos Libros


--ENTRADA: ID CLIENTE, ID TIPO OBTENCION, ID LIBRO, ID PRESTAMO, FECHAINICIO(FECHA ACTUAL), DIAS QUE LO TENDRÁ (SUMARLO A FECHAINICIO PRA DAR CON FECHAMAX), MONTOPAGAR, IDTIPOPAGO

--PROCESO: RESTARLE LA EXISTENCIA A LIBRO, HACER INSERT EN PRESTAMO ,HACER INSERT EN PAGO, HACER UN INSERT EN FACTURA

--SALIDA: TOTAL A PAGAR, DIAS RESTANTES.

CREATE OR REPLACE PROCEDURE SP_GESTION_PRESTAMOSLIBROS(
		pnidLibro IN INTEGER,
		pnidCliente IN INTEGER,
		pnidTipoObtencion IN INTEGER,
		pnCantidadDias IN INTEGER,
		--pnidprestamo IN INTEGER,
		pnidTipoPago IN INTEGER,
		--pdFechaMax IN DATE,

		pdFechaInicio OUT VARCHAR2,
		pdFechaMax OUT VARCHAR2,
		pbocurreError         OUT  INTEGER,
		pcmensajeError        OUT  VARCHAR2

)

IS
	vctempMensaje VARCHAR2(1000);
	vnconteo INTEGER;
	vfMontoPagar FLOAT;
	vnIdPrestamo INTEGER;
	--vcnombreCliente VARCHAR2(90);
	vfTarifaDiaria FLOAT;
	vdFechaMaxima DATE;
	--vnDiasRestantes INTEGER;
	vnPago INTEGER;
	--vfSuelto FLOAT;
	--vfTotal FLOAT;



BEGIN
	pcmensajeError := '';
	vctempMensaje:='';
	vnconteo:=0;
	pbocurreError:=0;

	--validaciones
	IF pnidLibro='' OR pnidLibro IS NULL THEN
		vctempMensaje:='id Libro, ';
	END IF;

	IF pnidCliente='' OR pnidCliente IS NULL THEN
		vctempMensaje:='id cliente, ';
	END IF;

	IF pnidTipoObtencion='' OR pnidTipoObtencion IS NULL THEN
		vctempMensaje:=vctempMensaje||'id tipo obtencion, ';
	END IF;

	IF pnCantidadDias='' OR pnCantidadDias IS NULL THEN
		vctempMensaje:='id Cantidad Dias, ';
	END IF;

	/*
	IF pnidprestamo='' OR pnidprestamo IS NULL THEN
		vctempMensaje:=vctempMensaje||'id prestamos, ';
	END IF;

	IF pfMontoPagar='' OR pfMontoPagar IS NULL THEN
		vctempMensaje:=vctempMensaje||'monto pagar, ';
	END IF;
	*/

	IF pnidTipoPago='' OR pnidTipoPago IS NULL THEN
		vctempMensaje:=vctempMensaje||'id del tipo pago';
	END IF;

	IF vctempMensaje <> '' OR vctempMensaje IS NOT NULL THEN
		pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
		pbocurreError:=1;
		RETURN;
	END IF;

	--Validar que el cliente exista
	SELECT COUNT(*) INTO vnconteo FROM Cliente cli
	WHERE cli.idCliente = pnidCliente;

	IF vnconteo=0 THEN
		pcmensajeError:='id Cliente no existe.';
		pbocurreError:=1;
		RETURN;
	END IF;

	--Validar que tipo obtencion exista
	SELECT COUNT(*) INTO vnconteo FROM TipoObtencion
	WHERE idTipoObtencion = pnidTipoObtencion;

	IF vnconteo=0 THEN
		pcmensajeError:='id tipo obtencion no existe.';
		pbocurreError:=1;
		RETURN;
	END IF;

	--Validar tipo pago
	SELECT COUNT(*) INTO vnconteo FROM TipoPago
	WHERE idTipoPago = pnidTipoPago;

	IF vnconteo=0 THEN
		pcmensajeError:='id Tipo pago no existe.';
		pbocurreError:=1;
		RETURN;
	END IF;



	--que libro pide prestado?

	SELECT COUNT(*) INTO vnconteo FROM Libro
	WHERE idLibro = pnidLibro;

	IF vnconteo=0 THEN
		pcmensajeError:='id Libro no existe.';
		pbocurreError:=1;
		RETURN;
	END IF;

	--quien lo pide prestado?
/*
	SELECT per.pnombre||per.sapellido INTO vcnombreCliente FROM Persona per
	INNER JOIN Cliente cli on cli.Persona_idPersona=per.idPersona
	WHere cli.idCliente=pnidCliente;
*/

	vfTarifaDiaria := 2;

	vfMontoPagar := vfTarifaDiaria*pnCantidadDias;

	vdFechaMaxima := (SYSDATE + pnCantidadDias);

	pdFechaInicio := TO_CHAR(SYSDATE);
	pdFechaMax := TO_CHAR(vdFechaMaxima);

	UPDATE Libro
	SET Existencia = (Existencia - 1)
	WHERE idLibro = pnidLibro;

	INSERT INTO Prestamo(fechaInicio,fechaMax)
	VALUES (SYSDATE,vdFechaMaxima);

	SELECT MAX(pre.idPrestamo) INTO vnIdPrestamo FROM Prestamo pre;

	INSERT INTO Pago(MontoPagar,fechaHora,Prestamo_idPrestamo,Descuento_idDescuento,TipoPago_idTipoPago)
	VALUES (vfMontoPagar,SYSDATE,vnIdPrestamo,NULL,pnidTipoPago);

	SELECT MAX(pa.idPago) INTO vnPago FROM Pago pa;

	INSERT INTO Factura(fechaRegistro,TipoObtencion_idTipoObtencion,Cliente_idCliente,Pago_idPago)
	VALUES (SYSDATE,pnidTipoObtencion,pnidCliente,vnPago);

	--sacar dias restantes
/*
	select trunc(fechaMax)-trunc(sysdate) INTO vnDiasRestantes from  Prestamo pre
	INNER JOIN Pago pa on pa.Prestamo_idPrestamo=pre.idPrestamo
	INNER JOIN Factura fa ON fa.Pago_idPago=pa.idPago
	WHERE fa.Cliente_idCliente=pnidCliente;
*/

	--total

	--vfTotal:=pnCantidadDias*tarifaDiara;

	--vfSuelto:=pfMontoPagar-vfTotal;


	pcmensajeError := 'PRESTAMO REALIZADO CORRECTAMENTE';
	pbocurreError := 0;


END;
