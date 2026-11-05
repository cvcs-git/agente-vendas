SELECT DISTINCT strftime('%m', "Emissão") AS mes
FROM "vendas"
WHERE ("Razão Social" LIKE '%Delta%' OR "Nome Fantasia" LIKE '%Delta%')
  AND ("Descrição" LIKE '%dosadora%' OR "produto_base" LIKE '%dosadora%')
  AND strftime('%Y', "Emissão") = '2026'
  AND "Qnt" > 0
ORDER BY mes;