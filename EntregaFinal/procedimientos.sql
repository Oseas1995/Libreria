--1. Gestion Empleado
--2. Gestion Cliente
--3. Gestion Libro
--4- Gestion Sucursal


--1 Gestion Empleado

CREATE OR REPLACE PROCEDURE SP_GESTION_EMPLEADO(
        pcpnombre IN VARCHAR2,
        pcsnombre IN VARCHAR2,
        pcpapellido IN VARCHAR2,
        pcsapellido IN VARCHAR2,
        pcdireccion IN VARCHAR2,
        pccorreo IN VARCHAR2,
        pcNoIdentidad IN VARCHAR2,
        pcAccion IN VARCHAR2,

       pbocurreError         OUT  INTEGER,
       pcmensajeError        OUT  VARCHAR2
)

IS
    vctempMensaje VARCHAR2(1000);
    vnconteo INTEGER;
    vnEmpleado INTEGER;
    vnPersona INTEGER;

BEGIN
    vctempMensaje:='';
    vnconteo:=0;
    pbocurreError:=0;

    IF pcAccion='' OR pcAccion IS NULL THEN
        vctempMensaje:=vctempMensaje||'ACCION';
    END IF;

    IF vctempMensaje <> '' OR vctempMensaje IS NOT NULL THEN
        pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
        pbocurreError:=1;
        RETURN;
    END IF;

    IF pcAccion='AGREGAR' OR pcAccion='agregar' THEN
        pcmensajeError:='';

        --validaciones
	    IF pcpnombre='' OR pcpnombre IS NULL THEN
	        vctempMensaje:='Primer nombre, ';
	    END IF;

	    IF pcsnombre='' OR pcsnombre IS NULL THEN
	        vctempMensaje:=vctempMensaje||'Segundo Nombre, ';
	    END IF;

	    IF pcpapellido='' OR pcpapellido IS NULL THEN
	        vctempMensaje:=vctempMensaje||'Primer Apellido, ';
	    END IF;

	    IF pcsapellido='' OR pcsapellido IS NULL THEN
	        vctempMensaje:=vctempMensaje||'Segundo Apellido, ';
	    END IF;

	    IF pcdireccion='' OR pcdireccion IS NULL THEN
	        vctempMensaje:=vctempMensaje||'Direccion, ';
	    END IF;

	    IF pccorreo='' OR pccorreo IS NULL THEN
	        vctempMensaje:=vctempMensaje||'Correo, ';
	    END IF;

	    IF pcNoIdentidad='' OR pcNoIdentidad IS NULL THEN
	        vctempMensaje:=vctempMensaje||'NO. identidad';
	    END IF;

	    IF vctempMensaje <> '' OR vctempMensaje IS NOT NULL THEN
	        pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
	        pbocurreError:=1;
            RETURN;
	    END IF;

        SELECT COUNT(*) INTO vnconteo FROM Persona per
        WHERE per.NoIdentidad=pcNoIdentidad;

        IF vnconteo>0 THEN
            pcmensajeError:='YA EXISTE UNA PERSONA CON ESTE NUMERO DE IDENTIDAD';
            pbocurreError:=1;
            RETURN;
        END IF;

        INSERT INTO Persona(pnombre,snombre,papellido,sapellido,direccion,correo,NoIdentidad)
        VALUES(pcpnombre,pcsnombre,pcpapellido,pcsapellido,pcdireccion,pccorreo,pcNoIdentidad);

        SELECT MAX(per.idPersona) INTO vnPersona FROM Persona per;

        INSERT INTO Empleado(FechaIngreso,Persona_idPersona)
        VALUES (SYSDATE,vnPersona);

        pcmensajeError:='EMPLEADO REGISTRADO Exitosamente';
        pbocurreError:=0;
        RETURN;

    END IF;

    IF pcAccion='EDITAR' or pcAccion='editar' THEN

    	--validaciones
	    IF pcpnombre='' OR pcpnombre IS NULL THEN
	        vctempMensaje:='Primer nombre, ';
	    END IF;

	    IF pcsnombre='' OR pcsnombre IS NULL THEN
	        vctempMensaje:=vctempMensaje||'Segundo Nombre, ';
	    END IF;

	    IF pcpapellido='' OR pcpapellido IS NULL THEN
	        vctempMensaje:=vctempMensaje||'Primer Apellido, ';
	    END IF;

	    IF pcsapellido='' OR pcsapellido IS NULL THEN
	        vctempMensaje:=vctempMensaje||'Segundo Apellido, ';
	    END IF;

	    IF pcdireccion='' OR pcdireccion IS NULL THEN
	        vctempMensaje:=vctempMensaje||'Direccion, ';
	    END IF;

	    IF pccorreo='' OR pccorreo IS NULL THEN
	        vctempMensaje:=vctempMensaje||'Correo, ';
	    END IF;

	    IF pcNoIdentidad='' OR pcNoIdentidad IS NULL THEN
	        vctempMensaje:=vctempMensaje||'NO. identidad';
	    END IF;

	    IF vctempMensaje <> '' OR vctempMensaje IS NOT NULL THEN
	        pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
	        pbocurreError:=1;
            RETURN;
	    END IF;

        SELECT COUNT(*) INTO vnconteo FROM Persona per
        WHERE per.NoIdentidad=pcNoIdentidad;

        IF vnconteo=0 THEN
            pcmensajeError:='NO SE ENCONTRÓ REGISTRO';
            pbocurreError:=1;
            RETURN;
        END IF;

        /*SELECT per.idPersona INTO vnPersona FROM Persona per
        WHERE per.NoIdentidad=pcNoIdentidad;*/

      /* SELECT em.idEmpleado INTO vnEmpleado FROM Empleado em
       INNER JOIN Persona per on per.idPersona=em.Persona_idPersona
       WHERE per.NoIdentidad=pcNoIdentidad; */

        UPDATE Persona
        SET pnombre=pcpnombre, snombre=pcsnombre, papellido=pcpapellido, sapellido=pcsapellido, direccion=pcdireccion, correo=pccorreo, NoIdentidad=pcNoIdentidad
        WHERE NoIdentidad=pcNoIdentidad;

        /*UPDATE Empleado
        SET idEmpleado=vnEmpleado,Persona_idPersona=vnPersona
        WHERE idEmpleado=vnEmpleado;*/

        pcmensajeError:='EMPLEADO EDITADO CORRECTAMENTE';
        pbocurreError:=0;

        RETURN;

    END IF;

    IF pcAccion='ELIMINAR' OR pcAccion='eliminar' THEN

    	IF pcNoIdentidad='' OR pcNoIdentidad IS NULL THEN
	        vctempMensaje:=vctempMensaje||'NO. identidad';
	    END IF;

	    IF vctempMensaje <> '' OR vctempMensaje IS NOT NULL THEN
	        pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
	        pbocurreError:=1;
            RETURN;
	    END IF;

        SELECT COUNT(*) INTO vnconteo FROM Persona per
        WHERE per.NoIdentidad=pcNoIdentidad;

        IF vnconteo = 0 THEN
            pcmensajeError := 'No se encontro el registro.';
            pbocurreError := 1;
            RETURN;
        END IF;

        Delete FROM Persona
        WHERE NoIdentidad=pcNoIdentidad;

        pcmensajeError:='Registro eliminado exitosamente';
        pbocurreError:=0;
        RETURN;

    END IF;



