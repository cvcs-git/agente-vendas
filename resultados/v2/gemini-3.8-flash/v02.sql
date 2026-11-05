SELECT codigo_produto, descricao, SUM(quantidade) AS unidades FROM itens WHERE
mes = '2026-01' AND (descricao LIKE '%tampa%26%' OR produto_base LIKE
'%tampa%26%') GROUP BY codigo_produto ORDER BY unidades DESC
