
# Defina uma função que, dada uma lista de nomes de pessoas, devolva essa lista ordenada 
# por ordem crescente do número de apelidos (todos menos o primeiro nome). 
# No caso de pessoas com o mesmo número de apelidos,devem ser listadas por ordem lexicográfica 
# do nome completo.

nomes = ["Jose Carlos Bacelar Almeida",
        "Maria Joao Frade",
        "Jose Bernardo Barros",
        "Jorge Manuel Matos Sousa Pinto",
        "Manuel Alcino Pereira Cunha",
        "Xico Esperto"]

lista_nomes = []

def num_apelidos(nome):
    apelidos = nome.split()
    n_a = len(apelidos) - 1
    return n_a

def apelidos(nomes):
    lista_nomes = sorted(nomes, key = lambda nome: (num_apelidos(nome), nome))
    return lista_nomes
        

        

    