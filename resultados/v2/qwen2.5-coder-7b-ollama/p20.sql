SELECT MAX(emissao) AS ultima_compra
FROM itens
WHERE cliente LIKE '%corneto%' OR nome_fantasia LIKE '%corneto%'
