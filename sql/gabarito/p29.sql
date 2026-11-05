-- P29: Quanto faturamos com dosadora em Paulista em abril?
-- Esperado: 40175.0
SELECT ROUND(SUM(faturamento), 2) AS faturamento
FROM itens
WHERE mes = '2026-04'
  AND descricao LIKE '%DOSADORA%'
  AND cidade_uf LIKE 'PAULISTA%'
