SELECT DISTINCT strftime('%m', Emissão) AS mes
FROM vendas
WHERE (Razão Social LIKE '%Delta%' OR Nome Fantasia LIKE '%Delta%')
  AND Descrição LIKE '%dosadora%'
  AND Emissão >= '2026-01-01' AND Emissão < '2027-01-01'
  AND Qnt > 0
ORDER BY mes;
