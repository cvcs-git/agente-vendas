-- P13: Quais clientes cresceram e quais caíram em faturamento do 1º para o 2º trimestre de 2026?
-- Regras: faturamento líquido; variação % = (T2 − T1) / T1 × 100
WITH trimestres AS (
    SELECT "Razão Social" AS cliente,
        SUM(CASE WHEN strftime ('%m', "Emissão") IN ('01', '02', '03') THEN Total ELSE 0 END) AS t1,
        SUM(CASE WHEN strftime ('%m', "Emissão") IN ('04', '05', '06') THEN Total ELSE 0 END) AS t2
    FROM vendas
    WHERE strftime('%Y', "Emissão") = '2026'
    GROUP BY "Razão Social"
)
SELECT cliente,
    ROUND (t1, 2) AS faturamento_t1,
    ROUND (t2, 2) AS faturamento_t2,
    ROUND ((t2 - t1) * 100.0 / t1, 1) AS variacao_pct
FROM trimestres
ORDER BY variacao_pct DESC;