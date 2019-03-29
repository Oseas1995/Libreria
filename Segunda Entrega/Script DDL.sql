-- Generado por Oracle SQL Developer Data Modeler 18.4.0.339.1532
--   en:        2019-03-27 19:42:41 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE autor (
    idautor             INTEGER NOT NULL, --NOT NULL
    persona_idpersona   INTEGER NOT NULL  --NOT NULL llave foranea de persona
);

CREATE UNIQUE INDEX autor__idx ON
    autor (
        persona_idpersona
    ASC );

ALTER TABLE autor ADD CONSTRAINT autor_pk PRIMARY KEY ( idautor );

CREATE TABLE "Autores/Libros" (
    "idAutores/Libros"   INTEGER NOT NULL, --NOT NULL llave primaria
    autor_idautor        INTEGER NOT NULL, --NOT NULL   llave foranea de autor
    libro_idlibro        INTEGER NOT NULL --NOT NULL llave foranea de libro
);

ALTER TABLE "Autores/Libros" ADD CONSTRAINT "Autores/Libros_PK" PRIMARY KEY ( "idAutores/Libros" );

CREATE TABLE bodega (
    idbodega   INTEGER NOT NULL, --NOT NULL llave primaria de bodega 
    nombre     VARCHAR2(45) ----NULL nombre de la bodega
);

ALTER TABLE bodega ADD CONSTRAINT bodega_pk PRIMARY KEY ( idbodega );

CREATE TABLE cargo (
    idcargo       INTEGER NOT NULL, --NOT NULL  llave primaria de cargo
    descripcion   VARCHAR2(45)  --NULL descripcion de cargo  
);

ALTER TABLE cargo ADD CONSTRAINT cargo_pk PRIMARY KEY ( idcargo );

CREATE TABLE categoria (
    idcategoria   INTEGER NOT NULL, --NOT NULL  lalve primaria de categoria
    descripcion   VARCHAR2(45)  --NULL  descripcion de la categoria
);

ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY ( idcategoria );

CREATE TABLE cliente (
    idcliente           INTEGER NOT NULL, --NOT NULL    llave primaria de cliente
    fechaingreso        DATE,   --NOT NULL  fecha de ingreso del cliente
    persona_idpersona   INTEGER NOT NULL --NOT NULL llave foranea de persona
);

CREATE UNIQUE INDEX cliente__idx ON
    cliente (
        persona_idpersona
    ASC );

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( idcliente );

CREATE TABLE cubiculo (
    idcubiculo          INTEGER NOT NULL, --NOT NULL    llave primaria de cubiculo
    descripcion         VARCHAR2(45), --NOT NULL    descripcion del cubiculo o su nombre
    estante_idestante   INTEGER NOT NULL --NOT NULL llave foranea del estante
);

ALTER TABLE cubiculo ADD CONSTRAINT cubiculo_pk PRIMARY KEY ( idcubiculo );

CREATE TABLE descuento (
    iddescuento           INTEGER NOT NULL, --NOT NULL  llave primaria de descuento
    porcentajedescuento   FLOAT,   --NULL   porcentaje de descuento
    descripcion           VARCHAR2(45) --Null descripcion del descuento o su nombre
);

ALTER TABLE descuento ADD CONSTRAINT descuento_pk PRIMARY KEY ( iddescuento );

CREATE TABLE detallefactura (
    iddetallefactura    INTEGER NOT NULL, --NOT NULL    llave primaria de detalleFactura
    cantidad            INTEGER,   ----NOT NULL cantidad de productos
    factura_idfactura   INTEGER NOT NULL,   --NOT NULL llave foranea de factura
    libro_idlibro       INTEGER NOT NULL    --NOT NULL llave foranea de libro
);

ALTER TABLE detallefactura ADD CONSTRAINT detallefactura_pk PRIMARY KEY ( iddetallefactura );

