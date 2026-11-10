SELECT
  "#" AS produto,
  SUM(CASE WHEN strftime('%m', Emissão) IN ('01','02') THEN Qnt ELSE 0 END) AS unidades_primeiro_bimestre,
  SUM(CASE WHEN strftime('%m', Emissão) IN ('03','04') THEN Qnt ELSE 0 END) AS unidades_segundo_bimestre,
  SUM(CASE WHEN strftime('%m', Emissão) IN ('03','04') THEN Qnt ELSE 0 END) -
  SUM(CASE WHEN strftime('%m', Emissão) IN ('01','02') THEN Qnt ELSE 0 END) AS aumento
FROM vendas
WHERE Nota <> 'NFe 2217'
  AND strftime('%Y', Emissão) = strftime('%Y', 'now')
GROUP BY "#"
ORDER BY aumento DESC
LIMIT 1;
