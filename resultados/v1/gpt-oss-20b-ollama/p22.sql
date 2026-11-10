SELECT SUM("Total NF") AS gasto
FROM vendas
WHERE ("Razão Social" LIKE '%Delta%' OR "Nome Fantasia" LIKE '%Delta%')
  AND "Cidade/UF" LIKE '%tampa 26%'
  AND "Emissão" >= '2026-03-01' AND "Emissão" < '2026-04-01';
