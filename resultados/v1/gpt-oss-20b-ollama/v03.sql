SELECT MAX(Emissão) AS ultima_cancelamento
FROM vendas
WHERE (Razão Social LIKE '%Atacado Omega%' OR Nome Fantasia LIKE '%Atacado Omega%')
  AND Total < 0;
