SELECT ROUND(SUM(faturamento), 2) AS faturamento
FROM itens
WHERE (cliente LIKE '%Delta%' OR nome_fantasia LIKE '%Delta%')
  AND cidade_uf LIKE '%tampa 26%'
  AND mes = '2026-03';