CREATE TABLE edicion (
    idedicion          INTEGER NOT NULL, --NOT NULL llave primaria de edicion
    descripcion        VARCHAR2(45),   --NOT NULL descripcion de la edicion
    fechapublicacion   DATE,    --NOT NULL fecha en la que fue publicada esa edicion
    libro_idlibro      INTEGER NOT NULL   --NOT NULL    llave foranea de libro
);

ALTER TABLE edicion ADD CONSTRAINT edicion_pk PRIMARY KEY ( idedicion );

CREATE TABLE editorial (
    ideditorial   INTEGER NOT NULL,  --NOT NULL     llave primaria de editorial
    nombre        VARCHAR2(45),     --NOT NULL      nombre de la editorial
    correo        VARCHAR2(45),     --NOT NULL      correo de la editorial
    direccion     VARCHAR2(45)      --NOT NULL      direccion de la editorial
);

ALTER TABLE editorial ADD CONSTRAINT editorial_pk PRIMARY KEY ( ideditorial );

CREATE TABLE empleado (
    idempleado                      INTEGER NOT NULL,       --NOT NULL      llave primaria de empleado
    fechaingreso                    DATE,                   --NOT NULL      fecha ingreso del empleado
    persona_idpersona               INTEGER NOT NULL,       --NOT NULL      llave foranea de persona
    jefeinmediato_idjefeinmediato   INTEGER NOT NULL        --NOT NULL      llave foranea de jefe inmediato
);

CREATE UNIQUE INDEX empleado__idx ON
    empleado (
        persona_idpersona
    ASC );

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( idempleado );

CREATE TABLE "Empleado/Cargo" (
    "idEmpleado/cargo"    INTEGER NOT NULL,     --NOT NULL      llave primaria de Empleado/CARGO
    fechanombramiento     DATE,                 --NOT NULL      fecha de nombramiento a dicho cargo
    fechafin              DATE,                 --NOT NULL      fecha final del cargo
    empleado_idempleado   INTEGER NOT NULL,     --NOT NULL      llave foranea del empleado
    cargo_idcargo         INTEGER NOT NULL      --NOT NULL      lalve foranea del cargo
);

ALTER TABLE "Empleado/Cargo" ADD CONSTRAINT "Empleado/Cargo_PK" PRIMARY KEY ( "idEmpleado/cargo" );

CREATE TABLE estante (
    idestante           INTEGER NOT NULL,       --NOT NULL      llave primaria de estante
    descripcion         VARCHAR2(45),           --NOT NULL      descripcion del estante o nombre
    pasillo_idpasillo   INTEGER NOT NULL        --NOT NULL      llave foranea del pasillo
);

ALTER TABLE estante ADD CONSTRAINT estante_pk PRIMARY KEY ( idestante );

CREATE TABLE factura (
    idfactura                       INTEGER NOT NULL,       --NOT NULL      llave primaria de factura
    fecharegistro                   DATE,                   --NOT NULL      fecha de registro
    tipoobtencion_idtipoobtencion   INTEGER NOT NULL,       --NOT NULL      llave foranea del tipo de obtencion 
    cliente_idcliente               INTEGER NOT NULL,       --NOT NULL      llave foranea de cliente
    pago_idpago                     INTEGER NOT NULL        --NOT NULL      llave foranea del pago
);

CREATE UNIQUE INDEX factura__idx ON
    factura (
        pago_idpago
    ASC );

ALTER TABLE factura ADD CONSTRAINT factura_pk PRIMARY KEY ( idfactura );

CREATE TABLE genero (
    idgenero      INTEGER NOT NULL,     --NOT NULL lalve primaria de genero
    descripcion   VARCHAR2(45)          --NOT NULL descripcion del genero
);

ALTER TABLE genero ADD CONSTRAINT genero_pk PRIMARY KEY ( idgenero );

