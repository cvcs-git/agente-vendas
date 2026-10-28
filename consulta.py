import sqlite3
import sys

CAMINHO_DB = "data/vendas_sintetico.db"

def executar (caminho_sql):
    with open (caminho_sql,encoding = "utf-8") as arquivo:
        sql = arquivo.read()

    conexao = sqlite3.connect(f"file:{CAMINHO_DB}?mode=ro", uri=True)
    cursor = conexao.execute(sql)

    colunas = [coluna[0] for coluna in cursor.description]
    print(" | ".join(colunas))
    for linha in cursor.fetchall():
        print(" | ".join (str(valor) for valor in linha))

    conexao.close()


if __name__ == "__main__":
    executar(sys.argv[1])