SELECT SUM(Qnt) AS total_tampas_26
FROM vendas
WHERE "#" = 26
  AND strftime('%m', Emissão) = '01'
  AND strftime('%Y', Emissão) = strftime('%Y', 'now')
  AND Nota <> 'NFe 2217';
