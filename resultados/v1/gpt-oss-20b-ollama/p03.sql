SELECT
    cliente,
    faturamento,
    ROUND((faturamento / total_faturamento) * 100.0, 2) AS percentual
FROM
    (SELECT cliente, SUM(faturamento) AS faturamento
     FROM pedidos_efetivos
     GROUP BY cliente) AS t
JOIN
    (SELECT SUM(faturamento) AS total_faturamento
     FROM pedidos_efetivos) AS total
ON 1=1
ORDER BY faturamento DESC
LIMIT 1;
