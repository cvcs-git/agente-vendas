SELECT produto_base, SUM(CASE WHEN mes BETWEEN '2026-01' AND '2026-06' THEN quantidade ELSE 0 END) AS primeiro_bimestre,
       SUM(CASE WHEN mes BETWEEN '2026-07' AND '2026-12' THEN quantidade ELSE 0 END) AS segundo_bimestre,
       SUM(CASE WHEN mes BETWEEN '2026-07' AND '2026-12' THEN quantidade ELSE 0 END) - SUM(CASE WHEN mes BETWEEN '2026-01' AND '2026-06' THEN quantidade ELSE 0 END) AS aumento
FROM itens
GROUP BY produto_base
ORDER BY aumento DESC
LIMIT 1