END;


--2 GESTION CLIENTE

CREATE OR REPLACE PROCEDURE SP_GESTION_CLIENTE(
        pcpnombre IN VARCHAR2,
        pcsnombre IN VARCHAR2,
        pcpapellido IN VARCHAR2,
        pcsapellido IN VARCHAR2,
        pcdireccion IN VARCHAR2,
        pccorreo IN VARCHAR2,
        pcNoIdentidad IN VARCHAR2,
        pcAccion IN VARCHAR2,

       pbocurreError         OUT  INTEGER,
       pcmensajeError        OUT  VARCHAR2
)

IS
    vctempMensaje VARCHAR2(1000);
    vnconteo INTEGER;
    vnCliente INTEGER;
    vnPersona INTEGER;

BEGIN
    vctempMensaje:='';
    vnconteo:=0;
    pbocurreError:=0;

    IF pcAccion='' OR pcAccion IS NULL THEN
        vctempMensaje:=vctempMensaje||'ACCION';
    END IF;

    IF vctempMensaje <> '' OR vctempMensaje IS NOT NULL THEN
        pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
        pbocurreError:=1;
        RETURN;
    END IF;

    IF pcAccion='AGREGAR' OR pcAccion='agregar' THEN
        pcmensajeError:='';

        --validaciones
        IF pcpnombre='' OR pcpnombre IS NULL THEN
            vctempMensaje:='Primer nombre, ';
        END IF;

        IF pcsnombre='' OR pcsnombre IS NULL THEN
            vctempMensaje:=vctempMensaje||'Segundo Nombre, ';
        END IF;

        IF pcpapellido='' OR pcpapellido IS NULL THEN
            vctempMensaje:=vctempMensaje||'Primer Apellido, ';
        END IF;

        IF pcsapellido='' OR pcsapellido IS NULL THEN
            vctempMensaje:=vctempMensaje||'Segundo Apellido, ';
        END IF;

        IF pcdireccion='' OR pcdireccion IS NULL THEN
            vctempMensaje:=vctempMensaje||'Direccion, ';
        END IF;

        IF pccorreo='' OR pccorreo IS NULL THEN
            vctempMensaje:=vctempMensaje||'Correo, ';
        END IF;

        IF pcNoIdentidad='' OR pcNoIdentidad IS NULL THEN
            vctempMensaje:=vctempMensaje||'NO. identidad';
        END IF;

        IF vctempMensaje <> '' OR vctempMensaje IS NOT NULL THEN
            pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
            pbocurreError:=1;
            RETURN;
        END IF;

        SELECT COUNT(*) INTO vnconteo FROM Persona per
        WHERE per.NoIdentidad=pcNoIdentidad;

        IF vnconteo>0 THEN
            pcmensajeError:='YA EXISTE UNA PERSONA CON ESTE NUMERO DE IDENTIDAD';
            pbocurreError:=1;
            RETURN;
        END IF;

        INSERT INTO Persona(pnombre,snombre,papellido,sapellido,direccion,correo,NoIdentidad)
        VALUES(pcpnombre,pcsnombre,pcpapellido,pcsapellido,pcdireccion,pccorreo,pcNoIdentidad);

        SELECT MAX(per.idPersona) INTO vnPersona FROM Persona per;

        INSERT INTO Cliente(FechaIngreso,Persona_idPersona)
        VALUES(SYSDATE,vnPersona);

        pcmensajeError:='CLIENTE REGISTRADO Exitosamente';
        pbocurreError:=0;
        RETURN;

    END IF;

    IF pcAccion='EDITAR' or pcAccion='editar' THEN

        --validaciones
        IF pcpnombre='' OR pcpnombre IS NULL THEN
            vctempMensaje:='Primer nombre, ';
        END IF;

        IF pcsnombre='' OR pcsnombre IS NULL THEN
            vctempMensaje:=vctempMensaje||'Segundo Nombre, ';
        END IF;

        IF pcpapellido='' OR pcpapellido IS NULL THEN
            vctempMensaje:=vctempMensaje||'Primer Apellido, ';
        END IF;

        IF pcsapellido='' OR pcsapellido IS NULL THEN
            vctempMensaje:=vctempMensaje||'Segundo Apellido, ';
        END IF;

        IF pcdireccion='' OR pcdireccion IS NULL THEN
            vctempMensaje:=vctempMensaje||'Direccion, ';
        END IF;

        IF pccorreo='' OR pccorreo IS NULL THEN
            vctempMensaje:=vctempMensaje||'Correo, ';
        END IF;

        IF pcNoIdentidad='' OR pcNoIdentidad IS NULL THEN
            vctempMensaje:=vctempMensaje||'NO. identidad';
        END IF;

        IF vctempMensaje <> '' OR vctempMensaje IS NOT NULL THEN
            pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
            pbocurreError:=1;
            RETURN;
        END IF;

        SELECT COUNT(*) INTO vnconteo FROM Persona per
        WHERE per.NoIdentidad=pcNoIdentidad;

        IF vnconteo=0 THEN
            pcmensajeError:='NO SE ENCONTRÓ REGISTRO';
            pbocurreError:=1;
            RETURN;
        END IF;

      /*  SELECT per.idPersona INTO vnPersona FROM Persona per
        WHERE per.NoIdentidad=pcNoIdentidad;

        SELECT cli.idCliente INTO vnCliente FROM Cliente cli
        INNER JOIN Persona per on per.idPersona=cli.Persona_idPersona
        WHERE per.NoIdentidad=pcNoIdentidad;  */

        UPDATE Persona
        SET pnombre=pcpnombre, snombre=pcsnombre, papellido=pcpapellido, sapellido=pcsapellido, direccion=pcdireccion, correo=pccorreo, NoIdentidad=pcNoIdentidad
        WHERE NoIdentidad=pcNoIdentidad;

        /*UPDATE Cliente
        SET Persona_idPersona=vnPersona
        WHERE idCliente=vnCliente;*/

        pcmensajeError:='CLIENTE EDITADO CORRECTAMENTE';
        pbocurreError:=0;

        RETURN;

    END IF;

    IF pcAccion='ELIMINAR' OR pcAccion='eliminar' THEN

        IF pcNoIdentidad='' OR pcNoIdentidad IS NULL THEN
            vctempMensaje:=vctempMensaje||'NO. identidad';
        END IF;

        IF vctempMensaje <> '' OR vctempMensaje IS NOT NULL THEN
            pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
            pbocurreError:=1;
            RETURN;
        END IF;

        SELECT COUNT(*) INTO vnconteo FROM Persona per
        WHERE per.NoIdentidad=pcNoIdentidad;

        IF vnconteo = 0 THEN
            pcmensajeError := 'No se encontro el registro.';
            pbocurreError := 1;
            RETURN;
        END IF;

        Delete FROM Persona
        WHERE NoIdentidad=pcNoIdentidad;

        pcmensajeError:='Registro eliminado exitosamente';
        pbocurreError:=0;
        RETURN;

    END IF;



