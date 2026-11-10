```sql
SELECT 
    ROUND((SUM(faturamento_com_impostos) - SUM(faturamento)) / SUM(faturamento) * 100, 1) AS porcentagem_imposto
FROM 
    itens
WHERE 
    cliente LIKE '%alfa%' 
    OR nome_fantasia LIKE '%alfa%'
    AND mes BETWEEN '2023-01' AND '2023-12';
```
