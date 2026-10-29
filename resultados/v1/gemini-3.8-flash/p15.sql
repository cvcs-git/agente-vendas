SELECT 
  strftime('%Y-%m', "Emissão") AS mes,
  SUM("Total") AS faturamento
FROM "vendas"
WHERE "Emissão" LIKE '2026%'
GROUP BY mes
ORDER BY mes;