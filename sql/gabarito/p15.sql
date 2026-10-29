-- P15: O faturamento mensal de 2026 está crescendo ou caindo?
-- Regras: compara a média mensal de jan–abr com a de mai–ago (faturamento líquido)
--         Cautela: com menos de 12 meses de histórico, a resposta precisa de ressalva sobre a oscilação
WITH mensal AS (
    SELECT strftime('%m', "Emissão") AS mes,
            SUM(Total) AS faturamento
    FROM vendas
    WHERE strftime('%Y', "Emissão") = '2026'
    GROUP BY mes
)
SELECT ROUND(AVG(CASE WHEN mes IN ('01', '02', '03', '04')THEN faturamento END), 2) AS media_jan_abr,
        ROUND(AVG(CASE WHEN mes IN('05', '06', '07', '08')THEN faturamento END), 2) AS media_mai_ago,
        ROUND((AVG(CASE WHEN mes IN('05', '06', '07', '08')THEN faturamento END) - 
                AVG(CASE WHEN mes IN('01', '02', '03', '04')THEN faturamento END)) * 100.0 / 
                AVG (CASE WHEN mes IN('01', '02', '03', '04')THEN faturamento END), 1) AS variacao_pct
FROM mensal;    