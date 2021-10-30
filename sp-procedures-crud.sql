
/*
	Procedure reutilizable 
*/

use capacitacion
go

if exists(select 1 from sysobjects where name='sp_estudiantes')
	drop procedure sp_estudiantes
go

create procedure sp_estudiantes(
	@i_codigo		int			 = null,
	@i_nombre		varchar(100) = null,
	@i_apellido		varchar(100) = null,
	@i_s_apellido	varchar(100) = null,
	@i_operacion	char(1)		 = 'I'
)
as
declare
	@w_codigo	int,
	@w_max		int

print 'Ingrese a estudiantes'

if @i_operacion='C'
begin
	
	select @w_max = max(es_codigo) 
	from estudiantes
	if @w_max is null
		select @w_codigo = 1
	else
		select @w_codigo = @w_max + 1 

	print 'create clients'

	if @i_nombre is null or @i_apellido is null 
	begin
		raiserror('Debe enviar nombre y apellido',10,5)
		return 3002
	end

	insert into estudiantes(
		es_codigo,	es_nombre,	es_apellido,	es_segundo_apellido)
	values(
		@w_codigo,	@i_nombre,	@i_apellido,	@i_s_apellido)
end
if @i_operacion='R'
begin
	print 'read clients'
	select * 
	from estudiantes
end
if @i_operacion='U'
begin
	print 'update clients'
	if @i_codigo = null
	begin
		raiserror('Debe enviar codigo',10,5)
		return 1900
	end
	if @i_nombre is null or @i_apellido is null 
	begin
		raiserror('Debe enviar nombre y apellido',10,5)
		return 3002
	end
	update estudiantes 
	set es_nombre = @i_nombre, 
		es_apellido = @i_apellido, 
		es_segundo_apellido = @i_s_apellido
	where es_codigo = @i_codigo

	if @@ROWCOUNT = 0
	begin 
		raiserror('No se actualizo ningun dato', 10, 5)
		return 3001
	end


end
if @i_operacion='D'
begin
	print 'delete clients'
	if @i_codigo = null
	begin
		raiserror('Debe enviar codigo',10,5)
		return 1900
	end

	delete estudiantes where es_codigo = @i_codigo
end

return 0