END;



--3. GESTION LIBRO
CREATE OR REPLACE PROCEDURE SP_GESTION_LIBRO(
        pcnombre IN VARCHAR2,
        pnanioPublicacion IN INTEGER,
        pnidCategoria IN INTEGER,
        pnidIdioma IN INTEGER,
        pfPrecioCosto IN FLOAT,
        pfPrecioVenta IN FLOAT,
        pcAccion IN VARCHAR2,

       pbocurreError         OUT  INTEGER,
       pcmensajeError        OUT  VARCHAR2
)

IS
    vctempMensaje VARCHAR2(1000);
    vnconteo INTEGER;
    vnLibro INTEGER;

BEGIN
    vctempMensaje:='';
    vnconteo:=0;
    pbocurreError:=0;

    IF pcAccion='' OR pcAccion IS NULL THEN
        vctempMensaje:=vctempMensaje||'ACCION';
    END IF;

    IF vctempMensaje <> '' OR vctempMensaje IS NOT NULL THEN
        pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
        pbocurreError:=1;
        RETURN;
    END IF;

    IF pcAccion='AGREGAR' OR pcAccion='agregar' THEN
        pcmensajeError:='';

        --validaciones
	    IF pcnombre='' OR pcnombre IS NULL THEN
	        vctempMensaje:='nombre, ';
	    END IF;

	    IF pnanioPublicacion='' OR pnanioPublicacion IS NULL THEN
	        vctempMensaje:=vctempMensaje||'Anio de publicacion, ';
	    END IF;

	    IF pnidCategoria='' OR pnidCategoria IS NULL THEN
	        vctempMensaje:=vctempMensaje||'ID CATEGORIA, ';
	    END IF;

	    IF pnidIdioma='' OR pnidIdioma IS NULL THEN
	        vctempMensaje:=vctempMensaje||'ID IDIOMA, ';
	    END IF;

	    IF pfPrecioCosto='' OR pfPrecioCosto IS NULL THEN
	        vctempMensaje:=vctempMensaje||'PRECIO COSTO, ';
	    END IF;

	    IF pfPrecioVenta='' OR pfPrecioVenta IS NULL THEN
	        vctempMensaje:=vctempMensaje||'PRECIO VENTA';
	    END IF;

	    IF vctempMensaje <> '' OR vctempMensaje IS NOT NULL THEN
	        pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
	        pbocurreError:=1;
            RETURN;
	    END IF;

        SELECT lib.idLibro INTO vnLibro FROM Libro lib
        WHERE lib.nombre=pcnombre AND lib.anioPublicacion=pnanioPublicacion AND lib.Categoria_idCategoria=pnidCategoria AND lib.Idioma_idIdioma=pnidIdioma AND lib.PrecioCosto=pfPrecioCosto AND lib.PrecioVenta=pfPrecioVenta;

        IF vnLibro IS NOT NULL or vnLibro>0 THEN
            pcmensajeError:='este libro ya existe';
            pbocurreError:=1;
            RETURN;
        END IF;




        INSERT INTO Libro(nombre,anioPublicacion,Categoria_idCategoria,Idioma_idIdioma,PrecioCosto,PrecioVenta)
        VALUES(pcnombre,pnanioPublicacion,pnidCategoria,pnidIdioma,pfPrecioCosto,pfPrecioVenta);



        pcmensajeError:='LIBRO REGISTRADO Exitosamente';
        pbocurreError:=0;
        RETURN;

    END IF;

    IF pcAccion='EDITAR' or pcAccion='editar' THEN

    	--validaciones
	    IF pcnombre='' OR pcnombre IS NULL THEN
	        vctempMensaje:='nombre, ';
	    END IF;

	    IF pnanioPublicacion='' OR pnanioPublicacion IS NULL THEN
	        vctempMensaje:=vctempMensaje||'Anio de publicacion, ';
	    END IF;

	    IF pnidCategoria='' OR pnidCategoria IS NULL THEN
	        vctempMensaje:=vctempMensaje||'ID CATEGORIA, ';
	    END IF;

	    IF pnidIdioma='' OR pnidIdioma IS NULL THEN
	        vctempMensaje:=vctempMensaje||'ID IDIOMA, ';
	    END IF;

	    IF pfPrecioCosto='' OR pfPrecioCosto IS NULL THEN
	        vctempMensaje:=vctempMensaje||'PRECIO COSTO, ';
	    END IF;

	    IF pfPrecioVenta='' OR pfPrecioVenta IS NULL THEN
	        vctempMensaje:=vctempMensaje||'PRECIO VENTA';
	    END IF;

	    IF vctempMensaje <> '' OR vctempMensaje IS NOT NULL THEN
	        pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
	        pbocurreError:=1;
            RETURN;
	    END IF;

        SELECT lib.idLibro INTO vnLibro FROM Libro lib
        WHERE lib.nombre=pcnombre AND lib.anioPublicacion=pnanioPublicacion AND lib.Categoria_idCategoria=pnidCategoria AND lib.Idioma_idIdioma=pnidIdioma AND lib.PrecioCosto=pfPrecioCosto AND lib.PrecioVenta=pfPrecioVenta;

        IF vnLibro=0 OR vnLibro IS NULL THEN
            pcmensajeError:='NO SE ENCONTRÓ REGISTRO';
            pbocurreError:=1;
            RETURN;
        END IF;


        UPDATE Libro
        SET nombre=pcnombre, anioPublicacion=pnanioPublicacion, PrecioVenta=pfPrecioVenta
        WHERE idLibro=vnLibro;

        pcmensajeError:='LIBRO EDITADO CORRECTAMENTE';
        pbocurreError:=0;

        RETURN;

    END IF;

    IF pcAccion='ELIMINAR' OR pcAccion='eliminar' THEN

        SELECT lib.idLibro INTO vnLibro FROM Libro lib
        WHERE lib.nombre=pcnombre AND lib.anioPublicacion=pnanioPublicacion AND lib.Categoria_idCategoria=pnidCategoria AND lib.Idioma_idIdioma=pnidIdioma AND lib.PrecioCosto=pfPrecioCosto AND lib.PrecioVenta=pfPrecioVenta;


        IF vnLibro=0 OR vnLibro IS NULL THEN
            pcmensajeError:='NO SE ENCONTRÓ REGISTRO';
            pbocurreError:=1;
            RETURN;
        END IF;

        Delete FROM Libro
        WHERE idLibro=vnLibro;

        pcmensajeError:='Registro eliminado exitosamente';
        pbocurreError:=0;
        RETURN;

    END IF;



