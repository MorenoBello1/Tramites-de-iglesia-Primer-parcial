
select 
SC.id_solicitud as Numero_Solicitud, 
C.nombre_c as Cliente,  
S.tipo_s,
TO_CHAR(S.fecha_s,'YYYY') as Fecha
from sacramento S
inner join Solicitud_DE_Cliente SC on SC.id_solicitud = S.id_solicitud
inner join Cliente C on C.id_cliente = SC.id_cliente
where (S.fecha_S>'01-01-2020') and (S.fecha_S<'31-12-2022') and (S.tipo_s='Bautizo')  or (S.tipo_s='Confirmacion');