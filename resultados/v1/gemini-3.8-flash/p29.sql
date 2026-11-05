SELECT SUM("Total") AS faturamento
FROM "vendas"
WHERE "Cidade/UF" LIKE '%Paulista%'
  AND ("produto_base" LIKE '%dosadora%' OR "Descrição" LIKE '%dosadora%')
  AND strftime('%Y-%m', "Emissão") = '2026-04';