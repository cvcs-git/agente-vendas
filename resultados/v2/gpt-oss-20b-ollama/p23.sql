SELECT codigo_produto,
       SUM(CASE WHEN mes IN ('2026-01','2026-02') THEN quantidade ELSE 0 END) AS unidades_primeiro_bimestre,
       SUM(CASE WHEN mes IN ('2026-03','2026-04') THEN quantidade ELSE 0 END) AS unidades_segundo_bimestre,
       (SUM(CASE WHEN mes IN ('2026-03','2026-04') THEN quantidade ELSE 0 END) -
        SUM(CASE WHEN mes IN ('2026-01','2026-02') THEN quantidade ELSE 0 END)) AS aumento
FROM itens
WHERE mes IN ('2026-01','2026-02','2026-03','2026-04')
GROUP BY codigo_produto
ORDER BY aumento DESC
LIMIT 1;
