# Teste manual v1: condições e critérios

## Condições do teste
- Prompt de sistema: prompts/sistema_v1.md
- Banco: data/vendas_sintetico.db, com a view pedidos_efetivos
- Data de referência: 31/08/2026
- Temperatura: 0, quando o modelo permitir
- Uma conversa nova para cada pergunta
- Uma rodada por pergunta (as repetições ficam para os testes automatizados)
- Commit do projeto no início do teste: aa3a96f Prompt do sistema v1 e estrutura de teste manual
- Gemini: thinking level Medium; Grounding with Google Search desligado; temperatura padrão (não ajustável)
- openai/gpt-oss-20b (Groq): temperatura 0; reasoning effort medium; max completion tokens 8192; ferramentas desligadas

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

## Teste manual v2
- Prompt de sistema: prompts/sistema_v2.md
- Banco: data/vendas_sintetico.db, com a camada silver (silver_itens) e as views gold (itens, pedidos_efetivos)
- Gabarito: P02, P06 e P09b passam a excluir só as linhas com quantidade fracionária (P06: código 443 = 4269000)
- Commit do projeto no início do teste: f76ac08 Prompt de sistema v2 e estrutura do teste manual v2
- openai/gpt-oss-20b (Groq): mesma configuração da v1 (temperatura 0; reasoning effort medium; max completion tokens 8192; ferramentas desligadas)
- Critérios de correção: os mesmos da v1
- Respostas brutas em resultados/v2/<modelo>/
- Limitação: a v2 muda o prompt e a camada de dados ao mesmo tempo; o resultado mede o efeito combinado, não o de cada mudança isoladamente