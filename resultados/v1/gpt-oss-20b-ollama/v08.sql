WITH orders AS (
  SELECT DISTINCT "Razão Social", Venda
  FROM vendas
  WHERE strftime('%Y', Emissão) = '2026'
),
cancellations AS (
  SELECT DISTINCT Venda
  FROM vendas
  WHERE Total < 0
)
SELECT o."Razão Social",
       ROUND(SUM(CASE WHEN c.Venda IS NOT NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS pct_cancel
FROM orders o
LEFT JOIN cancellations c ON o.Venda = c.Venda
GROUP BY o."Razão Social"
ORDER BY pct_cancel DESC
LIMIT 1;
