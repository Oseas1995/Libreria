--11 Mostrar los clientes con nombre completo

Create view vw_nomCliente as
select cli.idCliente, (per.pnombre||' '||per.snombre||' '||per.papellido||' '||per.sapellido) nombreCompleto, per.direccion, per.correo, per.noIdentidad from Cliente Cli
inner join Persona per ON per.idPersona=Cli.Persona_idPersona;
