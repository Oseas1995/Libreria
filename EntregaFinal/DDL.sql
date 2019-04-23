

CREATE TABLE autor (
    idautor             INTEGER NOT NULL,
    persona_idpersona   INTEGER NOT NULL
);

CREATE UNIQUE INDEX autor__idx ON
    autor (
        persona_idpersona
    ASC );

ALTER TABLE autor ADD CONSTRAINT autor_pk PRIMARY KEY ( idautor );

CREATE TABLE autoreslibros (
    idautoreslibros   INTEGER NOT NULL,
    autor_idautor     INTEGER NOT NULL,
    libro_idlibro     INTEGER NOT NULL
);

ALTER TABLE autoreslibros ADD CONSTRAINT AutoresLibros_PK PRIMARY KEY ( idautoreslibros );

CREATE TABLE bodega (
    idbodega   INTEGER NOT NULL,
    nombre     VARCHAR2(45)
);

ALTER TABLE bodega ADD CONSTRAINT bodega_pk PRIMARY KEY ( idbodega );

CREATE TABLE cargo (
    idcargo       INTEGER NOT NULL,
    descripcion   VARCHAR2(45)
);

ALTER TABLE cargo ADD CONSTRAINT cargo_pk PRIMARY KEY ( idcargo );

CREATE TABLE categoria (
    idcategoria   INTEGER NOT NULL,
    descripcion   VARCHAR2(45)
);

ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY ( idcategoria );

CREATE TABLE cliente (
    idcliente           INTEGER NOT NULL,
    fechaingreso        DATE,
    persona_idpersona   INTEGER NOT NULL
);

CREATE UNIQUE INDEX cliente__idx ON
    cliente (
        persona_idpersona
    ASC );

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( idcliente );

CREATE TABLE cubiculo (
    idcubiculo          INTEGER NOT NULL,
    descripcion         VARCHAR2(45),
    estante_idestante   INTEGER NOT NULL
);

ALTER TABLE cubiculo ADD CONSTRAINT cubiculo_pk PRIMARY KEY ( idcubiculo );

CREATE TABLE descuento (
    iddescuento           INTEGER NOT NULL,
    porcentajedescuento   FLOAT,
    descripcion           VARCHAR2(45)
);

ALTER TABLE descuento ADD CONSTRAINT descuento_pk PRIMARY KEY ( iddescuento );

CREATE TABLE detallefactura (
    iddetallefactura    INTEGER NOT NULL,
    cantidad            INTEGER,
    factura_idfactura   INTEGER NOT NULL,
    libro_idlibro       INTEGER NOT NULL
);

ALTER TABLE detallefactura ADD CONSTRAINT detallefactura_pk PRIMARY KEY ( iddetallefactura );

CREATE TABLE edicion (
    idedicion          INTEGER NOT NULL,
    descripcion        VARCHAR2(45),
    fechapublicacion   DATE,
    libro_idlibro      INTEGER NOT NULL
);

ALTER TABLE edicion ADD CONSTRAINT edicion_pk PRIMARY KEY ( idedicion );

CREATE TABLE editorial (
    ideditorial   INTEGER NOT NULL,
    nombre        VARCHAR2(45),
    correo        VARCHAR2(45),
    direccion     VARCHAR2(45)
);

ALTER TABLE editorial ADD CONSTRAINT editorial_pk PRIMARY KEY ( ideditorial );

CREATE TABLE empleado (
    idempleado          INTEGER NOT NULL,
    fechaingreso        DATE,
    persona_idpersona   INTEGER NOT NULL
);

CREATE UNIQUE INDEX empleado__idx ON
    empleado (
        persona_idpersona
    ASC );

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( idempleado );

CREATE TABLE empleadocargo (
    idempleadocargo       INTEGER NOT NULL,
    fechanombramiento     DATE,
    fechafin              DATE,
    empleado_idempleado   INTEGER NOT NULL,
    cargo_idcargo         INTEGER NOT NULL
);

ALTER TABLE empleadocargo ADD CONSTRAINT EmpleadoCargo_PK PRIMARY KEY ( idempleadocargo );

CREATE TABLE estante (
    idestante           INTEGER NOT NULL,
    descripcion         VARCHAR2(45),
    pasillo_idpasillo   INTEGER NOT NULL
);

ALTER TABLE estante ADD CONSTRAINT estante_pk PRIMARY KEY ( idestante );

