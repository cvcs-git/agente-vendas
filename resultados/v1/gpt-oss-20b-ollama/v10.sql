SELECT 
  CASE strftime('%w', Emissão)
    WHEN '0' THEN 'Domingo'
    WHEN '1' THEN 'Segunda-feira'
    WHEN '2' THEN 'Terça-feira'
    WHEN '3' THEN 'Quarta-feira'
    WHEN '4' THEN 'Quinta-feira'
    WHEN '5' THEN 'Sexta-feira'
    WHEN '6' THEN 'Sábado'
  END AS DiaSemana,
  SUM(Total) AS Faturamento
FROM vendas
WHERE Nota <> 'NFe 2217'
GROUP BY strftime('%w', Emissão)
ORDER BY Faturamento DESC
LIMIT 1;
