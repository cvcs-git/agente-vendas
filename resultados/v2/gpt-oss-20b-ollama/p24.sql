SELECT DISTINCT mes
FROM itens
WHERE (cliente LIKE '%Delta%' OR nome_fantasia LIKE '%Delta%')
  AND descricao LIKE '%dosadora%'
  AND mes LIKE '2026-%'
  AND tipo = 'venda'
ORDER BY mes;
