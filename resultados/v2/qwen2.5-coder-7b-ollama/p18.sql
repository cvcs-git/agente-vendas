SELECT DISTINCT cliente, nome_fantasia
FROM itens
WHERE descricao LIKE '%alça%'
AND emissao <= '2026-08-31 23:59:59'
