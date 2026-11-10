SELECT SUM(faturamento) AS faturamento
FROM itens
WHERE mes = '2026-04'
  AND cliente LIKE '%Paulista%'
  AND descricao LIKE '%dosadora%'
