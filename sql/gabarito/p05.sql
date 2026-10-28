-- P05: Qual foi o faturamento de julho de 2026?
-- Regra: faturamento = soma de Total (sem impostos), incluindo cancelamentos (linhas negativas)
SELECT ROUND(SUM(TOTAL), 2) AS faturamento
FROM vendas
WHERE strftime ('%Y-%m', "Emissão") = '2026-07'