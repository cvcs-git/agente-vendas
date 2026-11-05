-- V04: O cliente lambda fez algum pedido esse mês?
-- Esperado: 0 (não existe cliente "lambda")
SELECT COUNT(*) AS pedidos
FROM pedidos_efetivos
WHERE mes = '2026-08'
  AND pedido IN (SELECT pedido FROM itens
                 WHERE cliente LIKE '%LAMBDA%' OR nome_fantasia LIKE '%LAMBDA%')
