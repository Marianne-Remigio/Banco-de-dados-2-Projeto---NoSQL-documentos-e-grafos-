from database.conexao import executar_sql
from crud.crud_usuario import ler_usuario_existente
from crud.crud_filme import tratar_texto_sql


def filme_ja_assistido(username, titulo):
    username_sql = tratar_texto_sql(username)

    sql = f"""
    SELECT expand(out('Watch'))
    FROM User
    WHERE username = '{username_sql}'
    """

    resultado = executar_sql(sql)

    if not resultado or "result" not in resultado:
        return False

    for filme in resultado["result"]:
        if filme.get("title") == titulo:
            return True

    return False


def adicionar_filme_recomendado(lista, username, titulo, ano):
    if not titulo:
        return

    if filme_ja_assistido(username, titulo):
        return

    for filme in lista:
        if filme["title"] == titulo:
            return

    lista.append({
        "title": titulo,
        "year": ano
    })


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
        adicionar_filme_recomendado(
            filmes_recomendados,
            username,
            filme.get("title"),
            filme.get("year")
        )

    print(f"\n=== RECOMENDAÇÕES POR USUÁRIOS PARECIDOS PARA {username.upper()} ===")

    if len(filmes_recomendados) == 0:
        print("Nenhuma recomendação encontrada.")
        return

    for filme in filmes_recomendados[:5]:
        print(f"Título: {filme['title']} | Ano: {filme['year']}")


def recomendar_por_genero():
    username = ler_usuario_existente("Digite o nome do usuário para recomendar por gênero: ")
    username_sql = tratar_texto_sql(username)

    sql = f"""
    SELECT expand(in('HasGenre'))
    FROM (
        SELECT expand(out('Recommendation'))
        FROM User
        WHERE username = '{username_sql}'
    )
    """

    resultado = executar_sql(sql)

    if not resultado or "result" not in resultado:
        print("Não foi possível gerar recomendações por gênero.")
        return

    filmes_recomendados = []

    for filme in resultado["result"]:
        adicionar_filme_recomendado(
            filmes_recomendados,
            username,
            filme.get("title"),
            filme.get("year")
        )

    print(f"\n=== RECOMENDAÇÕES POR GÊNERO PARA {username.upper()} ===")

    if len(filmes_recomendados) == 0:
        print("Nenhuma recomendação por gênero encontrada.")
        return

    for filme in filmes_recomendados[:5]:
        print(f"Título: {filme['title']} | Ano: {filme['year']}")
