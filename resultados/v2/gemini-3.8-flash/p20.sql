SELECT MAX(emissao) AS ultima_compra FROM itens WHERE (descricao LIKE
'%corneto%' OR produto_base LIKE '%corneto%') AND tipo = 'venda'
