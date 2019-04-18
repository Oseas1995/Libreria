--1. Gestion Empleado
--2. Gestion Cliente
--3. Gestion Libro


--1 Gestion Empleado

CREATE OR REPLACE PROCEDURE SP_GESTION_EMPLEADO(
        pcpnombre IN VARCHAR2(45),
        pcsnombre IN VARCHAR2(45),
        pcpapellido IN VARCHAR2(45),
        pcsapellido IN VARCHAR2(45),
        pcdireccion IN VARCHAR2(45),
        pccorreo IN VARCHAR2(45),
        pcNoIdentidad IN VARCHAR2(30),
        pcAccion IN VARCHAR2(45),

       pbocurreError         OUT  INT,
       pcmensajeError        OUT  VARCHAR(1000)
)

IS

BEGIN

    DECLARE vctempMensaje VARCHAR2(1000);
    DECLARE vnconteo INT;

    vctempMensaje:='';
    vnconteo:=0;
    pbocurreError:=0;

    --validaciones
    IF pcpnombre='' OR pcpnombre IS NULL THEN
        vctempMensaje:='Primer nombre, ';
    END IF;

    IF pcsnombre='' OR pcsnombre IS NULL THEN
        vctempMensaje:=CONCAT('Segundo Nombre, ',vctempMensaje);
    END IF;

    IF pcpapellido='' OR pcpapellido IS NULL THEN
        vctempMensaje:=CONCAT('Primer Apellido, ',vctempMensaje);
    END IF;

    IF pcsapellido='' OR pcsapellido IS NULL THEN
        vctempMensaje:=CONCAT('Segundo Apellido, ',vctempMensaje);
    END IF;
    
    IF pcdireccion='' OR pcdireccion IS NULL THEN
        vctempMensaje:=CONCAT('Direccion, ',vctempMensaje);
    END IF;

    IF pccorreo='' OR pccorreo IS NULL THEN
        vctempMensaje:=CONCAT('Correo, ',vctempMensaje);
    END IF;

    IF pcNoIdentidad='' OR pcNoIdentidad IS NULL THEN
        vctempMensaje:=CONCAT('NO. identidad, ',vctempMensaje);
    END IF;

    IF pcAccion='' OR pcAccion IS NULL THEN
        vctempMensaje:=CONCAT('ACCION, ',vctempMensaje);
    END IF;

    IF vctempMensaje<>'' THEN
        pcmensajeError:=CONCAT('CAMPOS REQUERIDOS: ',vctempMensaje);
        pbocurreError:=1;
    END IF;

    
    IF pcAccion='AGREGAR' OR pcAccion='agregar' THEN
        pcmensajeError:='';

        SELECT COUNT(*) INTO vnconteo FROM Persona per
        WHERE per.NoIdentidad=pcNoIdentidad

        IF vnconteo>0 THEN
            pcmensajeError:='YA EXISTE UNA PERSONA CON ESTE NUMERO DE IDENTIDAD';
            pbocurreError:=1;
            RETURN;
        END IF;

        INSERT INTO Persona(pnombre,snombre,papellido,sapellido,direccion,correo,NoIdentidad)
        VALUES(pcpnombre,pcsnombre,pcpapellido,pcsapellido,pcdireccion,pccorreo,pcNoIdentidad);

        DECLARE vnPersona INT;

        SELECT MAX(per.idPersona) INTO vnPersona FROM Persona

        INSERT INTO Empleado(FechaIngreso,Persona_idPersona)
        VALUES(CURRENT_DATE FROM DUAL,vnPersona);

        pcmensajeError:='EMPLEADO REGISTRADO Exitosamente';
        pbocurreError:=0;
        RETURN;

    END IF;

    IF pcAccion='EDITAR' or pcAccion='editar' THEN
        
    END IF;    

    

END

