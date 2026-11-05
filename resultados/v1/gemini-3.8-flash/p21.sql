SELECT strftime('%Y-%m', "Emissão") AS mes
FROM vendas
WHERE ("Razão Social" LIKE '%Delta%' OR "Nome Fantasia" LIKE '%Delta%')
  AND ("produto_base" LIKE '%tampa%' OR "Descrição" LIKE '%tampa%')
  AND ("cor" LIKE '%pret%' OR "Descrição" LIKE '%pret%')
  AND "Qnt" > 0
ORDER BY "Emissão" DESC
LIMIT 1;