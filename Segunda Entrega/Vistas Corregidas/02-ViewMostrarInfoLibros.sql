--2 Mostrar informacion de libros.

Create view vw_libros as
select li.nombre, li.anioPublicacion, (per.pnombre||' '||per.papellido) as autor, idi.descripcion as idioma, gen.descripcion as genero, cat.descripcion as categoria, edi.nombre as editorial from Libro li
inner join Idioma idi on idi.idIdioma=li.Idioma_idIdioma
inner join GenerosLibros gl ON gl.Libro_idLibro=li.idLibro
inner join Genero gen on gen.idGenero=gl.Genero_idGenero
inner join Categoria cat on cat.idCategoria=li.Categoria_idCategoria
inner join AutoresLibros al on al.Libro_idLibro=li.idLibro
inner join Autor au on au.idAutor=al.Autor_idAutor
inner join Persona per on per.idPersona=au.Persona_idPersona
inner join LibEdit le on le.Libro_idLibro=li.idLibro
inner join Editorial edi on edi.idEditorial=le.Editorial_idEditorial;