END;



--4- Gestion Sucursal
 CREATE OR REPLACE PROCEDURE SP_GESTION_SUCURSAL(
        pcnombre IN VARCHAR2,
        pcdireccion IN VARCHAR2,
        pctelefono IN VARCHAR2,
        pcAccion IN VARCHAR2,

        pbocurreError         OUT  INTEGER,
        pcmensajeError        OUT  VARCHAR2
)

IS
    vctempMensaje VARCHAR2(1000);
    vnconteo INTEGER;
    vnSucursal INTEGER;
    vnBodega INTEGER;

BEGIN
    vctempMensaje:='';
    vnconteo:=0;
    pbocurreError:=0;

    IF pcAccion='' OR pcAccion IS NULL THEN
        vctempMensaje:=vctempMensaje||'ACCION';
    END IF;

    IF vctempMensaje <> '' OR vctempMensaje IS NOT NULL THEN
        pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
        pbocurreError:=1;
        RETURN;
    END IF;


    IF pcAccion='AGREGAR' OR pcAccion='agregar' THEN
        pcmensajeError:='';

        --validaciones
	    IF pcnombre='' OR pcnombre IS NULL THEN
	        vctempMensaje:='nombre, ';
	    END IF;

	    IF pcdireccion='' OR pcdireccion IS NULL THEN
	        vctempMensaje:=vctempMensaje||'direccion, ';
	    END IF;

	    IF pctelefono='' OR pctelefono IS NULL THEN
	        vctempMensaje:=vctempMensaje||'TELEFONO';
	    END IF;

	    IF vctempMensaje <> '' OR vctempMensaje IS NOT NULL THEN
	        pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
	        pbocurreError:=1;
            RETURN;
	    END IF;

        SELECT COUNT(*) INTO vnconteo FROM Sucursal su
        WHERE su.nombre =pcnombre;

        IF vnconteo>0 THEN
            pcmensajeError:='YA EXISTE UNA SUCURSAL CON ESTE NOMBRE';
            pbocurreError:=1;
            RETURN;
        END IF;

        INSERT INTO Bodega(Nombre)
        VALUES (pcnombre);

        SELECT max(bo.idBodega) INTO vnBodega FROM Bodega bo;

        INSERT INTO Sucursal(nombre,direccion,telefono,Bodega_idBodega,Libreria_idLibreria)
        VALUES(pcnombre,pcdireccion,pctelefono,vnBodega,1);





        pcmensajeError:='SUCURSAL REGISTRADA Exitosamente';
        pbocurreError:=0;
        RETURN;

    END IF;

    IF pcAccion='EDITAR' or pcAccion='editar' THEN

    	--validaciones
	    IF pcnombre='' OR pcnombre IS NULL THEN
	        vctempMensaje:='nombre, ';
	    END IF;

	    IF pcdireccion='' OR pcdireccion IS NULL THEN
	        vctempMensaje:=vctempMensaje||'direccion, ';
	    END IF;

	    IF pctelefono='' OR pctelefono IS NULL THEN
	        vctempMensaje:=vctempMensaje||'TELEFONO';
	    END IF;

	    IF vctempMensaje <> '' OR vctempMensaje IS NOT NULL THEN
	        pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
	        pbocurreError:=1;
            RETURN;
	    END IF;

        SELECT COUNT(*) INTO vnconteo FROM Sucursal su
        WHERE su.nombre = pcnombre;

        IF vnconteo=0 THEN
            pcmensajeError:='NO SE ENCONTRÓ REGISTRO';
            pbocurreError:=1;
            RETURN;
        END IF;


        SELECT su.idSucursal INTO vnSucursal FROM Sucursal su
        WHERE su.nombre=pcnombre;


        UPDATE Sucursal
        SET nombre=pcnombre, direccion=pcdireccion, telefono=pctelefono
        WHERE idSucursal=vnSucursal;

        pcmensajeError:='SUCURSAL EDITADA CORRECTAMENTE';
        pbocurreError:=0;

        RETURN;

    END IF;

    IF pcAccion='ELIMINAR' OR pcAccion='eliminar' THEN

        SELECT su.idSucursal INTO vnSucursal FROM Sucursal su
        WHERE su.nombre=pcnombre;

        Delete FROM Sucursal
        WHERE idSucursal=vnSucursal;

        pcmensajeError:='Registro eliminado exitosamente';
        pbocurreError:=0;
        RETURN;

    END IF;



