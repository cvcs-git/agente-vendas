SELECT "Vendedor", SUM("Qnt") AS volume_total
FROM "vendas"
WHERE "Nota" != 'NFe 2217'
  AND strftime('%Y-%m', "Emissão") = '2026-05'
GROUP BY "Vendedor"
ORDER BY volume_total DESC
LIMIT 1;