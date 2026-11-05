-- V10: Em qual dia da semana a empresa fatura mais?
-- Esperado: quinta-feira, 917387.2 (por pedidos_efetivos: 938056.8; também quinta)
SELECT CASE strftime('%w', emissao)
         WHEN '0' THEN 'domingo' WHEN '1' THEN 'segunda' WHEN '2' THEN 'terça'
         WHEN '3' THEN 'quarta' WHEN '4' THEN 'quinta' WHEN '5' THEN 'sexta'
         WHEN '6' THEN 'sábado' END AS dia_semana,
       ROUND(SUM(faturamento), 2) AS faturamento
FROM itens
GROUP BY strftime('%w', emissao)
ORDER BY faturamento DESC
