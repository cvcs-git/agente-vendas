-- Validação da view itens: mesmas linhas e mesmo faturamento da tabela vendas;
-- só as quantidades marcadas como suspeitas ficam vazias
SELECT (SELECT COUNT(*) FROM vendas) AS linhas_vendas,
       COUNT(*) AS linhas_itens,
       (SELECT ROUND(SUM(Total), 2) FROM vendas) AS faturamento_vendas,
       ROUND(SUM(faturamento), 2) AS faturamento_itens,
       SUM(CASE WHEN quantidade IS NULL THEN 1 ELSE 0 END) AS quantidades_vazias
FROM itens;