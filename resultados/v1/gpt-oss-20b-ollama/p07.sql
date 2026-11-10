```sql
-- Média de dias entre pedidos por cliente
SELECT
    cliente,
    ROUND(AVG(julianday(emissao) - julianday(prev_emissao)), 2) AS tempo_medio
FROM (
    SELECT
        cliente,
        emissao,
        LAG(emissao) OVER (PARTITION BY cliente ORDER BY emissao) AS prev_emissao
    FROM pedidos_efetivos
) AS sub
WHERE prev_emissao IS NOT NULL
GROUP BY cliente
ORDER BY tempo_medio;

-- Cliente que leva menos tempo para fazer um novo pedido
SELECT
    cliente,
    ROUND(AVG(julianday(emissao) - julianday(prev_emissao)), 2) AS tempo_medio
FROM (
    SELECT
        cliente,
        emissao,
        LAG(emissao) OVER (PARTITION BY cliente ORDER BY emissao) AS prev_emissao
    FROM pedidos_efetivos
) AS sub
WHERE prev_emissao IS NOT NULL
GROUP BY cliente
ORDER BY tempo_medio
LIMIT 1;
```