END;


--5 VENTA LIBRO

--entrada: id del libro, cantidad, Cliente, fechaRegistro(fechaActual)

--proceso: montoPagar-precioVenta= suelto, despues de vender eliminar libro( actualizar existencia libro)

--salida monto a pagar, y libro que compro, cliente nombre

CREATE OR REPLACE PROCEDURE SP_GESTION_VENTASLIBROS(
        pnidLibro IN INTEGER,
        pnidCliente IN INTEGER,
        pnidTipoObtencion IN INTEGER,
        pnidTipoPago IN INTEGER,
        pnCantidad in INTEGER,
        pfMontoPagar IN FLOAT,

        pbocurreError         OUT  INTEGER,
        pcmensajeError        OUT  VARCHAR2
         
)

IS
    vctempMensaje VARCHAR2(1000);
    vnconteo INTEGER;
    vcnombrelibro VARCHAR2(45);
    vcnombreCliente VARCHAR2(90);
    vfTotal FLOAT;
    vfSuelto FLOAT;
    vnPago  INTEGER;
    vnCantidadLibros INTEGER;

BEGIN
    vctempMensaje:='';
    vnconteo:=0;
    pbocurreError:=0;

    --validaciones
    IF pnidLibro='' OR pnidLibro IS NULL THEN
        vctempMensaje:='id libro, ';
    END IF;

     IF pnidCliente='' OR pnidCliente IS NULL THEN
        vctempMensaje:=vctempMensaje||'id CLIENTE, ';
    END IF;

    IF pnidTipoObtencion='' OR pnidTipoObtencion IS NULL THEN
        vctempMensaje:=vctempMensaje||'id tipoObtencion, ';
    END IF;


    IF pnCantidad='' OR pnCantidad IS NULL THEN
        vctempMensaje:=vctempMensaje||'cantidad';
    END IF;

    IF vctempMensaje<>'' THEN
        pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
        pbocurreError:=1;
    END IF;

    pcmensajeError:='';

    --que libro compra?

    SELECT lib.nombre INTO vcnombrelibro FROM Libro lib
    WHERE lib.idLibro=pnidLibro;

    --quien lo compra?

    SELECT per.pnombre||per.sapellido INTO vcnombreCliente FROM Persona per
    INNER JOIN Cliente cli on cli.Persona_idPersona=per.idPersona
    WHERE cli.idCliente=pnidCliente;

    --Monto a pagar

    SELECT SUM(lib.PrecioVenta)*df.Cantidad INTO vfTotal FROM Libro lib
    INNER JOIN DetalleFactura df on df.Libro_idLibro=lib.idLibro
    WHERE lib.idLibro=pnidLibro;


    IF pfMontoPagar<vfTotal THEN
        pcmensajeError:='DINERO INSUFICIENTE';
        pbocurreError:=1;
        RETURN;
    END IF;

    vfSuelto:=vfTotal-pfMontoPagar;

    SELECT df.Cantidad INTO vnCantidadLibros FROM DetalleFactura df
    Inner join Libro lib on lib.idLibro=df.Libro_idLibro;

    UPDATE Libro
    SET Existencia=Existencia-vnCantidadLibros
    WHERE idLibro=pnidLibro;

    INSERT INTO Pago(MontoPagar,fechaHora,Prestamo_idPrestamo,Descuento_idDescuento,TipoPago_idTipoPago)
    VALUES(pfMontoPagar,SYSDATE,NULL,NULL,pnidTipoPago);

    SELECT MAX(p.idPago) INTO vnPago FROM Pago p;

    INSERT INTO Factura(fechaRegistro,TipoObtencion_idTipoObtencion,Cliente_idCliente,Pago_idPago)
    VALUES(SYSDATE,pnidTipoObtencion,pnidCliente,vnPago);

    pcmensajeError:='registros agregados correctamente';
    pbocurreError:=0;


