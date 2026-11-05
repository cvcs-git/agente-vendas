SELECT cliente, MAX(emissao) AS ultimo_cancelamento
FROM itens
WHERE tipo = 'cancelamento'
AND (cliente LIKE '%Atacado Omega%' OR nome_fantasia LIKE '%Atacado Omega%')
GROUP BY cliente
ORDER BY ultimo_cancelamento DESC