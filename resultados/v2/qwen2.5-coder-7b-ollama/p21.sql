SELECT MAX(mes) AS mes_ultima_compra
FROM itens
WHERE cliente LIKE '%delta%' OR nome_fantasia LIKE '%delta%'
  AND descricao LIKE '%tampa preta%'
