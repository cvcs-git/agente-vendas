
SELECT
codigo_produto,
descricao,
SUM(CASE WHEN mes IN ('2026-01', '2026-02') THEN quantidade ELSE 0 END) AS unidades_1o_bimestre,
SUM(CASE WHEN mes IN ('2026-03', '2026-04') THEN quantidade ELSE 0 END) AS unidades_2o_bimestre,
(SUM(CASE WHEN mes IN ('2026-03', '2026-04') THEN quantidade ELSE 0 END) -
SUM(CASE WHEN mes IN ('2026-01', '2026-02') THEN quantidade ELSE 0 END)) AS aumento_unidades
FROM itens
WHERE mes BETWEEN '2026-01' AND '2026-04'
GROUP BY codigo_produto
ORDER BY aumento_unidades DESC
LIMIT 1