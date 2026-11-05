
WITH pedidos_ordenados AS (
SELECT
cliente,
julianday(emissao) - julianday(LAG(emissao) OVER (PARTITION BY cliente ORDER BY emissao)) AS dias_intervalo
FROM pedidos_efetivos
)
SELECT
cliente,
COUNT(dias_intervalo) AS numero_intervalos,
ROUND(AVG(dias_intervalo), 1) AS media_dias_novo_pedido
FROM pedidos_ordenados
WHERE dias_intervalo IS NOT NULL
GROUP BY cliente
ORDER BY media_dias_novo_pedido ASC