CREATE TABLE "Generos/Libros" (
    "idGeneros/Libros"   INTEGER NOT NULL,      --NOT NULL      llave primaria
    libro_idlibro        INTEGER NOT NULL,      --NOT NULL      llave foranea de libro
    genero_idgenero      INTEGER NOT NULL       --NOT NULL      lalve foranea del genero
);

ALTER TABLE "Generos/Libros" ADD CONSTRAINT "Generos/Libros_PK" PRIMARY KEY ( "idGeneros/Libros" );

CREATE TABLE idioma (
    ididioma      INTEGER NOT NULL,             --NOT NULL      llave primaria de idioma
    descripcion   VARCHAR2(45)                  --NOT NULL      descripcion del idioma
);

ALTER TABLE idioma ADD CONSTRAINT idioma_pk PRIMARY KEY ( ididioma );

CREATE TABLE jefeinmediato (
    idjefeinmediato       INTEGER NOT NULL,     --NOT NULL      llave primaria de jefeinmediato
    empleado_idempleado   INTEGER NOT NULL      --NOT NULL      lalve foranea de empleado
);

CREATE UNIQUE INDEX jefeinmediato__idx ON
    jefeinmediato (
        empleado_idempleado
    ASC );

ALTER TABLE jefeinmediato ADD CONSTRAINT jefeinmediato_pk PRIMARY KEY ( idjefeinmediato );

CREATE TABLE "Lib/Edit" (
    "idLib/Edit"            INTEGER NOT NULL,   --NOT NULL      llave primaria de lib/edit
    editorial_ideditorial   INTEGER NOT NULL,   --NOT NULL      llave foranea de editorial
    libro_idlibro           INTEGER NOT NULL    --NOT NULL      llave foranea de libro
);

ALTER TABLE "Lib/Edit" ADD CONSTRAINT "Lib/Edit_PK" PRIMARY KEY ( "idLib/Edit" );

CREATE TABLE libreria (
    idlibreria   INTEGER NOT NULL,      --NOT NULL      llave primaria de libreria
    nombre       VARCHAR2(45),          --NOT NULL      nombre de libreria
    direccion    VARCHAR2(45),          --NOT NULL      direccion de libreria
    rtn          VARCHAR2(45),          --NOT NULL      RTN de la libreria
    telefono     VARCHAR2(20)           --NOT NULL      telefono de la libreria unico
);

ALTER TABLE libreria ADD CONSTRAINT libreria_pk PRIMARY KEY ( idlibreria );

CREATE TABLE libro (
    idlibro                 INTEGER NOT NULL,   ----NOT NULL       llave primaria de libro
    nombre                  VARCHAR2(45),       --NOT NULL      nombre de la libreria
    aniopublicacion         INTEGER,            --NOT NULL      año de publicacion del libro
    categoria_idcategoria   INTEGER NOT NULL,   --NOT NULL      llave foranea de categoria
    idioma_ididioma         INTEGER NOT NULL    --NOT NULL      llave foranea de idioma
);

ALTER TABLE libro ADD CONSTRAINT libro_pk PRIMARY KEY ( idlibro );

CREATE TABLE mora (
    idmora        INTEGER NOT NULL, --NOT NULL      llave primaria
    montomora     FLOAT,            --NOT NULL      monto de la mora
    descripcion   VARCHAR2(45),     --NOT NULL      descripcion de la mora
    pago_idpago   INTEGER NOT NULL  --NOT NULL      llave foranea del pago
);

ALTER TABLE mora ADD CONSTRAINT mora_pk PRIMARY KEY ( idmora );

CREATE TABLE pago (
    idpago                  INTEGER NOT NULL,   --NOT NULL      llave primaria de pago
    montopagar              FLOAT,              --NOT NULL      monto a pagar
    fechahora               DATE,               --NOT NULL      fecha y hora del pago
    prestamo_idprestamo     INTEGER,            --NOT NULL      llave foranea del prestamo
    descuento_iddescuento   INTEGER,            --NOT NULL      llave foranea del descuento
    tipopago_idtipopago     INTEGER NOT NULL    --NOT NULL      lalve foranea del tipo de pago
);

