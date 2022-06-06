select S.tipo_s, 
count(S.tipo_s) as Total_de_Clientes
FROM SACRAMENTO S
where S.tipo_s='Matrimonio'
group by S.tipo_s;