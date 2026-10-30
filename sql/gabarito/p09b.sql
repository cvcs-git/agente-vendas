-- P09b: Qual vendedor teve o maior volume de vendas em maio de 2026?
-- Regra: "volume" = unidades líquidas, excluindo a nota com anomalia de escala
SELECT Vendedor, 
        CAST(SUM(Qnt) AS INTERGER) AS unidades
FROM vendas
WHERE strftime ('%Y-%m', "Emissão") = '2026-05'
    AND Qnt % 1 = 0
GROUP BY Vendedor 
ORDER BY unidades DESC;
