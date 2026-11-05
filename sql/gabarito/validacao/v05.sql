-- V05: Qual porcentagem do que foi pago pela Alfa esse ano foi em imposto?
-- Esperado: 1.8 (impostos de 36057.12 sobre 2000239.52 pagos)
SELECT cliente,
       ROUND(SUM(valor_com_impostos), 2) AS pago_com_impostos,
       ROUND(SUM(valor_com_impostos) - SUM(faturamento), 2) AS impostos,
       ROUND(100.0 * (SUM(valor_com_impostos) - SUM(faturamento)) / SUM(valor_com_impostos), 1) AS percentual_impostos
FROM itens
WHERE cliente LIKE '%ALFA%' OR nome_fantasia LIKE '%ALFA%'
GROUP BY cliente
