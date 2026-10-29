# Teste manual v1: condições e critérios

## Condições do teste
- Prompt de sistema: prompts/sistema_v1.md
- Banco: data/vendas_sintetico.db, com a view pedidos_efetivos
- Data de referência: 31/08/2026
- Temperatura: 0
- Uma conversa nova para cada pergunta
- Uma rodada por pergunta (as repetições ficam para os testes automatizados)
- Commit do projeto no início do teste: (preencher com o resultado de git log -1 --oneline)

## Critérios de correção
- A SQL gerada é executada com consulta.py, e o resultado é comparado com o do gabarito (sql/gabarito/).
- Colunas extras ou com outros nomes são aceitas, desde que os valores pedidos estejam presentes.
- A ordem das linhas só conta quando a pergunta pede um ranking ou "o maior/o menor".
- Diferenças de arredondamento de até 0,1 são aceitas.
- Resposta parcial conta como errada (ex.: acertou o vencedor, mas os valores do ranking estão errados).
- P04 e P12: correto se a resposta começar com "SEM DADOS".
- P16: correto se a resposta começar com "ESCLARECER".
- Se a SQL não roda, resultado_correto = nao.

## Respostas brutas
- Cada resposta do modelo é salva em resultados/v1/<modelo>/<pergunta>.sql
  (ou .txt nas perguntas sem SQL: P04, P12, P16).