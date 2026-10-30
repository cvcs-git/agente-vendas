-- P02: Qual o produto mais vendido este mês?
-- Regras: data de referência dos testes = 31/08/2026, então "este mês" = agosto de 2026
--         "mais vendido" (produto) = unidades líquidas, por código; excluir a nota com anomalia de escala
SELECT "#" AS codigo_produto,
    "Descrição" AS produto,
    CAST(SUM(Qnt) AS INTEGER) AS unidades
FROM vendas
WHERE strftime('%Y-%m', "Emissão") = '2026-08'
    AND Qnt % 1 = 0
GROUP BY "#", "Descrição"
ORDER BY unidades DESC;