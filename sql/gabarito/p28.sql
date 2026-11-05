-- P28: Qual o nosso faturamento do mês de maio para o estado do Rio Grande do Norte?
-- Esperado: NULL (não há clientes no RN)
SELECT ROUND(SUM(faturamento), 2) AS faturamento
FROM itens
WHERE mes = '2026-05'
  AND cidade_uf LIKE '%/RN'
