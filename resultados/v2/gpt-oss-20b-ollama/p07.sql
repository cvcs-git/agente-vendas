WITH diffs AS (
  SELECT
    cliente,
    julianday(emissao) - julianday(LAG(emissao) OVER (PARTITION BY cliente ORDER BY emissao)) AS dias
  FROM pedidos_efetivos
)
SELECT
  cliente,
  ROUND(AVG(dias), 2) AS avg_dias,
  COUNT(dias) AS num_intervalos,
  CASE WHEN ROUND(AVG(dias), 2) = MIN(ROUND(AVG(dias), 2)) OVER () THEN 'Sim' ELSE 'Não' END AS leva_menos_tempo
FROM diffs
WHERE dias IS NOT NULL
GROUP BY cliente
ORDER BY avg_dias ASC;
