-- FICHA 3

-- 1. Viagens, Etapas e Horas
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

data Hora = H Int Int deriving Show
type Etapa = (Hora, Hora)
type Viagem = [Etapa]

v :: Viagem
v = [(H  9 30, H 10 15), (H 11 20, H 12 45), (H 13 30, H 14 45)]

-- (a) Testar se uma etapa está bem construída
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

-- 2. Considere as seguinte definição de um tipo para representar linhas poligonais.

data Ponto = Cartesiano Double Double | Polar Double Double deriving (Show, Eq) -- função da ficha 1
type Poligonal = [Ponto]

-- (a) Defina a função para calcular o comprimento de uma linha poligonal
compLP :: Poligonal -> Double
compLP [x] = 0
compLP ((Cartesiano x1 y1):(Cartesiano x2 y2):t) = sqrt((x2-x1)**2+(y2-y1)**2) + compLP t
compLP ((Polar r1 ang1):(Polar r2 ang2):t) = sqrt(((r2*cos ang2)-(r1*cos ang1))**2+((r2*sin ang2)-(r1*sin ang1))**2) + compLP t

-- (b) Defina uma função para testar se uma dada linha poligonal é ou não fechada.
testLinha :: [Ponto] -> Bool
testLinha [] = False
testLinha [p] = False
testLinha (h:t)
    | h == last t = True
    | otherwise = False

-- (c) Calcular lista de triângulos e outras cenas
data Figura = Circulo Ponto Double
            | Retangulo Ponto Ponto
            | Triangulo Ponto Ponto Ponto
            deriving (Show, Eq)

triangula :: Poligonal-> [Figura]
triangula (x:y:z:t) = Triangulo x y z : triangula (x:z:t)

-- (d)  Defina uma função para calcular a área delimitada por uma linha poligonal fechada e convexa
area :: Figura -> Double -- Função da ficha 1
area (Triangulo (Cartesiano x1 y1) (Cartesiano x2 y2) (Cartesiano x3 y3)) = 
    let lado1 = sqrt((x1 - x2)^2 + (y1 - y2)^2)
        lado2 = sqrt((x1 - x3)^2 + (y1 - y3)^2)
        lado3 = sqrt((x2 - x3)^2 + (y2 - y3)^2)
        soma = (lado1 + lado2 + lado3) / 2
    in sqrt(soma * (soma - lado1) * (soma - lado2) * (soma - lado3)) -- Fórmula de Heron
area (Circulo a r) = pi * r^2
-- area (Retangulo a b) 
