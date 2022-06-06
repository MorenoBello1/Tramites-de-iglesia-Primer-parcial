select 
P.nombre_p as Nombre,
P.apellido_p as Apellido,
P.cedula_p as Cedula,
R.nombretipo_rol as Rol,
S.tipo_s as Sacramento,
S.fecha_s as Atendido
from  Sacramento S 
inner join Rol R on R.id_sacramento =  S.id_Sacramento
inner join Personal P on P.id_rol = R.id_rol
where (S.tipo_s='Bautizo') 
order by S.fecha_s DESC;