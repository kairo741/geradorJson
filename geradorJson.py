
for i in range(30):
    arquivo = open("testee.txt", 'a+')
    texto = arquivo.readlines()



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
    "erpId":1548'''+ str(i+270) + ''',
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
    "nome": "Kairo Lote '''+ str(i+270) +'''",
    "peso": 10,
    "referencia": "Celular",
    "tipoProduto": "Celular",
    "valorPreco": 60,
    "visibilidade": 2
    },''')
    arquivo.writelines(texto)
    arquivo.close()