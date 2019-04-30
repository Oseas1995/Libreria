--3 Mostrar Empleados.

Create view vw_Empleados as
select per.pnombre, per.snombre, per.papellido, per.sapellido, per.direccion, per.correo, per.noIdentidad from Empleado em
inner join Persona per ON per.idPersona=em.Persona_idPersona;
