SELECT ROUND(SUM(faturamento), 2) AS faturamento
FROM itens
WHERE mes = '2026-04'
  AND cidade_uf LIKE '%Paulista%'
  AND (descricao LIKE '%dosadora%' OR produto_base LIKE '%dosadora%');
