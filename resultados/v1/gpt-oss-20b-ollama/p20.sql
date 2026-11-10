SELECT MAX(emissao) AS ultima_compra
FROM pedidos_efetivos
WHERE cliente LIKE '%Corneto%';
