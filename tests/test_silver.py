import pandas as pd

from construir_camadas import construir_silver


def vendas_exemplo():
    return pd.DataFrame({
        "Nota": ["NFe 1", "NFe 1", "NFe 2", "NFe 3"],
        "Venda": [10, 10, 11, 12],
        "Emissão": ["2026-07-01 08:00:00", "2026-07-01 08:00:00",
                    "2026-07-02 09:00:00", "2026-08-05 10:00:00"],
        "#": [97, 439, 97, 439],
        "Descrição": ["TAMPA", "FRASCO", "TAMPA", "FRASCO"],
        "produto_base": ["TAMPA", "FRASCO", "TAMPA", "FRASCO"],
        "Razão Social": ["CLIENTE A", "CLIENTE A", "CLIENTE A", "CLIENTE B"],
        "Nome Fantasia": ["A", "A", "A", None],
        "Cidade/UF": ["RECIFE/PE"] * 4,
        "Vendedor": ["VENDEDOR A", "VENDEDOR A", "VENDEDOR A", "VENDEDOR B"],
        "Prazo": ["28"] * 4,
        "Qnt": [1000.0, 500.0, -1000.0, 0.0387],
        "Total": [68.0, 425.0, -68.0, 32895.0],
        "Total NF": [71.4, 425.0, -71.4, 32895.0],
    })


def test_preserva_linhas_e_faturamento():
    vendas = vendas_exemplo()
    silver = construir_silver(vendas)
    assert len(silver) == len(vendas)
    assert silver["faturamento"].sum() == vendas["Total"].sum()


def test_renomeia_colunas_e_remove_as_nao_usadas():
    silver = construir_silver(vendas_exemplo())
    assert "codigo_produto" in silver.columns
    assert "cliente" in silver.columns
    assert "Prazo" not in silver.columns
    assert "#" not in silver.columns


def test_mes_e_tipo():
    silver = construir_silver(vendas_exemplo())
    assert list(silver["mes"]) == ["2026-07", "2026-07", "2026-07", "2026-08"]
    assert list(silver["tipo"]) == ["venda", "venda", "cancelamento", "venda"]


def test_marca_quantidade_fracionaria_sem_alterar_o_valor():
    silver = construir_silver(vendas_exemplo())
    assert list(silver["quantidade_suspeita"]) == [0, 0, 0, 1]
    assert silver["quantidade"].iloc[3] == 0.0387