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
        vctempMensaje:=vctempMensaje||'NO. identidad, ';
    END IF;

    IF pcAccion='' OR pcAccion IS NULL THEN
        vctempMensaje:=vctempMensaje||'ACCION, ';
    END IF;

    IF vctempMensaje<>'' THEN
        pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
        pbocurreError:=1;
    END IF;


    IF pcAccion='AGREGAR' OR pcAccion='agregar' THEN
        pcmensajeError:='';

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

        SELECT COUNT(*) INTO vnconteo FROM Persona per
        WHERE per.NoIdentidad=pcNoIdentidad;

        IF vnconteo=0 THEN
            pcmensajeError:='NO SE ENCONTRÓ REGISTRO';
            pbocurreError:=1;
            RETURN;
        END IF;

        SELECT per.idPersona INTO vnPersona FROM Persona per
        WHERE per.NoIdentidad=pcNoIdentidad;

        SELECT em.idEmpleado INTO vnEmpleado FROM Empleado em
       INNER JOIN Persona per on per.idPersona=em.Persona_idPersona
       WHERE per.NoIdentidad=pcNoIdentidad;

        UPDATE Persona
        SET idPersona=vnPersona ,pnombre=pcpnombre, snombre=pcsnombre, papellido=pcpapellido, sapellido=pcsapellido, direccion=pcdireccion, correo=pccorreo, NoIdentidad=pcNoIdentidad
        WHERE NoIdentidad=pcNoIdentidad;

        UPDATE Empleado
        SET idEmpleado=vnEmpleado,Persona_idPersona=vnPersona
        WHERE idEmpleado=vnEmpleado;

        pcmensajeError:='EMPLEADO EDITADO CORRECTAMENTE';
        pbocurreError:=0;

        RETURN;

    END IF;

    IF pcAccion='ELIMINAR' OR pcAccion='eliminar' THEN
        Delete FROM Persona
        WHERE NoIdentidad=pcNoIdentidad;

        pcmensajeError:='eliminado exitosamente';
        pbocurreError:=0;
        RETURN;

    END IF;



END;


--2 GESTION CLIENTE

