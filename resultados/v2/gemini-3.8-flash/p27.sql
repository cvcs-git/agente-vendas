WITH ranking AS ( SELECT cliente, codigo_produto, MAX(descricao) AS descricao,
SUM(quantidade) AS unidades, ROW_NUMBER() OVER (PARTITION BY cliente ORDER BY
SUM(quantidade) DESC) AS pos FROM itens GROUP BY cliente, codigo_produto )
SELECT cliente, codigo_produto, descricao, unidades FROM ranking WHERE pos = 1
ORDER BY cliente
