-- V08: Qual cliente teve o maior percentual de pedidos cancelados este ano?
-- Esperado: COMERCIAL ALFA LTDA (18 cancelamentos; 9.7% sobre os pedidos de venda)
-- Também aceitos: 8.9% (sobre todos os pedidos) ou 10.8% (sobre pedidos efetivos)
SELECT cliente,
       COUNT(DISTINCT CASE WHEN tipo = 'cancelamento' THEN pedido END) AS cancelamentos,
       COUNT(DISTINCT CASE WHEN tipo = 'venda' THEN pedido END) AS pedidos_venda,
       ROUND(100.0 * COUNT(DISTINCT CASE WHEN tipo = 'cancelamento' THEN pedido END)
             / COUNT(DISTINCT CASE WHEN tipo = 'venda' THEN pedido END), 1) AS percentual_cancelado
FROM itens
GROUP BY cliente
ORDER BY percentual_cancelado DESC
