-- P10: Quantos clientes compraram em junho de 2026?
-- Regra: cliente do mês = tem pelo menos um pedido efetivo emitido no mês (view pedidos_efetivos)
SELECT COUNT (DISTINCT cliente) AS clientes
FROM pedidos_efetivos
WHERE strftime('%Y-%m', emissao) = '2026-06';