ALTER TABLE pago ADD CONSTRAINT pago_pk PRIMARY KEY ( idpago );

CREATE TABLE pasillo (
    idpasillo         INTEGER NOT NULL, --NOT NULL  llave primaria
    descripcion       VARCHAR2(45),     --NOT NULL      descripcon del pasillo
    bodega_idbodega   INTEGER NOT NULL  --NOT NULL      llave foranea de la bodega
);

ALTER TABLE pasillo ADD CONSTRAINT pasillo_pk PRIMARY KEY ( idpasillo );

CREATE TABLE persona (
    idpersona   INTEGER NOT NULL,       --NOT NULL llave primaria de persona
    pnombre     VARCHAR2(45),           --NOT NULL primer nombre
    snombre     VARCHAR2(45),           --NOT NULL segundo nombre
    papellido   VARCHAR2(45),           --NOT NULL primer apellido
    sapellido   VARCHAR2(45),           --NOT NULL segundo apellido
    direccion   VARCHAR2(45),           --NOT NULL direccion
    correo      VARCHAR2(45)            --NOT NULL correo
);

ALTER TABLE persona ADD CONSTRAINT persona_pk PRIMARY KEY ( idpersona );

CREATE TABLE posicionlibro (
    idposicionlibro       INTEGER NOT NULL,     --NOT NULL      llave primaria de la posicion libro
    descripcion           VARCHAR2(45),         --NOT NULL      descripcion o nombre
    cubiculo_idcubiculo   INTEGER NOT NULL,     --NOT NULL      llave foranea del cubiculo
    libro_idlibro         INTEGER NOT NULL      --NOT NULL      llave foranea del libro
);

CREATE UNIQUE INDEX posicionlibro__idx ON
    posicionlibro (
        libro_idlibro
    ASC );

ALTER TABLE posicionlibro ADD CONSTRAINT posicionlibro_pk PRIMARY KEY ( idposicionlibro );

CREATE TABLE prestamo (
    idprestamo    INTEGER NOT NULL,     --NOT NULL      llave primaria del prestamo
    fechainicio   DATE,                 --NOT NULL      fecha de inicio de prestamo
    fechamax      DATE                  --NOT NULL      fecha maxima de prestamo
);

ALTER TABLE prestamo ADD CONSTRAINT prestamo_pk PRIMARY KEY ( idprestamo );

CREATE TABLE "Prov/Lib" (
    "idProv/Lib"            INTEGER NOT NULL,   --NOT NULL  llave primaria
    cantidad                INTEGER,            --NOT NULL  cantidad de productos
    proveedor_idproveedor   INTEGER NOT NULL,   --NOT NULL  llave foranea del proveedor    
    libro_idlibro           INTEGER NOT NULL    --NOT NULL  llave foranea del libro
);

ALTER TABLE "Prov/Lib" ADD CONSTRAINT "Prov/Lib_PK" PRIMARY KEY ( "idProv/Lib" );

CREATE TABLE "Prov/pv" (
    "idProv/pv"             INTEGER NOT NULL,     --NOT NULL lalve primaria de prov/pv
    cantidad                INTEGER,              --cantidad
    proveedor_idproveedor   INTEGER NOT NULL,     ----NOT NULL llave foranea de proveedor
    pvarios_idpvarios       INTEGER NOT NULL        --NOT NULL llave foranea de pvarios
);

ALTER TABLE "Prov/pv" ADD CONSTRAINT "Prov/pv_PK" PRIMARY KEY ( "idProv/pv" );

