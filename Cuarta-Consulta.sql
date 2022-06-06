select 
S.tipo_s AS Sacramento,
S.Precio_s as Precio_individual,
count(S.tipo_s) as Cantidad,
sum(S.precio_s) as Total 
FROM SACRAMENTO S
group by S.tipo_s,S.Precio_s,S.precio_s