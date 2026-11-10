SELECT MAX(emissao) AS ultima_cancelamento
FROM itens
WHERE cliente LIKE '%Atacado Omega%' AND tipo = 'cancelamento'
