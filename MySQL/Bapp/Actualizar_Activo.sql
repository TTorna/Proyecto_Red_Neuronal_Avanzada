Use BDC;

Drop procedure Actualizar_Activo;

Delimiter $$
Create Procedure Actualizar_Activo (
Actividad integer
,_IdActivo integer
,_NombreActivo Varchar(30)
,LinkGrafico Varchar(100)
, Rubro int
)
Begin
		declare exit handler for sqlexception
			BEGIN
            rollback;
            end;
            
	start transaction;

	If Actividad=0 then
        Insert INTO BDC.Activo(
		NombreActivo)
		Values(
		_NombreActivo);
        
        Insert into BDC.Grafico(
        Link)
		Values(LinkGrafico);
        
        Insert into BDC.Rel_activo_grafico(
        idActivo
        ,IdGrafico)
		Values(last_insert_id(),last_insert_id());
    
		Insert into BDC.Rel_rubro_activo(
        idactivo
        ,idRubro)
		Values(last_insert_id(),Rubro);

		Insert into BDC.Rel_Ind_activo(
        idactivo
        ,idindicador)
		Values(last_insert_id(),1);
    
	Else
		Update BDC.Activo
        set NombreActivo=_NombreActivo
        where IdActivo=_IdActivo;
        
	End if;
    
    commit;
End$$
Delimiter ;

Call Actualizar_Activo(0, 4, "Prueba","LinkGrafico",2);
Call Register('Ejemplo@gmail.com', 'Ivan', 'Oro', '1512341234', 'Activo','1234567');
Call Login('Ejemplo@gmail.com', 'Ivan', 'Oro', '1234567');

select * from activo;