CREATE OR REPLACE PROCEDURE SP_GESTIO_CLIENTE(
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
        vctempMensaje:=vctempMensaje||'NO. identidad, ';
    END IF;

    IF pcAccion='' OR pcAccion IS NULL THEN
        vctempMensaje:=vctempMensaje||'ACCION, ';
    END IF;

    IF vctempMensaje<>'' THEN
        pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
        pbocurreError:=1;
    END IF;


    IF pcAccion='AGREGAR' OR pcAccion='agregar' THEN
        pcmensajeError:='';

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

        SELECT COUNT(*) INTO vnconteo FROM Persona per
        WHERE per.NoIdentidad=pcNoIdentidad;

        IF vnconteo=0 THEN
            pcmensajeError:='NO SE ENCONTRÓ REGISTRO';
            pbocurreError:=1;
            RETURN;
        END IF;

        SELECT per.idPersona INTO vnPersona FROM Persona per
        WHERE per.NoIdentidad=pcNoIdentidad;

        SELECT cli.idCliente INTO vnCliente FROM Cliente cli
       INNER JOIN Persona per on per.idPersona=cli.Persona_idPersona
       WHERE per.NoIdentidad=pcNoIdentidad;

        UPDATE Persona
        SET idPersona=vnPersona ,pnombre=pcpnombre, snombre=pcsnombre, papellido=pcpapellido, sapellido=pcsapellido, direccion=pcdireccion, correo=pccorreo, NoIdentidad=pcNoIdentidad
        WHERE NoIdentidad=pcNoIdentidad;

        UPDATE Cliente
        SET idCliente=vnCliente,Persona_idPersona=vnPersona
        WHERE idCliente=vnCliente;

        pcmensajeError:='CLIENTE EDITADO CORRECTAMENTE';
        pbocurreError:=0;

        RETURN;

    END IF;

    IF pcAccion='ELIMINAR' OR pcAccion='eliminar' THEN
        Delete FROM Persona
        WHERE NoIdentidad=pcNoIdentidad;

        pcmensajeError:='eliminado exitosamente';
        pbocurreError:=0;
        RETURN;

    END IF;



END;



--3. GESTION LIBRO
CREATE OR REPLACE PROCEDURE SP_GESTIO_LIBRO(
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
        vctempMensaje:=vctempMensaje||'PRECIO VENTA, ';
    END IF;

    IF pcAccion='' OR pcAccion IS NULL THEN
        vctempMensaje:=vctempMensaje||'ACCION, ';
    END IF;

    IF vctempMensaje<>'' THEN
        pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
        pbocurreError:=1;
    END IF;


    IF pcAccion='AGREGAR' OR pcAccion='agregar' THEN
        pcmensajeError:='';

        SELECT COUNT(*) INTO vnconteo FROM Libro lib
        WHERE lib.nombre =pcnombre;

        IF vnconteo>0 THEN
            pcmensajeError:='YA EXISTE UN LIBRO CON ESTE NOMBRE';
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

        SELECT COUNT(*) INTO vnconteo FROM Libro lib
        WHERE lib.nombre = pcnombre;


        IF vnconteo=0 THEN
            pcmensajeError:='NO SE ENCONTRÓ REGISTRO';
            pbocurreError:=1;
            RETURN;
        END IF;


        SELECT lib.idLibro INTO vnLibro FROM Libro lib
        WHERE lib.nombre=pcnombre;


        UPDATE Libro
        SET idLibro=vnLibro ,nombre=pcnombre, anioPublicacion=pnanioPublicacion, PrecioCosto=pfPrecioCosto, PrecioVenta=pfPrecioVenta
        WHERE nombre=pcnombre;

        pcmensajeError:='LIBRO EDITADO CORRECTAMENTE';
        pbocurreError:=0;

        RETURN;

    END IF;

    IF pcAccion='ELIMINAR' OR pcAccion='eliminar' THEN
        Delete FROM Libro
        WHERE nombre=pcnombre;

        pcmensajeError:='eliminado exitosamente';
        pbocurreError:=0;
        RETURN;

    END IF;



END;



--4- Gestion Sucursal
 CREATE OR REPLACE PROCEDURE SP_GESTIO_SUCURSAL(
        pcnombre IN VARCHAR2,
        pcdireccion IN VARCHAR2,
        pctelefono IN VARCHAR2,
        pnidBodega IN INTEGER,
        pnidLibreria IN FLOAT,
        pcAccion in VARCHAR2,

       pbocurreError         OUT  INTEGER,
       pcmensajeError        OUT  VARCHAR2
)

IS
    vctempMensaje VARCHAR2(1000);
    vnconteo INTEGER;
    vnSucursal INTEGER;

BEGIN
    vctempMensaje:='';
    vnconteo:=0;
    pbocurreError:=0;

    --validaciones
    IF pcnombre='' OR pcnombre IS NULL THEN
        vctempMensaje:='nombre, ';
    END IF;

    IF pcdireccion='' OR pcdireccion IS NULL THEN
        vctempMensaje:=vctempMensaje||'direccion, ';
    END IF;

    IF pctelefono='' OR pctelefono IS NULL THEN
        vctempMensaje:=vctempMensaje||'TELEFONO, ';
    END IF;

    IF pnidBodega='' OR pnidBodega IS NULL THEN
        vctempMensaje:=vctempMensaje||'ID BODEGA, ';
    END IF;

    IF pnidLibreria='' OR pnidLibreria IS NULL THEN
        vctempMensaje:=vctempMensaje||'ID LIBRERIA, ';
    END IF;

    IF pcAccion='' OR pcAccion IS NULL THEN
        vctempMensaje:=vctempMensaje||'ACCION, ';
    END IF;

    IF vctempMensaje<>'' THEN
        pcmensajeError:='CAMPOS REQUERIDOS: '||vctempMensaje;
        pbocurreError:=1;
    END IF;


    IF pcAccion='AGREGAR' OR pcAccion='agregar' THEN
        pcmensajeError:='';

        SELECT COUNT(*) INTO vnconteo FROM Sucursal su
        WHERE su.nombre =pcnombre;

        IF vnconteo>0 THEN
            pcmensajeError:='YA EXISTE UNA SUCURSAL CON ESTE NOMBRE';
            pbocurreError:=1;
            RETURN;
        END IF;

        INSERT INTO Sucursal(nombre,direccion,telefono,Bodega_idBodega,Libreria_idLibreria)
        VALUES(pcnombre,pcdireccion,pctelefono,pnidBodega,pnidLibreria);

        INSERT INTO Bodega(idBodega,Nombre)
        VALUES (pnidBodega,pcnombre);



        pcmensajeError:='SUCURSAL REGISTRADA Exitosamente';
        pbocurreError:=0;
        RETURN;

    END IF;

    IF pcAccion='EDITAR' or pcAccion='editar' THEN

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
        SET idSucursal=vnSucursal ,nombre=pcnombre, direccion=pcdireccion, telefono=pctelefono
        WHERE nombre=pcnombre;

        pcmensajeError:='SUCURSAL EDITADA CORRECTAMENTE';
        pbocurreError:=0;

        RETURN;

    END IF;

    IF pcAccion='ELIMINAR' OR pcAccion='eliminar' THEN
        Delete FROM Sucursal
        WHERE nombre=pcnombre;

        pcmensajeError:='eliminado exitosamente';
        pbocurreError:=0;
        RETURN;

    END IF;



END;