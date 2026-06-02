from database.conexao import executar_sql

ANO_MINIMO = 1888
ANO_MAXIMO = 2026


def tratar_texto_sql(texto):
    return texto.replace("'", "''")


def ler_titulo(mensagem):
    while True:
        titulo = input(mensagem).strip()

        if titulo == "":
            print("O título não pode ficar vazio.")
            continue

        return titulo


def ler_ano():
    while True:
        try:
            ano = int(input("Digite o ano do filme: "))

            if ano < ANO_MINIMO or ano > ANO_MAXIMO:
                print(f"Ano inválido. Digite entre {ANO_MINIMO} e {ANO_MAXIMO}.")
                continue

            return ano

        except ValueError:
            print("Digite apenas números.")


def filme_existe(titulo):
    titulo_sql = tratar_texto_sql(titulo)
    sql = f"SELECT FROM Movie WHERE title = '{titulo_sql}'"
    resultado = executar_sql(sql)

    return resultado and len(resultado.get("result", [])) > 0


def ler_filme_existente(mensagem):
    while True:
        titulo = ler_titulo(mensagem)

        if filme_existe(titulo):
            return titulo

        print("Filme não encontrado. Tente novamente.")


def ler_filme_inexistente(mensagem):
    while True:
        titulo = ler_titulo(mensagem)

        if not filme_existe(titulo):
            return titulo

        print("Já existe um filme com esse título. Tente outro.")


def cadastrar_filme():
    titulo = ler_filme_inexistente("Digite o título do filme: ")
    ano = ler_ano()

    titulo_sql = tratar_texto_sql(titulo)
    sql = f"INSERT INTO Movie SET title = '{titulo_sql}', year = {ano}"
    resultado = executar_sql(sql)

    if resultado:
        print("Filme cadastrado com sucesso!")


def listar_filmes():
    resultado = executar_sql("SELECT FROM Movie ORDER BY title")

    if resultado and "result" in resultado:
        print("\n=== LISTA DE FILMES ===")

        if len(resultado["result"]) == 0:
            print("Nenhum filme cadastrado.")
            return

        for filme in resultado["result"]:
            print(f"Título: {filme.get('title')} | Ano: {filme.get('year')}")


def atualizar_filme():
    titulo = ler_filme_existente("Digite o título do filme que deseja atualizar: ")

    novo_titulo = ler_titulo("Digite o novo título: ")

    while novo_titulo != titulo and filme_existe(novo_titulo):
        print("Já existe outro filme com esse novo título. Tente outro.")
        novo_titulo = ler_titulo("Digite o novo título: ")

    novo_ano = ler_ano()

    titulo_sql = tratar_texto_sql(titulo)
    novo_titulo_sql = tratar_texto_sql(novo_titulo)

    sql = f"UPDATE Movie SET title = '{novo_titulo_sql}', year = {novo_ano} WHERE title = '{titulo_sql}'"
    resultado = executar_sql(sql)

    if resultado:
        print("Filme atualizado com sucesso!")


def deletar_filme():
    titulo = ler_filme_existente("Digite o título do filme que deseja deletar: ")

    titulo_sql = tratar_texto_sql(titulo)
    sql = f"DELETE FROM Movie WHERE title = '{titulo_sql}'"
    resultado = executar_sql(sql)

    if resultado:
        print("Filme deletado com sucesso!")