CREATE TABLE proveedor (
    idproveedor                     INTEGER NOT NULL,   --NOT NULL  llave primaria de proveedor
    direccion                       VARCHAR2(45),       --NOT NULL  direccion de proveedor
    correo                          VARCHAR2(45),       --NOT NULL  correo del proveedor
    telefono                        VARCHAR2(45),       --NOT NULL  telefono del proveedor unico
    descripcion                     VARCHAR2(45),       --NOT NULL  descripcion del proveedor
    nombre                          VARCHAR2(45),       --NOT NULL  nombre del proveedor
    tipoproveedor_idtipoproveedor   INTEGER NOT NULL    --NOT NULL  lalve foranea de tipo proveedor
);

ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY ( idproveedor );

CREATE TABLE pvarios (
    idpvarios     INTEGER NOT NULL,     --NOT NULL  llave primaria
    descripcion   VARCHAR2(45)          --NOT NULL  descripcion de productos varios
);

ALTER TABLE pvarios ADD CONSTRAINT productosvarios_pk PRIMARY KEY ( idpvarios );

CREATE TABLE sucursal (
    idsucursal            INTEGER NOT NULL,     --NOT NULL llave primaria de sucursal
    nombre                VARCHAR2(45),         --NOT NULL  nombre de sucursal
    direccion             VARCHAR2(45),         --NOT NULL      direccion de sucursal
    telefono              VARCHAR2(20),         --NOT NULL  telefono de sucursal unico
    bodega_idbodega       INTEGER NOT NULL,     --NOT NULL  llave foranea de bodega
    libreria_idlibreria   INTEGER NOT NULL      --NOT NULL  llave foranea de libreria
);

CREATE UNIQUE INDEX sucursal__idx ON
    sucursal (
        bodega_idbodega
    ASC );

ALTER TABLE sucursal ADD CONSTRAINT sucursal_pk PRIMARY KEY ( idsucursal );

CREATE TABLE "Sucursal/Empleado" (
    "idSucursal/Empleado"   INTEGER NOT NULL,   --NOT NULL  lalve primaria sucursal/empleado
    fechainicio             DATE,               --NOT NULL  fecha inicio    
    fechafin                DATE,               --NOT NULL  fechafin
    sucursal_idsucursal     INTEGER NOT NULL,   --NOT NULL  llave foranea de sucursal
    empleado_idempleado     INTEGER NOT NULL    --NOT NULL  llave foranea de empleado
);

ALTER TABLE "Sucursal/Empleado" ADD CONSTRAINT "Sucursal/Empleado_PK" PRIMARY KEY ( "idSucursal/Empleado" );

CREATE TABLE telefono (
    idtelefono          INTEGER NOT NULL,       --NOT NULL  llave primaria de telefono
    numero              VARCHAR2(20),           --NOT NULL  numero de telefono
    persona_idpersona   INTEGER NOT NULL        --NOT NULL  llave foranea de persona
);

ALTER TABLE telefono ADD CONSTRAINT telefono_pk PRIMARY KEY ( idtelefono );

CREATE TABLE tipoobtencion (
    idtipoobtencion   INTEGER NOT NULL,     --NOT NULL  llave primaria de tipo de obtencion
    descripcion       VARCHAR2(45)          --NOT NULL  descripcion del tipo de obtencion
);

ALTER TABLE tipoobtencion ADD CONSTRAINT tipoobtencion_pk PRIMARY KEY ( idtipoobtencion );

CREATE TABLE tipopago (
    idtipopago    INTEGER NOT NULL, --NOT NULL  lalve primaria de tipoPago
    descripcion   VARCHAR2(45)      --NOT NULL     desrcipcion del tipo pago
);

ALTER TABLE tipopago ADD CONSTRAINT tipopago_pk PRIMARY KEY ( idtipopago );

CREATE TABLE tipoproveedor (
    idtipoproveedor   INTEGER NOT NULL, --NOT NULL  llave primaria de tipo de proveedor
    descripcion       VARCHAR2(45)      --NOT NULL  descripcion del tipo de proveedor
);

ALTER TABLE tipoproveedor ADD CONSTRAINT tipoproveedor_pk PRIMARY KEY ( idtipoproveedor );

