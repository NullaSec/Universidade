# APELIDOS
'''
Defina uma função que, dada uma lista de nomes de pessoas, devolva essa lista ordenada
por ordem crescente do número de apelidos (todos menos o primeiro nome). No caso de pessoas com o mesmo número de apelidos,
devem ser listadas por ordem lexicográfica do nome completo.
'''

# return lista de apelidos ordenados por tamanho
# caso dois apelidos tenham o mesmo tamanho ordenar alfabeticamente

nomes = ['Jose Carlos Bacelar Almeida', 'Maria Joao Frade', 'Jose Bernardo Barros', 'Jorge Manuel Matos Sousa Pinto', 'Manuel Alcino Pereira Cunha', 'Xico Esperto']

def apelidos(nomes):
    num_apelidos = sorted(nomes, key = lambda apelido: (len(apelido.split()), apelido))

    return num_apelidos

apelidos(nomes)
