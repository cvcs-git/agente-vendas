SELECT *
FROM pedidos_efetivos
WHERE cliente LIKE '%lambda%'
  AND strftime('%Y-%m', emissao) = strftime('%Y-%m', 'now');
