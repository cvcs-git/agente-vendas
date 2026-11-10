SELECT ROUND(
    CASE
        WHEN SUM(valor_com_impostos) = 0 THEN 0
        ELSE (SUM(valor_com_impostos - faturamento) / SUM(valor_com_impostos)) * 100
    END,
    1
) AS percentual_imposto
FROM itens
WHERE (cliente LIKE '%Alfa%' OR nome_fantasia LIKE '%Alfa%')
  AND mes LIKE '2026-%';