END;


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
        pnanioPublicacion in INTEGER,
        pnidCategoria IN INTEGER,
        pnidIdioma IN INTEGER,
        pfPrecioCosto IN FLOAT,
        pfPrecioVenta IN FLOAT,

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

    IF pnanioPublicacion='' OR pnanioPublicacion IS NULL THEN
        vctempMensaje:=vctempMensaje||'anio publicacion, ';
    END IF;

    IF pnidCategoria='' OR pnidCategoria IS NULL THEN
        vctempMensaje:=vctempMensaje||'id categoria, ';
    END IF;

    IF pnidIdioma='' OR pnidIdioma IS NULL THEN
        vctempMensaje:=vctempMensaje||'id idioma, ';
    END IF;

    IF pfPrecioCosto='' OR pfPrecioCosto IS NULL THEN
        vctempMensaje:=vctempMensaje||'precio Costo, ';
    END IF;


    IF pfPrecioVenta='' OR pfPrecioVenta IS NULL THEN
        vctempMensaje:=vctempMensaje||'precio Venta';
    END IF;

    IF vctempMensaje<>'' THEN
        pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
        pbocurreError:=1;
    END IF;

    pcmensajeError:='';

    --que libro compra?

    SELECT COUNT(*) INTO vnconteo FROM Libro lib
    WHERE idLibro=pnidLibro;

    -- a quien lo compra?

    SELECT prov.nombre INTO vcprov FROM Proveedor prov
    WHERE prov.idProveedor=pnidProveedor;

    IF vnconteo=0 OR vnconteo IS NULL THEN

        INSERT INTO Libro(nombre,aniPublicacion,Categoria_idCategoria,Idioma_idIdioma,PrecioCosto,PrecioVenta)
        VALUES (pcnombreLibro,pnanioPublicacion,pnidCategoria,pnidIdioma,pfPrecioCosto,pfPrecioVenta);

        INSERT INTO ProvLib(cantidad,Proveedor_idProveedor,Libro_idLibro)
        VALUES (pnCantidad,pnidProveedor,pnidLibro);

        pcmensajeError:='LIBRO REGISTRADO CORRECTAMENTE';
        pbocurreError:=0;

    RETURN;
    END IF;

    UPDATE Libro
    SET Existencia=Existencia+pnCantidad
    WHERE idLibro=pnidLibro;

    INSERT INTO ProvLib(cantidad,Proveedor_idProveedor,Libro_idLibro)
    VALUES (pnCantidad,pnidProveedor,pnidLibro);

    pcmensajeError:='EXISTENCIA EDITADA CORRECTAMENTE';
    pbocurreError:=0;


