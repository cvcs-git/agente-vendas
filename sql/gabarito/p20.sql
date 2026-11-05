-- P20: Quando foi a última compra de Corneto?
-- Esperado: NULL (não existe cliente "Corneto")
SELECT MAX(emissao) AS ultima_compra
FROM pedidos_efetivos
WHERE pedido IN (SELECT pedido FROM itens
                 WHERE cliente LIKE '%CORNETO%' OR nome_fantasia LIKE '%CORNETO%')
