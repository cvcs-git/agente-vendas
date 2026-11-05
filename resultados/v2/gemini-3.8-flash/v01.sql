
SELECT codigo_produto, descricao, SUM(quantidade) AS unidades
FROM itens
WHERE mes = '2026-04'
AND descricao LIKE '%tampa%'
AND descricao LIKE '%38%'
AND descricao LIKE '%vermelh%'
GROUP BY codigo_produto, descricao
ORDER BY unidades DESC