END;



--7. Prestamos Libros


--ENTRADA: ID CLIENTE, ID TIPO OBTENCION ID LIBRO, ID PRESTAMO, FECHAINICIO(FECHA ACTUAL), DIAS QUE LO TENDRÁ (SUMARLO A FECHAINICIO PRA DAR CON FECHAMAX), MONTOPAGAR, IDTIPOPAGO

--PROCESO: RESTARLE LA EXISTENCIA A LIBRO, HACER INSERT EN PRESTAMO ,HACER INSERT EN PAGO, HACER UN INSERT EN FACTURA

--SALIDA: TOTAL A PAGAR, DIAS RESTANTES.

CREATE OR REPLACE PROCEDURE SP_GESTION_PRESTAMOSLIBROS(
        pnidCliente IN INTEGER,
        pnidTipoObtencion IN INTEGER,
        pnidprestamo IN INTEGER,
        pfMontoPagar IN FLOAT,
        pnidTipoPago IN INTEGER,
        pnanioPublicacion in INTEGER,
        pdFechaMax in DATE,

        pbocurreError         OUT  INTEGER,
        pcmensajeError        OUT  VARCHAR2
         
)

IS
    vctempMensaje VARCHAR2(1000);
    vnconteo INTEGER;
    vcnombreCliente VARCHAR2(90);
    tarifaDiara INTEGER;
    vnDiasRestantes INTEGER;
    vnPago INTEGER;
    vfSuelto FLOAT;



