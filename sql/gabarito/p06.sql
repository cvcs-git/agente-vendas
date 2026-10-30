-- P06: Qual foi o produto mais vendido em 2026?
-- Regras: "mais vendido" (produto) = unidades líquidas, por código; excluir a nota com anomalia de escala
SELECT "#" AS codigo_produto,
    "Descrição" AS produto,
    CAST(SUM(Qnt) AS INTEGER) AS unidades
FROM vendas
WHERE strftime('%Y', "Emissão") = '2026'
    AND Qnt % 1 = 0
GROUP BY "#", "Descrição"
ORDER BY unidades DESC;
