/*
Borro con esto los datos de la tabla

truncate table estudiantes 
*/

declare @w_resultados int

/*
Este es el create:
exec sp_estudiantes @i_operacion='C', @i_nombre='Alejandro', @i_apellido='Estrada', @i_s_apellido='Moscoso'
exec sp_estudiantes @i_operacion='C'
*/

/*
Este es el update:
exec @w_resultados = sp_estudiantes @i_operacion='U', @i_codigo=9, @i_nombre='Karim', @i_apellido='Benzema', @i_s_apellido=''
exec @w_resultados = sp_estudiantes @i_operacion='U'
*/

/*
Este es el read:
exec @w_resultados = sp_estudiantes @i_operacion='R'
*/

/*
Este es el delete:
exec @w_resultados = sp_estudiantes @i_operacion='D', @i_codigo = 1
*/

select * from estudiantes

select @w_resultados

--truncate table estudiantes 

