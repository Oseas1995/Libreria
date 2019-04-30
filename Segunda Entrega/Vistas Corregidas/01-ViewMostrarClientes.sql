--1 Mostrar Clientes.

Create view vw_Clientes as
select cli.idCliente, per.pnombre, per.snombre, per.papellido, per.sapellido, per.direccion, per.correo, per.noIdentidad from Cliente Cli
inner join Persona per ON per.idPersona=Cli.Persona_idPersona;