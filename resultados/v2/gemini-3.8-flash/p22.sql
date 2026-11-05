SELECT cliente, ROUND(SUM(faturamento), 2) AS faturamento FROM itens WHERE
(cliente LIKE '%Delta%' OR nome_fantasia LIKE '%Delta%') AND (descricao LIKE
'%tampa 26%' OR produto_base LIKE '%tampa 26%') AND mes = '2026-03' GROUP BY
cliente