CREATE TABLE factura (
    idfactura                       INTEGER NOT NULL,
    fecharegistro                   DATE,
    tipoobtencion_idtipoobtencion   INTEGER NOT NULL,
    cliente_idcliente               INTEGER NOT NULL,
    pago_idpago                     INTEGER NOT NULL
);

CREATE UNIQUE INDEX factura__idx ON
    factura (
        pago_idpago
    ASC );

ALTER TABLE factura ADD CONSTRAINT factura_pk PRIMARY KEY ( idfactura );

CREATE TABLE genero (
    idgenero      INTEGER NOT NULL,
    descripcion   VARCHAR2(45)
);

ALTER TABLE genero ADD CONSTRAINT genero_pk PRIMARY KEY ( idgenero );

CREATE TABLE generoslibros (
    idgeneroslibros   INTEGER NOT NULL,
    libro_idlibro     INTEGER NOT NULL,
    genero_idgenero   INTEGER NOT NULL
);

ALTER TABLE generoslibros ADD CONSTRAINT GenerosLibros_PK PRIMARY KEY ( idgeneroslibros );

CREATE TABLE idioma (
    ididioma      INTEGER NOT NULL,
    descripcion   VARCHAR2(45)
);

ALTER TABLE idioma ADD CONSTRAINT idioma_pk PRIMARY KEY ( ididioma );

CREATE TABLE libedit (
    idlibedit               INTEGER NOT NULL,
    editorial_ideditorial   INTEGER NOT NULL,
    libro_idlibro           INTEGER NOT NULL
);

ALTER TABLE libedit ADD CONSTRAINT LibEdit_PK PRIMARY KEY ( idlibedit );

CREATE TABLE libreria (
    idlibreria   INTEGER NOT NULL,
    nombre       VARCHAR2(45),
    direccion    VARCHAR2(45),
    rtn          VARCHAR2(45),
    telefono     VARCHAR2(20)
);

ALTER TABLE libreria ADD CONSTRAINT libreria_pk PRIMARY KEY ( idlibreria );

CREATE TABLE libro (
    idlibro                 INTEGER NOT NULL,
    nombre                  VARCHAR2(45),
    aniopublicacion         INTEGER,
    categoria_idcategoria   INTEGER NOT NULL,
    idioma_ididioma         INTEGER NOT NULL,
    preciocosto             FLOAT,
    precioventa             FLOAT
);

ALTER TABLE libro ADD CONSTRAINT libro_pk PRIMARY KEY ( idlibro );

CREATE TABLE mora (
    idmora        INTEGER NOT NULL,
    montomora     FLOAT,
    descripcion   VARCHAR2(45),
    pago_idpago   INTEGER NOT NULL
);

ALTER TABLE mora ADD CONSTRAINT mora_pk PRIMARY KEY ( idmora );

CREATE TABLE pago (
    idpago                  INTEGER NOT NULL,
    montopagar              FLOAT,
    fechahora               DATE,
    prestamo_idprestamo     INTEGER,
    descuento_iddescuento   INTEGER,
    tipopago_idtipopago     INTEGER NOT NULL
);

ALTER TABLE pago ADD CONSTRAINT pago_pk PRIMARY KEY ( idpago );

CREATE TABLE pasillo (
    idpasillo         INTEGER NOT NULL,
    descripcion       VARCHAR2(45),
    bodega_idbodega   INTEGER NOT NULL
);

ALTER TABLE pasillo ADD CONSTRAINT pasillo_pk PRIMARY KEY ( idpasillo );

CREATE TABLE persona (
    idpersona     INTEGER NOT NULL,
    pnombre       VARCHAR2(45),
    snombre       VARCHAR2(45),
    papellido     VARCHAR2(45),
    sapellido     VARCHAR2(45),
    direccion     VARCHAR2(45),
    correo        VARCHAR2(45),
    noidentidad   VARCHAR2(30)
);

ALTER TABLE persona ADD CONSTRAINT persona_pk PRIMARY KEY ( idpersona );

CREATE TABLE posicionlibro (
    idposicionlibro       INTEGER NOT NULL,
    descripcion           VARCHAR2(45),
    cubiculo_idcubiculo   INTEGER NOT NULL,
    libro_idlibro         INTEGER NOT NULL
);

