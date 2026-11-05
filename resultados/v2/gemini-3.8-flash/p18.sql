SELECT cliente FROM itens WHERE (descricao LIKE '%alça%' OR descricao LIKE
'%alca%' OR produto_base LIKE '%alça%' OR produto_base LIKE '%alca%') GROUP BY
cliente HAVING SUM(quantidade) > 0 ORDER BY cliente
