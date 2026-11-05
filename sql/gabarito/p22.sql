-- P22: Me diga quanto foi gasto por Delta, em tampa 26, no mês de março
-- Esperado: 1890.4 (sem impostos) ou 1984.92 (com impostos); ambos aceitos
SELECT cliente,
       ROUND(SUM(faturamento), 2) AS sem_impostos,
       ROUND(SUM(valor_com_impostos), 2) AS com_impostos
FROM itens
WHERE (cliente LIKE '%DELTA%' OR nome_fantasia LIKE '%DELTA%')
  AND descricao LIKE '%TAMPA%26MM%'
  AND mes = '2026-03'
GROUP BY cliente
