SELECT "Vendedor", SUM("Total") AS faturamento
FROM "vendas"
WHERE strftime('%Y-%m', "Emissão") = '2026-05'
GROUP BY "Vendedor"
ORDER BY faturamento DESC
LIMIT 1;