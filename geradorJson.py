from pip._vendor.colorama import Fore, Back


# Frescura para pintar letra
print(Fore.CYAN + "Bem vindo oa gerador de Json!\n", Fore.MAGENTA + "by " + Back.WHITE + "Kairo rs", Fore.RESET, Back.RESET)


# QUantidade de Json que vai gerar
quantidadeLote = int(input("Quantidade de Json: "))

# De qual ID vai começar, exemplo: No banco está no ID 270, digite 271 nesse campo
idPlus = int(input("Começa de qual id? "))

# Nome do arquivo sem o .txt, exemplo: jsons
# Vai sair jsons.txt
nome_arquivo = input('Nome do arquivo a ser editado (sem o .txt): ') + ".txt"


print("Processando...")

# Começa a escrever os JSON no arquivo txt
for i in range(quantidadeLote):
    # Abre o arquivo
    arquivo = open(nome_arquivo, 'a+')

    # Lê o arquivo
    texto = arquivo.readlines()


    # Pega o que leu do arquivo e acrescenta um novo JSON
    texto.append('''{
    "categorias": [
        {
        "codigoReferencia": "12",
        "descricao": "update descricao 1",
        "erpId": 100013,
        "id": 12,
        "inativo": true,
        "nome": "Teste Update De Categoria 20",
        "parent": 14
        }
    ],
    "codigo": "10",
    "codigoBarras": "0326526",
    "descricao": "The Earth Dragon Balls are about 7.5 cm (approximately 3 in) in diameter, and they summon a dragon named Shenron. They were created by Kami, and later re-created by Dende. Shenron can grant a wish within its powers as long as it does not create love, repeat a wish he previously granted, surpasses its creator's power, and meets a few more restrictions. Legitimate wishes include eternal youth, immortality, bringing back a scorched forest or even an annihilated planet.",
    "erpId":2605'''+ str(i+idPlus) + ''',
    "estoque": {
        "quantidade": 28,
        "quantidadeMinima": 11
    },
    "fabricante": {
        "id": 2,
        "erpId": 2,
        "inativo": true,
        "nome": "TESTE KAIRO" 
    },
    "inativo": true,
    "ncm": "51151",
    "nome": "Kairo Lote '''+ str(i+idPlus) +'''",
    "peso": 10,
    "referencia": "Celular",
    "tipoProduto": "Celular",
    "valorPreco": 60,
    "visibilidade": 2
    },''')

    # Escreve
    arquivo.writelines(texto)

    #Fecha o arquivo
    arquivo.close()

print("PROCESSADO!")