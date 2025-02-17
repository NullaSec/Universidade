def tabela(jogos):
    classificacoes = {}

    for jogo in jogos:
        equipa1, golos1, equipa2, golos2 = jogo

        if equipa1 not in classificacoes:
            classificacoes[equipa1] = [0, 0]  # [pontos, diferença de golos]
        if equipa2 not in classificacoes:
            classificacoes[equipa2] = [0, 0]

        if golos1 > golos2:
            classificacoes[equipa1][0] += 3
        elif golos1 < golos2:
            classificacoes[equipa2][0] += 3
        else:
            classificacoes[equipa1][0] += 1
            classificacoes[equipa2][0] += 1

        classificacoes[equipa1][1] += golos1 - golos2
        classificacoes[equipa2][1] += golos2 - golos1

    tabela_ordenada = sorted(classificacoes.items(), key=lambda x: (-x[1][0], -x[1][1], x[0]))

    return [(equipa, info[0]) for equipa, info in tabela_ordenada]