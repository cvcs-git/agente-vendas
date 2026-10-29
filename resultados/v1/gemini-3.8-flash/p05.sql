SELECT SUM("Total") AS faturamento
FROM "vendas"
WHERE "Emissão" >= '2026-07-01' AND "Emissão" < '2026-08-01';