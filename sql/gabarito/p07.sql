-- P07: Quanto tempo, em média, cada cliente leva para fazer um novo pedido?
-- Regras: intervalos calculados entre pedidos efetivos consecutivos (view pedidos_efetivos)
--         resumo = média dos intervalos, em dias
--         entram todos os clientes com 2+ pedidos efetivos, sempre com o número de intervalos
WITH intervalos AS (
    SELECT cliente,
            emissao,
            julianday(emissao) - 
            julianday(LAG(emissao) OVER (PARTITION BY cliente ORDER BY emissao)) AS dias
    FROM pedidos_efetivos
)
SELECT cliente,
        ROUND(AVG(dias), 1) AS media_dias,
        COUNT(dias) AS intervalos
FROM intervalos
GROUP BY cliente
HAVING COUNT (dias) >= 1
ORDER BY media_dias ASC;