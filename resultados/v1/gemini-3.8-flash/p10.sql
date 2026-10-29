SELECT COUNT(DISTINCT cliente) AS total_clientes
FROM pedidos_efetivos
WHERE strftime('%Y-%m', emissao) = '2026-06';