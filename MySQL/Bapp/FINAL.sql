Use BDC;

Drop procedure Pedir_Historial;

Delimiter $$
Create Procedure Pedir_Historial (
vFecha_Predic Date /* Apartir de esta fecha se buscan predicciones */
, vMailUsuario varchar(30)
)
Begin
    declare exit handler for sqlexception
			BEGIN
            rollback;
            end;
            
	start transaction;
    
    Select P.Resultado from Predictor P
    inner join Rel_Predic_usuario Rpu ON P.idPrediccion=Rpu.idPrediccion
    inner join Usuarios U ON U.IdUsuario=Rpu.idUsuario
	Where P.Fecha_Predic=vFecha_Predic and U.Mail=vMailUsuario
    order by P.Fecha_Predic asc;
    
    commit;
End$$
Delimiter ;

Call Pedir_Historial('2021-12-01','tototornamira@gmail.com');
Call Register('Ejemplo@gmail.com', 'Ivan', 'Oro', '1512341234', 'Activo','1234567');
Call Login('Ejemplo@gmail.com', 'Ivan', 'Oro', '1234567');

Select * from Predictor P
    inner join Rel_Predic_usuario Rpu ON P.idPrediccion=Rpu.idPrediccion
    inner join Usuarios U ON U.IdUsuario=Rpu.idUsuario;