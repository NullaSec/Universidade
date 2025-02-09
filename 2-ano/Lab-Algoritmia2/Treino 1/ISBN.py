livros = {
    "Todos os nomes": "9789720047572",
    "Ensaio sobre a cegueira": "9789896604011",
    "Memorial do convento": "9789720046711",
    "Os cus de Judas": "9789722036757"
}

def isbn(livros):
    invalidos = []

    for titulo, isbn in livros.items():
        nums = [int(x) for x in isbn]

        total = 0
        for i in range(12):
            if i % 2 == 0:
                total += nums[i] * 1
            else:
                total += nums[i] * 3

        if (total + nums[12]) % 10 != 0:
            invalidos.append(titulo)

    return sorted(invalidos)
