Use BDC;

Drop procedure ValidacionMail;

Delimiter $$
Create Procedure ValidacionMail (
Mail Varchar(30)
)
Begin
	Declare Devolucion INT;
    declare exit handler for sqlexception
			BEGIN
            rollback;
            end;
            
	start transaction;
    
	Select Count(1)
    Into Devolucion
    From Usuarios
    Where (
    usuarios.Mail =Mail
    );
    Select Devolucion;
    
    commit;    
End$$
Delimiter ;

Call ValidacionMail('Ejem@gmail.com');