-- Gold: itens de nota fiscal, prontos para o agente
-- Quantidades marcadas como suspeitas na silver ficam vazias, para não distorcer somas de unidades
DROP VIEW IF EXISTS itens;

CREATE VIEW itens AS
SELECT nota,
       pedido,
       emissao,
       mes,
       tipo,
       codigo_produto,
       descricao,
       produto_base,
       cliente,
       nome_fantasia,
       cidade_uf,
       vendedor,
       CASE WHEN quantidade_suspeita = 1 THEN NULL ELSE quantidade END AS quantidade,
       faturamento,
       valor_com_impostos
FROM silver_itens;