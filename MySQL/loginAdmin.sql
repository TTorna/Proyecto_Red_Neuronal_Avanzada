Use BDC;

Drop procedure loginAdmin;

Delimiter $$
Create Procedure loginAdmin (
Mail Varchar(30),
Nombre Varchar(30),
Apellido Varchar(30),
Contraseña Varchar(30)
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
    From Usuarios U
    inner join Rel_Rol_Usuario RRU ON RRU.IdUsuario=U.IdUsuario
    inner join Roles R ON RRU.IdRol=R.IdRol
    Where (
    U.Mail =Mail
    AND  U.Nombre = Nombre
    And U.Apellido = Apellido
    And U.Contraseña=Contraseña
    AND R.Tipo=2
    );
    
    Select Devolucion;
    
    commit;    
End$$
Delimiter ;

Call loginAdmin('Ejem@gmail.com', 'Ivan', 'Oro', '1234567');