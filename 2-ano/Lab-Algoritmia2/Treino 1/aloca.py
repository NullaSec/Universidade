# Implemente uma função que dado um dicionário com as preferências dos alunos
# por projectos (para cada aluno uma lista de identificadores de projecto, 
# por ordem de preferência), aloca esses alunos aos projectos. A alocação
# é feita por ordem de número de aluno, e cada projecto só pode ser feito
# por um aluno. A função deve devolver a lista com os alunos que não ficaram
# alocados a nenhum projecto, ordenada por ordem de número de aluno.

prefs = {10885:[1,5],40000:[5],10000:[1,2]}

def aloca(prefs):
    sorted_dic = sorted(prefs.items())
    semprojeto = [aluno[0] for aluno in sorted_dic] # [0] é a key
    alocados = set()

    for aluno, projetos in sorted_dic:
        for projeto in projetos:
            if projeto not in alocados:

                semprojeto.remove(aluno)
                alocados.add(projeto)
                break

    return semprojeto
