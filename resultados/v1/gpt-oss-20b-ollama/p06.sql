SELECT
    "#" AS produto_codigo,
    "Descrição" AS produto_descricao,
    SUM("Qnt") AS unidades_vendidas
FROM vendas
WHERE strftime('%Y', "Emissão") = '2026'
  AND "Nota" <> 'NFe 2217'
GROUP BY "#", "Descrição"
ORDER BY unidades_vendidas DESC
LIMIT 1;
