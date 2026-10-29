WITH intervalos AS (
  SELECT
    cliente,
    julianday(emissao) - julianday(LAG(emissao) OVER (PARTITION BY cliente ORDER BY emissao)) AS dias_intervalo
  FROM pedidos_efetivos
)
SELECT
  cliente,
  ROUND(AVG(dias_intervalo), 2) AS media_dias_novo_pedido
FROM intervalos
WHERE dias_intervalo IS NOT NULL
GROUP BY cliente
ORDER BY media_dias_novo_pedido ASC;