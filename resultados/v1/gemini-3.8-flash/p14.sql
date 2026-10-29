WITH faturamento_cliente AS (
  SELECT
    "Razão Social" AS cliente,
    SUM("Total") AS faturamento
  FROM "vendas"
  GROUP BY "Razão Social"
  HAVING SUM("Total") > 0
),
acumulado AS (
  SELECT
    cliente,
    faturamento,
    SUM(faturamento) OVER (ORDER BY faturamento DESC) AS fat_acumulado,
    SUM(faturamento) OVER () AS fat_total
  FROM faturamento_cliente
)
SELECT COUNT(*) AS total_clientes
FROM acumulado
WHERE (fat_acumulado - faturamento) < 0.8 * fat_total;