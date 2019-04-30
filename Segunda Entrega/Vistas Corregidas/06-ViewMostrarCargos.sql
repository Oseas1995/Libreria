--6 Mostrar cargos de los empleados.

CREATE VIEW vw_CargoEmpleados AS
SELECT (p.pnombre||' '||p.snombre||' '||p.papellido||' '||p.sapellido) NombreCompleto, c.descripcion cargo  FROM Persona p
INNER JOIN Empleado e ON p.idPersona = e.Persona_idPersona
INNER JOIN EmpleadoCargo ec ON e.idEmpleado = ec.Empleado_idEmpleado
INNER JOIN Cargo c ON ec.Cargo_idCargo = c.idCargo;