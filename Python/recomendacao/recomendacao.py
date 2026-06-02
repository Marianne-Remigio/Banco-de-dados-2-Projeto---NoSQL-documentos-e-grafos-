from database.conexao import executar_sql
from crud.crud_usuario import ler_usuario_existente
from crud.crud_filme import tratar_texto_sql


def recomendar_filmes():
    username = ler_usuario_existente("Digite o nome do usuário para recomendar filmes: ")
    username_sql = tratar_texto_sql(username)

    sql = f"""
    SELECT expand(out('Watch').in('Watch').out('Watch'))
    FROM User
    WHERE username = '{username_sql}'
    """

    resultado = executar_sql(sql)

    if not resultado or "result" not in resultado:
        print("Não foi possível gerar recomendações.")
        return

    filmes_recomendados = []

    for filme in resultado["result"]:
        titulo = filme.get("title")
        ano = filme.get("year")

        if titulo and not filme_ja_assistido(username, titulo):
            if titulo not in [f["title"] for f in filmes_recomendados]:
                filmes_recomendados.append({
                    "title": titulo,
                    "year": ano
                })

    print(f"\n=== RECOMENDAÇÕES PARA {username.upper()} ===")

    if len(filmes_recomendados) == 0:
        print("Nenhuma recomendação encontrada.")
        return

    for filme in filmes_recomendados[:5]:
        print(f"Título: {filme['title']} | Ano: {filme['year']}")


def filme_ja_assistido(username, titulo):
    username_sql = tratar_texto_sql(username)
    titulo_sql = tratar_texto_sql(titulo)

    sql = f"""
    SELECT FROM Watch
    WHERE out IN (SELECT FROM User WHERE username = '{username_sql}')
    AND in IN (SELECT FROM Movie WHERE title = '{titulo_sql}')
    """

    resultado = executar_sql(sql)

    return resultado and len(resultado.get("result", [])) > 0
