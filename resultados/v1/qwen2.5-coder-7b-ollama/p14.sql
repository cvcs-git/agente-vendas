```sql
WITH faturamento_cliente AS (
  SELECT cliente, SUM(faturamento) AS total_faturamento
  FROM pedidos_efetivos
  GROUP BY cliente
),
total_faturamento AS (
  SELECT SUM(total_faturamento) AS total
  FROM faturamento_cliente
)
SELECT COUNT(cliente) AS num_clientes
FROM faturamento_cliente
WHERE total_faturamento >= (SELECT 0.8 * total FROM total_faturamento);
```
