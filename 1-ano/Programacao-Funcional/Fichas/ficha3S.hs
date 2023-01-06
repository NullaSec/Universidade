-- FICHA 3

data Hora = H Int Int deriving Show
type Etapa = (Hora, Hora)
type Viagem = [Etapa]

v :: Viagem
v = [(H  9 30, H 10 15), (H 11 20, H 12 45), (H 13 30, H 14 45)]

-- 1. (a) Testar se uma etapa está bem construída
validarHora :: Hora -> Bool -- função da ficha 1 adaptada
validarHora (H h m)
    | h < 24 && m < 60 = True
    | otherwise = False

ordemHora :: Hora -> Hora -> Bool -- função da ficha 1 adaptada
ordemHora (H h1 m1) (H h2 m2)
    | h1 > h2 = True
    | h1 == h2 && m1 > m2 = True
    | otherwise = False

testEtapa :: Etapa -> Bool
testEtapa  (H h1 m1, H h2 m2)
     | validarHora (H h1 m1) && validarHora (H h2 m2) && not (ordemHora (H h1 m1) (H h2 m2)) = True
     | otherwise = False

-- (b) Testar se uma viagem está bem construída
testViagem :: Viagem -> Bool
testViagem [] = True
testViagem [etapa] = testEtapa etapa
testViagem (e1:e2:t)
    | testEtapa e1 && testEtapa (snd e1, fst e2) && testViagem (e2:t) = True
    | otherwise = False

-- (c) Calcular a hora de partida e de chegada de uma dada viagem
calcHorario :: Viagem -> Etapa
calcHorario [] = (H 0 0, H 0 0)
calcHorario [etapa] = etapa
calcHorario (h:t) = (fst h,snd (last t))

-- (d) Dada uma viagem válida, calcular o tempo total de viagem efectiva
durEtapa :: Etapa -> Int
durEtapa (H h1 m1, H h2 m2) = (h2*60+m2)-(h1*60+m1)

durTotal :: Viagem -> Int
durTotal [] = 0
durTotal [etapa] = durEtapa etapa
durTotal (h:t) = durEtapa h + durTotal t

-- (e) Calcular o tempo total de espera
durEspera :: Viagem -> Int
durEspera [] = 0
durEspera [etapa] = durEtapa etapa
durEspera (h:t) = durEtapa(fst h, snd(last t)) - durTotal (h:t)

-- (f)  Calcular o tempo total da viagem
durTotal2 :: Viagem -> Int 
durTotal2 [] = 0
durTotal2 [etapa] = durEtapa etapa
durTotal2 (h:t) = durEtapa(fst h, snd(last t))
