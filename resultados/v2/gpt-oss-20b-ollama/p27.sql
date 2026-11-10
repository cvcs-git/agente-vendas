WITH totals AS (
  SELECT
    cliente,
    codigo_produto,
    SUM(quantidade) AS unidades,
    ROW_NUMBER() OVER (PARTITION BY cliente ORDER BY SUM(quantidade) DESC) AS rn
  FROM itens
  GROUP BY cliente, codigo_produto
)
SELECT
  cliente,
  codigo_produto,
  unidades
FROM totals
WHERE rn = 1
ORDER BY cliente;
