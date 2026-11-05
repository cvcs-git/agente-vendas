
SELECT cliente,
ROUND((SUM(valor_com_impostos) - SUM(faturamento)) * 100.0 / SUM(valor_com_impostos), 1) AS perc_impostos
FROM itens
WHERE (cliente LIKE '%Alfa%' OR nome_fantasia LIKE '%Alfa%')
AND mes LIKE '2026-%'
GROUP BY cliente