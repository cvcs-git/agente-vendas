-- 1. Tempo médio entre pedidos por cliente
WITH diffs AS (
  SELECT
    cliente,
    julianday(emissao) - julianday(LAG(emissao) OVER (PARTITION BY cliente ORDER BY emissao)) AS diff_days
  FROM pedidos_efetivos
)
SELECT
  cliente,
  ROUND(AVG(diff_days), 2) AS avg_days
FROM diffs
WHERE diff_days IS NOT NULL
GROUP BY cliente
ORDER BY avg_days;

-- 2. Cliente que leva menos tempo (menor média)
WITH diffs AS (
  SELECT
    cliente,
    julianday(emissao) - julianday(LAG(emissao) OVER (PARTITION BY cliente ORDER BY emissao)) AS diff_days
  FROM pedidos_efetivos
)
SELECT
  cliente,
  ROUND(AVG(diff_days), 2) AS avg_days
FROM diffs
WHERE diff_days IS NOT NULL
GROUP BY cliente
ORDER BY avg_days
LIMIT 1;