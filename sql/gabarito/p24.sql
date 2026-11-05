-- P24: A empresa Delta comprou dosadora em quais meses esse ano?
-- Esperado: 2026-01, 02, 03, 05, 06, 07, 08 (só abril sem compra)
SELECT DISTINCT mes
FROM pedidos_efetivos
WHERE cliente LIKE '%DELTA%'
  AND pedido IN (SELECT pedido FROM itens
                 WHERE tipo = 'venda' AND descricao LIKE '%DOSADORA%')
ORDER BY mes