ALTER TABLE autor
    ADD CONSTRAINT autor_persona_fk FOREIGN KEY ( persona_idpersona )
        REFERENCES persona ( idpersona );

ALTER TABLE "Autores/Libros"
    ADD CONSTRAINT "Autores/Libros_Autor_FK" FOREIGN KEY ( autor_idautor )
        REFERENCES autor ( idautor );

ALTER TABLE "Autores/Libros"
    ADD CONSTRAINT "Autores/Libros_Libro_FK" FOREIGN KEY ( libro_idlibro )
        REFERENCES libro ( idlibro );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_persona_fk FOREIGN KEY ( persona_idpersona )
        REFERENCES persona ( idpersona );

ALTER TABLE cubiculo
    ADD CONSTRAINT cubiculo_estante_fk FOREIGN KEY ( estante_idestante )
        REFERENCES estante ( idestante );

ALTER TABLE detallefactura
    ADD CONSTRAINT detallefactura_factura_fk FOREIGN KEY ( factura_idfactura )
        REFERENCES factura ( idfactura );

ALTER TABLE detallefactura
    ADD CONSTRAINT detallefactura_libro_fk FOREIGN KEY ( libro_idlibro )
        REFERENCES libro ( idlibro );

ALTER TABLE edicion
    ADD CONSTRAINT edicion_libro_fk FOREIGN KEY ( libro_idlibro )
        REFERENCES libro ( idlibro );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_jefeinmediato_fk FOREIGN KEY ( jefeinmediato_idjefeinmediato )
        REFERENCES jefeinmediato ( idjefeinmediato );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_persona_fk FOREIGN KEY ( persona_idpersona )
        REFERENCES persona ( idpersona );

ALTER TABLE "Empleado/Cargo"
    ADD CONSTRAINT "Empleado/Cargo_Cargo_FK" FOREIGN KEY ( cargo_idcargo )
        REFERENCES cargo ( idcargo );

ALTER TABLE "Empleado/Cargo"
    ADD CONSTRAINT "Empleado/Cargo_Empleado_FK" FOREIGN KEY ( empleado_idempleado )
        REFERENCES empleado ( idempleado );

ALTER TABLE estante
    ADD CONSTRAINT estante_pasillo_fk FOREIGN KEY ( pasillo_idpasillo )
        REFERENCES pasillo ( idpasillo );

ALTER TABLE factura
    ADD CONSTRAINT factura_cliente_fk FOREIGN KEY ( cliente_idcliente )
        REFERENCES cliente ( idcliente );

ALTER TABLE factura
    ADD CONSTRAINT factura_pago_fk FOREIGN KEY ( pago_idpago )
        REFERENCES pago ( idpago );

ALTER TABLE factura
    ADD CONSTRAINT factura_tipoobtencion_fk FOREIGN KEY ( tipoobtencion_idtipoobtencion )
        REFERENCES tipoobtencion ( idtipoobtencion );

ALTER TABLE "Generos/Libros"
    ADD CONSTRAINT "Generos/Libros_Genero_FK" FOREIGN KEY ( genero_idgenero )
        REFERENCES genero ( idgenero );

ALTER TABLE "Generos/Libros"
    ADD CONSTRAINT "Generos/Libros_Libro_FK" FOREIGN KEY ( libro_idlibro )
        REFERENCES libro ( idlibro );

ALTER TABLE jefeinmediato
    ADD CONSTRAINT jefeinmediato_empleado_fk FOREIGN KEY ( empleado_idempleado )
        REFERENCES empleado ( idempleado );

ALTER TABLE "Lib/Edit"
    ADD CONSTRAINT "Lib/Edit_Editorial_FK" FOREIGN KEY ( editorial_ideditorial )
        REFERENCES editorial ( ideditorial );

ALTER TABLE "Lib/Edit"
    ADD CONSTRAINT "Lib/Edit_Libro_FK" FOREIGN KEY ( libro_idlibro )
        REFERENCES libro ( idlibro );

