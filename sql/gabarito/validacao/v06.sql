-- V06: Quantos clientes o vendedor A atendeu em maio?
-- Esperado: 1 (COMERCIAL ALFA LTDA)
SELECT COUNT(DISTINCT cliente) AS clientes
FROM pedidos_efetivos
WHERE mes = '2026-05'
  AND vendedor = 'VENDEDOR A'
