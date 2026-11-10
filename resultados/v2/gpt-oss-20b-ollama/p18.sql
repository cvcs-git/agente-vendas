SELECT DISTINCT cliente
FROM itens
WHERE (descricao LIKE '%alça%' OR descricao LIKE '%alças%')
  AND mes <= '2026-08'
  AND tipo = 'venda'
  AND quantidade > 0
ORDER BY cliente;
