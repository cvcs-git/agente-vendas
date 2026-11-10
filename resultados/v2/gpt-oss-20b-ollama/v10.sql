SELECT
  CASE strftime('%w', emissao)
    WHEN '0' THEN 'Domingo'
    WHEN '1' THEN 'Segunda-feira'
    WHEN '2' THEN 'Terça-feira'
    WHEN '3' THEN 'Quarta-feira'
    WHEN '4' THEN 'Quinta-feira'
    WHEN '5' THEN 'Sexta-feira'
    WHEN '6' THEN 'Sábado'
  END AS dia_semana,
  ROUND(SUM(faturamento), 2) AS faturamento
FROM itens
GROUP BY dia_semana
ORDER BY faturamento DESC
LIMIT 1;
