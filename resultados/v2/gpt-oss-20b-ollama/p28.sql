SELECT ROUND(SUM(faturamento), 2) AS faturamento
FROM itens
WHERE mes = '2026-05'
  AND cidade_uf LIKE '%RN';
