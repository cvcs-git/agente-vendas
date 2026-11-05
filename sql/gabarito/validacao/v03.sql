-- V03: Quando foi o último cancelamento do Atacado Omega?
-- Esperado: 2026-08-16 08:14:09 (NFe 2296, pedido 1307)
SELECT DISTINCT cliente, nota, pedido, emissao
FROM itens
WHERE tipo = 'cancelamento'
  AND (cliente LIKE '%OMEGA%' OR nome_fantasia LIKE '%OMEGA%')
ORDER BY emissao DESC
LIMIT 1
