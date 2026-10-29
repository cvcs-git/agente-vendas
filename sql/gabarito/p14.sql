-- P14: Quantos clientes, somados, respondem por 80% do faturamento?
-- Regras: faturamento líquido; clientes ordenados do maior para o menor;
--         resposta = menor número de clientes cujo percentual acumulado alcança pelo menos 80%
WITH por_cliente AS (
    SELECT "Razão Social" AS cliente,
        SUM(Total) AS faturamento
    FROM vendas
    GROUP BY "Razão Social"
),
acumulado AS (
    SELECT cliente,
            faturamento,
            SUM (faturamento) OVER (ORDER BY faturamento DESC ROWS UNBOUNDED PRECEDING)
                * 100.0 / SUM (faturamento) OVER () AS pct_acumulado
    FROM por_cliente 
)
SELECT cliente,
        ROUND(faturamento, 2) AS faturamento,
        ROUND(pct_acumulado, 1) AS pct_acumulado
FROM acumulado
ORDER BY faturamento DESC;