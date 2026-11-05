WITH trimestres AS ( SELECT cliente, SUM(CASE WHEN mes BETWEEN '2026-01' AND
'2026-03' THEN faturamento ELSE 0 END) AS faturamento_1tri, SUM(CASE WHEN mes
BETWEEN '2026-04' AND '2026-06' THEN faturamento ELSE 0 END) AS faturamento_2tri
FROM itens WHERE mes BETWEEN '2026-01' AND '2026-06' GROUP BY cliente ) SELECT
cliente, ROUND(faturamento_1tri, 2) AS faturamento_1tri,
ROUND(faturamento_2tri, 2) AS faturamento_2tri, ROUND((faturamento_2tri -
faturamento_1tri) * 100.0 / NULLIF(faturamento_1tri, 0), 1) AS
variacao_percentual, CASE WHEN faturamento_2tri > faturamento_1tri THEN
'Cresceu' WHEN faturamento_2tri < faturamento_1tri THEN 'Caiu' ELSE 'Estável'
END AS status FROM trimestres ORDER BY variacao_percentual DESC