CREATE UNIQUE INDEX posicionlibro__idx ON
    posicionlibro (
        libro_idlibro
    ASC );

ALTER TABLE posicionlibro ADD CONSTRAINT posicionlibro_pk PRIMARY KEY ( idposicionlibro );

CREATE TABLE prestamo (
    idprestamo    INTEGER NOT NULL,
    fechainicio   DATE,
    fechamax      DATE
);

ALTER TABLE prestamo ADD CONSTRAINT prestamo_pk PRIMARY KEY ( idprestamo );

CREATE TABLE proveedor (
    idproveedor                     INTEGER NOT NULL,
    direccion                       VARCHAR2(45),
    correo                          VARCHAR2(45),
    telefono                        VARCHAR2(45),
    descripcion                     VARCHAR2(45),
    nombre                          VARCHAR2(45),
    tipoproveedor_idtipoproveedor   INTEGER NOT NULL
);

ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY ( idproveedor );

CREATE TABLE provlib (
    idprovlib               INTEGER NOT NULL,
    cantidad                INTEGER,
    proveedor_idproveedor   INTEGER NOT NULL,
    libro_idlibro           INTEGER NOT NULL
);

ALTER TABLE provlib ADD CONSTRAINT ProvLib_PK PRIMARY KEY ( idprovlib );

CREATE TABLE provpv (
    idprovpv                INTEGER NOT NULL,
    cantidad                INTEGER,
    proveedor_idproveedor   INTEGER NOT NULL,
    pvarios_idpvarios       INTEGER NOT NULL
);

ALTER TABLE provpv ADD CONSTRAINT Provpv_PK PRIMARY KEY ( idprovpv );

CREATE TABLE pvarios (
    idpvarios     INTEGER NOT NULL,
    descripcion   VARCHAR2(45)
);

ALTER TABLE pvarios ADD CONSTRAINT productosvarios_pk PRIMARY KEY ( idpvarios );

CREATE TABLE sucursal (
    idsucursal            INTEGER NOT NULL,
    nombre                VARCHAR2(45),
    direccion             VARCHAR2(45),
    telefono              VARCHAR2(20),
    bodega_idbodega       INTEGER NOT NULL,
    libreria_idlibreria   INTEGER NOT NULL
);

CREATE UNIQUE INDEX sucursal__idx ON
    sucursal (
        bodega_idbodega
    ASC );

ALTER TABLE sucursal ADD CONSTRAINT sucursal_pk PRIMARY KEY ( idsucursal );

CREATE TABLE sucursalempleado (
    idsucursalempleado    INTEGER NOT NULL,
    fechainicio           DATE,
    fechafin              DATE,
    sucursal_idsucursal   INTEGER NOT NULL,
    empleado_idempleado   INTEGER NOT NULL
);

ALTER TABLE sucursalempleado ADD CONSTRAINT SucursalEmpleado_PK PRIMARY KEY ( idsucursalempleado );

CREATE TABLE telefono (
    idtelefono          INTEGER NOT NULL,
    numero              VARCHAR2(20),
    persona_idpersona   INTEGER NOT NULL
);

ALTER TABLE telefono ADD CONSTRAINT telefono_pk PRIMARY KEY ( idtelefono );

CREATE TABLE tipoobtencion (
    idtipoobtencion   INTEGER NOT NULL,
    descripcion       VARCHAR2(45)
);

ALTER TABLE tipoobtencion ADD CONSTRAINT tipoobtencion_pk PRIMARY KEY ( idtipoobtencion );

CREATE TABLE tipopago (
    idtipopago    INTEGER NOT NULL,
    descripcion   VARCHAR2(45)
);

ALTER TABLE tipopago ADD CONSTRAINT tipopago_pk PRIMARY KEY ( idtipopago );

CREATE TABLE tipoproveedor (
    idtipoproveedor   INTEGER NOT NULL,
    descripcion       VARCHAR2(45)
);

ALTER TABLE tipoproveedor ADD CONSTRAINT tipoproveedor_pk PRIMARY KEY ( idtipoproveedor );

ALTER TABLE autor
    ADD CONSTRAINT autor_persona_fk FOREIGN KEY ( persona_idpersona )
        REFERENCES persona ( idpersona )
        ON DELETE CASCADE;

ALTER TABLE autoreslibros
    ADD CONSTRAINT autoreslibros_autor_fk FOREIGN KEY ( autor_idautor )
        REFERENCES autor ( idautor )
        ON DELETE CASCADE;

