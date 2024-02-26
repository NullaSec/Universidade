#FREQUENCIA
'''
Neste problem pretende-se que defina uma função que, dada uma string com palavras,
devolva uma lista com as palavras nela contidas ordenada por ordem de frequência,
da mais alta para a mais baixa. Palavras com a mesma frequência devem ser listadas
por ordem alfabética.
'''

# return lista com palavras ordenadas por frequência
# mesma frequência deve ser listado alfabeticamente

texto = "o tempo perguntou ao tempo quanto tempo o tempo tem"

def frequencia(texto):
    palavras = texto.split()
    contagem = {}

    for palavra in palavras:
        if palavra in contagem:
            contagem[palavra] += 1
        else:
            contagem[palavra] = 1

    freq = sorted(contagem, key=lambda palavra: (-contagem[palavra], palavra))

    return freq






