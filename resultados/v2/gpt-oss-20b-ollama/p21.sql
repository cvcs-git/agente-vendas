SELECT mes
FROM itens
WHERE (cliente LIKE '%Delta%' OR nome_fantasia LIKE '%Delta%')
  AND descricao LIKE '%tampa preta%'
  AND tipo = 'venda'
  AND quantidade > 0
ORDER BY mes DESC
LIMIT 1;