BEGIN
    vctempMensaje:='';
    vnconteo:=0;
    pbocurreError:=0;

    --validaciones
    IF pnidCliente='' OR pnidCliente IS NULL THEN
        vctempMensaje:='id cliente, ';
    END IF;

     IF pnidTipoObtencion='' OR pnidTipoObtencion IS NULL THEN
        vctempMensaje:=vctempMensaje||'id tipo obtencion, ';
    END IF;

    IF pnidprestamo='' OR pnidprestamo IS NULL THEN
        vctempMensaje:=vctempMensaje||'id prestamos, ';
    END IF;

    IF pfMontoPagar='' OR pfMontoPagar IS NULL THEN
        vctempMensaje:=vctempMensaje||'monto pagar, ';
    END IF;

    IF pnidTipoPago='' OR pnidTipoPago IS NULL THEN
        vctempMensaje:=vctempMensaje||'id del tipo pago, ';
    END IF;

    IF pnanioPublicacion='' OR pnanioPublicacion IS NULL THEN
        vctempMensaje:=vctempMensaje||'anio publicacion, ';
    END IF;
     IF pnCantidadDias='' OR pnCantidadDias IS NULL THEN
        vctempMensaje:=vctempMensaje||'cantidad de dias';
    END IF;

    IF vctempMensaje<>'' THEN
        pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
        pbocurreError:=1;
        RETURN;
    END IF;

    pcmensajeError:='';

    --que libro pide prestado?

    SELECT COUNT(*) INTO vnconteo FROM Libro lib
    WHERE idLibro=pnidLibro;

    --quien lo pide prestado?

    SELECT per.pnombre||per.sapellido INTO vcnombreCliente FROM Persona per
    INNER JOIN Cliente cli on cli.Persona_idPersona=per.idPersona
    WHere cli.idCliente=pnidCliente;

    
    tarifaDiara:=2;

    UPDATE Libro 
    SET Existencia=Existencia-1;

    INSERT INTO Prestamo(fechaInicio,fechaMax)
    VALUES (SYSDATE,pdFechaMax);

    INSERT INTO Pago(MontoPagar,fechaHora,Prestamo_idPrestamo,Descuento_idDescuento,TipoPago_idTipoPago)
    VALUES (pfMontoPagar,SYSDATE,pnidprestamo,NULL,pnidTipoPago);

    SELECT MAX(pa.idPago) INTO vnPago FROM Pago pa;

    INSERT INTO Factura(fechaRegistro,TipoObtencion_idTipoObtencion,Cliente_idCliente,Pago_idPago)
    VALUES (SYSDATE,pnidTipoObtencion,pnidCliente,vnPago);

    --sacar dias restantes
  
    select trunc(fechaMax)-trunc(sysdate) INTO vnDiasRestantes from  Prestamo pre
    INNER JOIN Pago pa on pa.Prestamo_idPrestamo=pre.idPrestamo
    INNER JOIN Factura fa ON fa.Pago_idPago=pa.idPago
    WHERE fa.Cliente_idCliente=pnidCliente

    --total

    vfTotal:=pnCantidadDias*tarifaDiara;

    vfSuelto:=pfMontoPagar-vfTotal;


   
    
   
    pcmensajeError:='EXISTENCIA EDITADA CORRECTAMENTE';
    pbocurreError:=0;


END;
