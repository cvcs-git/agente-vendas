SELECT DISTINCT mes
FROM itens
WHERE cliente LIKE '%delta%' OR nome_fantasia LIKE '%delta%'
  AND descricao LIKE '%dosadora%'
ORDER BY mes
