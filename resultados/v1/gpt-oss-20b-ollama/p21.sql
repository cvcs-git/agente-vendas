SELECT strftime('%Y-%m', Emissão) AS ultimo_mes
FROM vendas
WHERE "Razão Social" LIKE '%Delta%'
  AND "Descrição" LIKE '%tampa preta%'
  AND Qnt > 0
ORDER BY Emissão DESC
LIMIT 1;
