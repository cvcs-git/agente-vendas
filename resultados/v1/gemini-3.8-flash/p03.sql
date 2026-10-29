SELECT 
  "Razão Social",
  SUM("Total") AS faturamento,
  SUM("Total") * 100.0 / (SELECT SUM("Total") FROM "vendas") AS percentual
FROM "vendas"
GROUP BY "Razão Social"
ORDER BY faturamento DESC
LIMIT 1;