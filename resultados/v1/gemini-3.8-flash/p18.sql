SELECT DISTINCT "Razão Social"
FROM "vendas"
WHERE (
    LOWER("produto_base") LIKE '%alça%' 
    OR LOWER("produto_base") LIKE '%alca%' 
    OR LOWER("Descrição") LIKE '%alça%' 
    OR LOWER("Descrição") LIKE '%alca%'
  )
  AND "Nota" != 'NFe 2217'
GROUP BY "Razão Social"
HAVING SUM("Qnt") > 0
ORDER BY "Razão Social";