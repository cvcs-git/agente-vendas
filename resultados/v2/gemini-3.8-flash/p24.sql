SELECT cliente, mes FROM itens WHERE (cliente LIKE '%delta%' OR nome_fantasia
LIKE '%delta%') AND (descricao LIKE '%dosadora%' OR produto_base LIKE
'%dosadora%') AND mes LIKE '2026-%' GROUP BY cliente, mes HAVING SUM(quantidade)
> 0 ORDER BY cliente, mes
