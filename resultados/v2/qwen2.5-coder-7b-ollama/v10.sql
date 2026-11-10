SELECT strftime('%w', emissao) AS dia_semana, SUM(faturamento) AS faturamento
FROM itens
WHERE mes = '2026-08'
GROUP BY dia_semana
ORDER BY faturamento DESC
LIMIT 1
