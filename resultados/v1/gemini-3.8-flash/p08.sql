SELECT 
  SUM("Total") * 1.0 / (
    COUNT(DISTINCT CASE WHEN "Total" > 0 THEN "Venda" END) - 
    COUNT(DISTINCT CASE WHEN "Total" < 0 THEN "Venda" END)
  ) AS ticket_medio
FROM vendas
WHERE "Razão Social" LIKE '%Comercial Alfa%' 
   OR "Nome Fantasia" LIKE '%Comercial Alfa%';  