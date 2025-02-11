
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

def apelidos(nomes):
    dicNomes = {}
    for nome in nomes:
        apelidos = nome.split()
        dicNomes[nome]=len(apelidos) - 1
        
    print(dicNomes)
    
    ordenados = sorted(nomes, key = lambda x: (dicNomes[x], x))
        
    return ordenados
        

        

    
