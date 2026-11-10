SELECT SUM(Qnt) AS unidades
FROM vendas
WHERE (produto_base = 'FRASCO 500ML' OR Descrição LIKE '%FRASCO 500ML%')
  AND strftime('%Y-%m', Emissão) = '2026-08'
  AND Nota <> 'NFe 2217';
