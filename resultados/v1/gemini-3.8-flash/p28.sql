SELECT SUM("Total") AS "Faturamento"
FROM "vendas"
WHERE "Cidade/UF" LIKE '%/RN'
  AND strftime('%Y-%m', "Emissão") = '2026-05';