ALTER TABLE libro
    ADD CONSTRAINT libro_categoria_fk FOREIGN KEY ( categoria_idcategoria )
        REFERENCES categoria ( idcategoria );

ALTER TABLE libro
    ADD CONSTRAINT libro_idioma_fk FOREIGN KEY ( idioma_ididioma )
        REFERENCES idioma ( ididioma );

ALTER TABLE mora
    ADD CONSTRAINT mora_pago_fk FOREIGN KEY ( pago_idpago )
        REFERENCES pago ( idpago );

ALTER TABLE pago
    ADD CONSTRAINT pago_descuento_fk FOREIGN KEY ( descuento_iddescuento )
        REFERENCES descuento ( iddescuento );

ALTER TABLE pago
    ADD CONSTRAINT pago_prestamo_fk FOREIGN KEY ( prestamo_idprestamo )
        REFERENCES prestamo ( idprestamo );

ALTER TABLE pago
    ADD CONSTRAINT pago_tipopago_fk FOREIGN KEY ( tipopago_idtipopago )
        REFERENCES tipopago ( idtipopago );

ALTER TABLE pasillo
    ADD CONSTRAINT pasillo_bodega_fk FOREIGN KEY ( bodega_idbodega )
        REFERENCES bodega ( idbodega );

ALTER TABLE posicionlibro
    ADD CONSTRAINT posicionlibro_cubiculo_fk FOREIGN KEY ( cubiculo_idcubiculo )
        REFERENCES cubiculo ( idcubiculo );

ALTER TABLE posicionlibro
    ADD CONSTRAINT posicionlibro_libro_fk FOREIGN KEY ( libro_idlibro )
        REFERENCES libro ( idlibro );

ALTER TABLE "Prov/Lib"
    ADD CONSTRAINT "Prov/Lib_Libro_FK" FOREIGN KEY ( libro_idlibro )
        REFERENCES libro ( idlibro );

ALTER TABLE "Prov/Lib"
    ADD CONSTRAINT "Prov/Lib_Proveedor_FK" FOREIGN KEY ( proveedor_idproveedor )
        REFERENCES proveedor ( idproveedor );

ALTER TABLE "Prov/pv"
    ADD CONSTRAINT "Prov/pv_ProductosVarios_FK" FOREIGN KEY ( pvarios_idpvarios )
        REFERENCES pvarios ( idpvarios );

ALTER TABLE "Prov/pv"
    ADD CONSTRAINT "Prov/pv_Proveedor_FK" FOREIGN KEY ( proveedor_idproveedor )
        REFERENCES proveedor ( idproveedor );

ALTER TABLE proveedor
    ADD CONSTRAINT proveedor_tipoproveedor_fk FOREIGN KEY ( tipoproveedor_idtipoproveedor )
        REFERENCES tipoproveedor ( idtipoproveedor );

ALTER TABLE sucursal
    ADD CONSTRAINT sucursal_bodega_fk FOREIGN KEY ( bodega_idbodega )
        REFERENCES bodega ( idbodega );

ALTER TABLE sucursal
    ADD CONSTRAINT sucursal_libreria_fk FOREIGN KEY ( libreria_idlibreria )
        REFERENCES libreria ( idlibreria );

ALTER TABLE "Sucursal/Empleado"
    ADD CONSTRAINT "Sucursal/Empleado_Empleado_FK" FOREIGN KEY ( empleado_idempleado )
        REFERENCES empleado ( idempleado );

ALTER TABLE "Sucursal/Empleado"
    ADD CONSTRAINT "Sucursal/Empleado_Sucursal_FK" FOREIGN KEY ( sucursal_idsucursal )
        REFERENCES sucursal ( idsucursal );

ALTER TABLE telefono
    ADD CONSTRAINT telefono_persona_fk FOREIGN KEY ( persona_idpersona )
        REFERENCES persona ( idpersona );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            38
-- CREATE INDEX                             7
-- ALTER TABLE                             78
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
