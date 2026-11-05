SELECT "Emissão"
FROM "vendas"
WHERE ("Razão Social" LIKE '%Atacado Omega%' OR "Nome Fantasia" LIKE '%Atacado Omega%')
  AND "Total" < 0
ORDER BY "Emissão" DESC
LIMIT 1;
