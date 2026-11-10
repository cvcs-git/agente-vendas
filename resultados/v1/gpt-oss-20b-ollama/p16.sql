SELECT
    strftime('%Y-%m', Emissão) AS mes,
    SUM(Total) AS faturamento
FROM
    vendas
GROUP BY
    mes
ORDER BY
    faturamento DESC
LIMIT 1;
