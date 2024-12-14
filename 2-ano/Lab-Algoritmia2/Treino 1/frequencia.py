# Neste problem pretende-se que defina uma função que, dada uma string com palavras, 
# devolva uma lista com as palavras nela contidas ordenada por ordem de frequência,
# da mais alta para a mais baixa. Palavras com a mesma frequência devem ser listadas 
# por ordem alfabética.

texto = "o tempo perguntou ao tempo quanto tempo o tempo tem"

def frequencia(texto):
    palavras = texto.split()
    
    pOrdenadas = sorted(set(palavras), key=lambda palavra: (-palavras.count(palavra), palavra))
    
    return pOrdenadas