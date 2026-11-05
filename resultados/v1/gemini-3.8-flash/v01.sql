SELECT SUM("Qnt") AS quantidade
FROM "vendas"
WHERE "Nota" != 'NFe 2217'
  AND strftime('%Y-%m', "Emissão") = '2026-04'
  AND ("produto_base" LIKE '%tampa%' OR "Descrição" LIKE '%tampa%')
  AND ("medida" LIKE '%38%' OR "Descrição" LIKE '%38%')
  AND ("cor" LIKE '%vermelh%' OR "Descrição" LIKE '%vermelh%');