ALTER TABLE autoreslibros
    ADD CONSTRAINT autoreslibros_libro_fk FOREIGN KEY ( libro_idlibro )
        REFERENCES libro ( idlibro )
        ON DELETE CASCADE;

ALTER TABLE cliente
    ADD CONSTRAINT cliente_persona_fk FOREIGN KEY ( persona_idpersona )
        REFERENCES persona ( idpersona )
        ON DELETE CASCADE;

ALTER TABLE cubiculo
    ADD CONSTRAINT cubiculo_estante_fk FOREIGN KEY ( estante_idestante )
        REFERENCES estante ( idestante )
        ON DELETE CASCADE;

ALTER TABLE detallefactura
    ADD CONSTRAINT detallefactura_factura_fk FOREIGN KEY ( factura_idfactura )
        REFERENCES factura ( idfactura )
        ON DELETE CASCADE;

ALTER TABLE detallefactura
    ADD CONSTRAINT detallefactura_libro_fk FOREIGN KEY ( libro_idlibro )
        REFERENCES libro ( idlibro )
        ON DELETE CASCADE;

ALTER TABLE edicion
    ADD CONSTRAINT edicion_libro_fk FOREIGN KEY ( libro_idlibro )
        REFERENCES libro ( idlibro )
        ON DELETE CASCADE;

ALTER TABLE empleado
    ADD CONSTRAINT empleado_persona_fk FOREIGN KEY ( persona_idpersona )
        REFERENCES persona ( idpersona )
        ON DELETE CASCADE;

ALTER TABLE empleadocargo
    ADD CONSTRAINT EmpleadoCargo_Cargo_FK FOREIGN KEY ( cargo_idcargo )
        REFERENCES cargo ( idcargo )
        ON DELETE CASCADE;

ALTER TABLE empleadocargo
    ADD CONSTRAINT EmpleadoCargo_Empleado_FK FOREIGN KEY ( empleado_idempleado )
        REFERENCES empleado ( idempleado )
        ON DELETE CASCADE;

ALTER TABLE estante
    ADD CONSTRAINT estante_pasillo_fk FOREIGN KEY ( pasillo_idpasillo )
        REFERENCES pasillo ( idpasillo )
        ON DELETE CASCADE;

ALTER TABLE factura
    ADD CONSTRAINT factura_cliente_fk FOREIGN KEY ( cliente_idcliente )
        REFERENCES cliente ( idcliente )
        ON DELETE CASCADE;

ALTER TABLE factura
    ADD CONSTRAINT factura_pago_fk FOREIGN KEY ( pago_idpago )
        REFERENCES pago ( idpago )
        ON DELETE CASCADE;

ALTER TABLE factura
    ADD CONSTRAINT factura_tipoobtencion_fk FOREIGN KEY ( tipoobtencion_idtipoobtencion )
        REFERENCES tipoobtencion ( idtipoobtencion )
        ON DELETE CASCADE;

ALTER TABLE generoslibros
    ADD CONSTRAINT generoslibros_genero_fk FOREIGN KEY ( genero_idgenero )
        REFERENCES genero ( idgenero )
        ON DELETE CASCADE;

ALTER TABLE generoslibros
    ADD CONSTRAINT generoslibros_libro_fk FOREIGN KEY ( libro_idlibro )
        REFERENCES libro ( idlibro )
        ON DELETE CASCADE;

ALTER TABLE libedit
    ADD CONSTRAINT libedit_editorial_fk FOREIGN KEY ( editorial_ideditorial )
        REFERENCES editorial ( ideditorial )
        ON DELETE CASCADE;

ALTER TABLE libedit
    ADD CONSTRAINT libedit_libro_fk FOREIGN KEY ( libro_idlibro )
        REFERENCES libro ( idlibro )
        ON DELETE CASCADE;

ALTER TABLE libro
    ADD CONSTRAINT libro_categoria_fk FOREIGN KEY ( categoria_idcategoria )
        REFERENCES categoria ( idcategoria )
        ON DELETE CASCADE;

ALTER TABLE libro
    ADD CONSTRAINT libro_idioma_fk FOREIGN KEY ( idioma_ididioma )
        REFERENCES idioma ( ididioma )
        ON DELETE CASCADE;

