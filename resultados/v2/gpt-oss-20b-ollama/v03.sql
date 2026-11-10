SELECT emissao
FROM itens
WHERE tipo = 'cancelamento'
  AND (cliente LIKE '%Atacado Omega%' OR nome_fantasia LIKE '%Atacado Omega%')
ORDER BY emissao DESC
LIMIT 1;
