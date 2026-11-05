SELECT SUM("Qnt")
FROM "vendas"
WHERE strftime('%Y-%m', "Emissão") = '2026-01'
  AND "Nota" != 'NFe 2217'
  AND ("produto_base" LIKE '%tampa%' OR "Descrição" LIKE '%tampa%')
  AND ("medida" LIKE '%26%' OR "produto_base" LIKE '%26%' OR "Descrição" LIKE '%26%');