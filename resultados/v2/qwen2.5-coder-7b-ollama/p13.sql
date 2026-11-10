SELECT cliente,
       ROUND((SUM(CASE WHEN mes BETWEEN '2026-01' AND '2026-03' THEN faturamento ELSE 0 END) -
              SUM(CASE WHEN mes BETWEEN '2026-04' AND '2026-06' THEN faturamento ELSE 0 END)) /
             SUM(CASE WHEN mes BETWEEN '2026-04' AND '2026-06' THEN faturamento ELSE 0 END) * 100, 1) AS variação_percentual
FROM itens
WHERE mes BETWEEN '2026-01' AND '2026-06'
GROUP BY cliente
ORDER BY variação_percentual DESC
