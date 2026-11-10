SELECT
    "#" AS produto_codigo,
    "Descrição" AS produto_descricao,
    SUM(Qnt) AS total_unidades
FROM vendas
WHERE strftime('%Y-%m', Emissão) = strftime('%Y-%m', 'now')
  AND Nota <> 'NFe 2217'
GROUP BY "#", "Descrição"
ORDER BY total_unidades DESC
LIMIT 1;