ALTER TABLE mora
    ADD CONSTRAINT mora_pago_fk FOREIGN KEY ( pago_idpago )
        REFERENCES pago ( idpago )
        ON DELETE CASCADE;

ALTER TABLE pago
    ADD CONSTRAINT pago_descuento_fk FOREIGN KEY ( descuento_iddescuento )
        REFERENCES descuento ( iddescuento )
        ON DELETE CASCADE;

ALTER TABLE pago
    ADD CONSTRAINT pago_prestamo_fk FOREIGN KEY ( prestamo_idprestamo )
        REFERENCES prestamo ( idprestamo )
        ON DELETE CASCADE;

ALTER TABLE pago
    ADD CONSTRAINT pago_tipopago_fk FOREIGN KEY ( tipopago_idtipopago )
        REFERENCES tipopago ( idtipopago )
        ON DELETE CASCADE;

ALTER TABLE pasillo
    ADD CONSTRAINT pasillo_bodega_fk FOREIGN KEY ( bodega_idbodega )
        REFERENCES bodega ( idbodega )
        ON DELETE CASCADE;

ALTER TABLE posicionlibro
    ADD CONSTRAINT posicionlibro_cubiculo_fk FOREIGN KEY ( cubiculo_idcubiculo )
        REFERENCES cubiculo ( idcubiculo )
        ON DELETE CASCADE;

ALTER TABLE posicionlibro
    ADD CONSTRAINT posicionlibro_libro_fk FOREIGN KEY ( libro_idlibro )
        REFERENCES libro ( idlibro )
        ON DELETE CASCADE;

ALTER TABLE proveedor
    ADD CONSTRAINT proveedor_tipoproveedor_fk FOREIGN KEY ( tipoproveedor_idtipoproveedor )
        REFERENCES tipoproveedor ( idtipoproveedor );

ALTER TABLE provlib
    ADD CONSTRAINT provlib_libro_fk FOREIGN KEY ( libro_idlibro )
        REFERENCES libro ( idlibro )
        ON DELETE CASCADE;

ALTER TABLE provlib
    ADD CONSTRAINT provlib_proveedor_fk FOREIGN KEY ( proveedor_idproveedor )
        REFERENCES proveedor ( idproveedor )
        ON DELETE CASCADE;

ALTER TABLE provpv
    ADD CONSTRAINT provpv_productosvarios_fk FOREIGN KEY ( pvarios_idpvarios )
        REFERENCES pvarios ( idpvarios )
        ON DELETE CASCADE;

ALTER TABLE provpv
    ADD CONSTRAINT provpv_proveedor_fk FOREIGN KEY ( proveedor_idproveedor )
        REFERENCES proveedor ( idproveedor )
        ON DELETE CASCADE;

ALTER TABLE sucursal
    ADD CONSTRAINT sucursal_bodega_fk FOREIGN KEY ( bodega_idbodega )
        REFERENCES bodega ( idbodega )
        ON DELETE CASCADE;

ALTER TABLE sucursal
    ADD CONSTRAINT sucursal_libreria_fk FOREIGN KEY ( libreria_idlibreria )
        REFERENCES libreria ( idlibreria )
        ON DELETE CASCADE;

ALTER TABLE sucursalempleado
    ADD CONSTRAINT sucursalempleado_empleado_fk FOREIGN KEY ( empleado_idempleado )
        REFERENCES empleado ( idempleado )
        ON DELETE CASCADE;

ALTER TABLE sucursalempleado
    ADD CONSTRAINT sucursalempleado_sucursal_fk FOREIGN KEY ( sucursal_idsucursal )
        REFERENCES sucursal ( idsucursal )
        ON DELETE CASCADE;

ALTER TABLE telefono
    ADD CONSTRAINT telefono_persona_fk FOREIGN KEY ( persona_idpersona )
        REFERENCES persona ( idpersona )
        ON DELETE CASCADE;



ALTER TABLE Libro
ADD Existencia INTEGER;

ALTER TABLE PVarios
ADD Existencia INTEGER;


-- Informe de Resumen de Oracle SQL Developer Data Modeler:
--
-- CREATE TABLE                            37
-- CREATE INDEX                             6
-- ALTER TABLE                             75
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
--
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
--
-- REDACTION POLICY                         0
--
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
--
-- ERRORS                                   0
-- WARNINGS                                 0
