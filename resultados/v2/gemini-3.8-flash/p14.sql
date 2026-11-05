WITH faturamento_por_cliente AS ( SELECT cliente, SUM(faturamento) AS
faturamento_cliente FROM itens GROUP BY cliente HAVING SUM(faturamento) > 0 ),
acumulado AS ( SELECT cliente, faturamento_cliente, SUM(faturamento_cliente)
OVER (ORDER BY faturamento_cliente DESC, cliente) AS faturamento_acumulado,
(SELECT SUM(faturamento) FROM itens) AS faturamento_total FROM
faturamento_por_cliente ) SELECT COUNT(*) AS total_clientes FROM acumulado WHERE
(faturamento_acumulado - faturamento_cliente) < 0.8 * faturamento_total
