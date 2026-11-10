SELECT DISTINCT "Razão Social" AS cliente
FROM vendas
WHERE "Descrição" LIKE '%alça%'
  AND "Qnt" > 0
  AND "Emissão" <= datetime('now');
