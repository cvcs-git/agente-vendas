"""Roda as perguntas do índice num modelo local do Ollama e salva as respostas brutas.
 
Uso:
    python rodar_lote.py <modelo> <versao> [--raciocinio medium] [--ids P01 V03 ...] [--refazer]
 
Exemplos:
    python rodar_lote.py qwen2.5-coder:7b v1
    python rodar_lote.py gpt-oss:20b v2 --raciocinio medium
 
As respostas vão para resultados/<versao>/<modelo>-ollama/<id>.sql (ou .txt para
SEM DADOS e ESCLARECER), sem nenhuma alteração no texto devolvido pelo modelo.
Perguntas que já têm resposta salva são puladas, a menos que se use --refazer;
assim, se o lote for interrompido, basta rodar o mesmo comando de novo.
Os tempos e eventuais erros ficam em _tempos.csv, na mesma pasta.
"""
import argparse
import csv
import os
from datetime import datetime
 
from perguntar import perguntar
 
INDICE = "perguntas_avaliacao.csv"
CONTEXTO = 8192  # mesmo valor usado no perguntar.py
 
 
def ler_perguntas(ids=None):
    with open(INDICE, encoding="utf-8-sig", newline="") as arquivo:
        linhas = list(csv.DictReader(arquivo, delimiter=";"))
    if ids:
        procurados = {i.upper() for i in ids}
        linhas = [l for l in linhas if l["id"].upper() in procurados]
    return [(l["id"], l["pergunta"]) for l in linhas]
 
 
def extensao(texto):
    inicio = texto.lstrip().upper()
    if inicio.startswith("SEM DADOS") or inicio.startswith("ESCLARECER"):
        return ".txt"
    return ".sql"
 
 
def ja_respondida(pasta, id_pergunta):
    base = os.path.join(pasta, id_pergunta.lower())
    return os.path.exists(base + ".sql") or os.path.exists(base + ".txt")
 
 
def main():
    parser = argparse.ArgumentParser(description="Roda as perguntas do índice num modelo do Ollama")
    parser.add_argument("modelo", help="ex.: qwen2.5-coder:7b")
    parser.add_argument("versao", help="versão do prompt, ex.: v1")
    parser.add_argument("--raciocinio", help="ex.: medium (só para gpt-oss)")
    parser.add_argument("--ids", nargs="+", help="rodar só estas perguntas, ex.: P01 V03")
    parser.add_argument("--refazer", action="store_true", help="refaz perguntas já respondidas")
    args = parser.parse_args()
 
    arquivo_prompt = os.path.join("prompts", f"sistema_{args.versao}.md")
    with open(arquivo_prompt, encoding="utf-8") as arquivo:
        prompt_sistema = arquivo.read()
 
    pasta = os.path.join("resultados", args.versao, args.modelo.replace(":", "-") + "-ollama")
    os.makedirs(pasta, exist_ok=True)
    arquivo_tempos = os.path.join(pasta, "_tempos.csv")
    novo_log = not os.path.exists(arquivo_tempos)
 
    perguntas = ler_perguntas(args.ids)
    print(f"{len(perguntas)} perguntas | modelo {args.modelo} | prompt {arquivo_prompt} | saída {pasta}")
 
    with open(arquivo_tempos, "a", encoding="utf-8", newline="") as log:
        escritor = csv.writer(log, delimiter=";")
        if novo_log:
            escritor.writerow(["data", "modelo", "versao", "raciocinio", "num_ctx", "id", "segundos", "arquivo", "erro"])
 
        for n, (id_pergunta, pergunta) in enumerate(perguntas, start=1):
            if ja_respondida(pasta, id_pergunta) and not args.refazer:
                print(f"[{n}/{len(perguntas)}] {id_pergunta}: já respondida, pulando")
                continue
 
            data = datetime.now().strftime("%d/%m/%Y %H:%M")
            try:
                texto, segundos = perguntar(args.modelo, prompt_sistema, pergunta, args.raciocinio, CONTEXTO)
            except Exception as erro:  # registra e segue para a próxima pergunta
                print(f"[{n}/{len(perguntas)}] {id_pergunta}: ERRO {erro}")
                escritor.writerow([data, args.modelo, args.versao, args.raciocinio or "", CONTEXTO,
                                   id_pergunta, "", "", str(erro)])
                log.flush()
                continue
 
            saida = os.path.join(pasta, id_pergunta.lower() + extensao(texto))
            with open(saida, "w", encoding="utf-8") as arquivo:
                arquivo.write(texto + "\n")
 
            escritor.writerow([data, args.modelo, args.versao, args.raciocinio or "", CONTEXTO,
                               id_pergunta, f"{segundos:.1f}", saida, ""])
            log.flush()
            print(f"[{n}/{len(perguntas)}] {id_pergunta}: {segundos:.1f} s -> {saida}")
 
 
if __name__ == "__main__":
    main()