-- P03: Qual o maior cliente em faturamento, e que percentual do total ele representa?
-- Regras: maior cliente = faturamento líquido; cliente identificado pela Razão Social
SELECT "Razão Social" AS cliente,
    ROUND(SUM(Total), 2) AS faturamento,
    ROUND(SUM(Total) * 100.0 / (SELECT SUM(Total) FROM vendas), 1) AS pct_do_total
FROM vendas
GROUP BY "Razão Social"
ORDER BY SUM (Total) DESC
LIMIT 1;    