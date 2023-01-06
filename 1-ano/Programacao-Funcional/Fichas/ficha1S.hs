{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
import Data.Char ( ord, chr, isLower, isUpper ) 

-- FICHA 1

-- 1. Defina as seguintes funções e os respetivos tipos:
-- (a) Perímetro
perimetro :: Double -> Double
perimetro r = 2 * pi * r

-- (b) dist
dist :: (Double, Double) -> (Double, Double) -> Double
dist (x1, x2) (y1, y2) = sqrt((x1 + x2)**2 + (y1 + y2)**2)

-- (c) primUlt
primUlt :: [a] -> (a, a)
primUlt lista = (head lista, last lista)

-- (d) multiplo
multiplo :: Int -> Int -> Int
multiplo = mod

-- (e) truncaImpar
truncaImpar :: [a] -> [a]
truncaImpar lista =
    if odd (length lista)
        then tail lista
    else lista

-- (f) max2
max2 :: Int -> Int -> Int
max2 num1 num2 =
    if num1 > num2
        then num1
    else num2

-- (g) max3
max3 :: Int -> Int -> Int -> Int
max3 num1 num2 num3 =
    if max2 num1 num2 < num3 then num3
    else max2 num1 num2

-- 2. Defina as seguintes funções sobre polinómios de 2º grau:
-- (a) nRaizes
nRaizes :: Double -> Double -> Double -> Int
nRaizes a b c
    | delta < 0 = 0
    | delta == 0 = 1
    | otherwise = 2
    where delta = b^2 - 4*a*c

-- (b) raizes
raizes :: Double -> Double -> Double -> [Double]
raizes a b c
    | n == 0 = []
    | n == 1 = [x1]
    | otherwise = [x1, x2]
    where n = nRaizes a b c
          delta = b^2 - 4*a*c
          (x1,x2) = (((-b) + sqrt delta)/ (2*a), ((-b) - sqrt delta)/ (2*a))

-- 3. Vamos representar horas por um par de números inteiros:
type Hora = (Int, Int)
-- (a) testar se um par de inteiros representa uma hora do dia válida;
validarHora :: Hora -> Bool
validarHora (h, m)
    | h < 24 && m < 60 = True
    | otherwise = False

-- (b) testar se uma hora é ou não depois de outra;
ordemHora :: Hora -> Hora -> Bool
ordemHora (h1, m1) (h2, m2)
    | h1 > h2 = True
    | h1 == h2 && m1 > m2 = True
    | otherwise = False

-- (c) converter um valor em horas para minutos;
convHM :: Hora -> Int
convHM (h, m) = 60 * h + m

-- (d) converter um valor em minutos para horas;
convMH :: Int -> Hora
convMH m = (div m 60, mod m 60)

-- (e) calcular a diferença entre duas horas (minutos);
difHoras :: Hora -> Hora -> Int
difHoras h1 h2 = abs(convHM h1 - convHM h2)

-- (f) adicionar um determinado número de minutos a uma dada hora;
adNum :: Int -> Hora -> Hora
adNum m h = convMH(m + convHM h)

-- 4. Repita o exercício anterior assumindo agora que as horas são representadas por um novo tipo de dados:
data HoraV2 = H Int Int deriving (Show, Eq)

-- (a) testar se um par de inteiros representa uma hora do dia válida;
validarHora2 :: HoraV2 -> Bool
validarHora2 (H hor min) = elem hor [0..23] && elem min [0..59]

-- (b) testar se uma hora é ou não depois de outra;
ordemHora2 :: HoraV2 -> HoraV2 -> Bool
ordemHora2 (H hor min) (H hor2 min2)
    | hor > hor2 || hor == hor2 && min > min2 = True
    | otherwise = False

-- (c) converter um valor em horas para minutos;
convHM2 :: HoraV2 -> Int
convHM2 (H hor min) = hor*60 + min

-- (d) converter um valor em minutos para horas;
convMH2 :: Int -> HoraV2
convMH2 m = H (div m 60) (mod m 60)

-- (e) calcular a diferença entre duas horas (minutos);
difHoras2 :: HoraV2 -> HoraV2 -> Int
difHoras2 hor1 hor2 = abs(convHM2 hor1 - convHM2 hor2)

-- (f) adicionar um determinado número de minutos a uma dada hora;
adNum2 :: Int -> HoraV2 -> HoraV2
adNum2 min hor = convMH2(min + convHM2 hor)

-- 5. Considere o seguinte tipo de dados para representar os possíveis estados de um semáforo:
data Semaforo = Verde | Amarelo | Vermelho deriving (Show, Eq)
-- (a) Defina a função next :: Semaforo -> Semaforo que calcula o próximo estado de um semáforo;
next :: Semaforo -> Semaforo
next Verde = Amarelo
next Amarelo = Vermelho
next _ = Verde

-- (b) Defina a função stop :: Semaforo -> Bool que determina se é obrigatório parar num semáforo;
stop :: Semaforo -> Bool
stop Vermelho = True
stop _ = False

-- (c) Defina a função safe :: Semaforo -> Semaforo -> Bool que testa se o estado de dois semáforos num cruzamento é seguro.
safe :: Semaforo -> Semaforo -> Bool
safe _ Vermelho = True
safe Vermelho _ = True
safe _ _ = False

-- 6. Um ponto num plano pode ser representado por um sistema de coordenadas Cartesiano (distâncias aos eixos vertical e horizontal) ou por um sistema de coordenadas Polar (distância à origem e ângulo do respectivo vector com o eixo horizontal).
data Ponto = Cartesiano Double Double | Polar Double Double deriving (Show, Eq)
-- (a) posx :: Ponto -> Double que calcula a distância de um ponto ao eixo vertical;
posx :: Ponto -> Double
posx (Cartesiano x y) = x
posx (Polar d ang) = cos ang * d

-- (b) posy :: Ponto -> Double que calcula a distância de um ponto ao eixo horizontal;
posy :: Ponto -> Double
posy (Cartesiano x y) = y
posy (Polar d ang) = sin ang * d

-- (c) raio :: Ponto -> Double que calcula a distância de um ponto à origem;
raio :: Ponto -> Double
raio (Cartesiano x y) = sqrt(x^2 + y^2)
raio (Polar d ang) = d

-- (d) angulo :: Ponto -> Double que calcula o ângulo entre o vector que liga a origem ao ponto e o eixo horizontal;
angulo :: Ponto -> Double
angulo (Cartesiano x y) = atan(y/x)
angulo (Polar d ang) = ang

-- (e) dist :: Ponto -> Ponto -> Double que calcula a distância entre dois pontos; (dist já está a ser usado)
distPontos :: Ponto -> Ponto -> Double
distPontos (Cartesiano x1 y1) (Cartesiano x2 y2) = sqrt((x1-x2)^2 + (y1-y2)^2)
distPontos (Polar d1 ang1) (Polar d2 ang2) = sqrt(d1^2 + d2^2 - 2*d1*d2*cos(d1-d2))

-- 7. Considere o seguinte tipo de dados para representar figuras geométricas num plano.
data Figura = Circulo Ponto Double
            | Retangulo  Ponto Ponto
            | Triangulo Ponto Ponto Ponto
            deriving (Show, Eq)

-- (a)  Defina a função poligono :: Figura -> Bool que testa se uma figura é um polı́gono;
poligono :: Figura -> Bool
poligono (Circulo c r ) = False
poligono _              = True

-- (b) Defina a função vertices :: Figura -> [Ponto] que calcula a lista dos vértices de uma figura;
vertices :: Figura -> [Ponto]
vertices (Triangulo p1 p2 p3) = [p1, p2, p3]
vertices (Retangulo (Cartesiano a b) (Cartesiano x y)) =
    [Cartesiano a b,
    Cartesiano a y,
    Cartesiano x y,
    Cartesiano x b]
vertices _ = []

-- (c) Complete a seguinte definição cujo objectivo é calcular a área de uma figura;
area :: Figura -> Double
area (Triangulo p1 p2 p3) =
  let a = distPontos p1 p2
      b = distPontos p2 p3
      c = distPontos p3 p1
      s = (a + b + c) / 2
  in sqrt (s*(s-a)*(s-b)*(s-c))
area (Retangulo p1 p2) = abs (posx p2 - posx p1) * abs (posy p2 - posy p1)
area (Circulo _ r) = pi * (r ^ 2)

-- (d) Defina a função perimetro :: Figura -> Double que calcula o perímetro de uma figura;
perimetroFig :: Figura -> Double
perimetroFig (Retangulo p1 p2) = 2 * abs (posx p2 - posx p1) + 2 * abs (posy p2 - posy p1)
perimetroFig (Triangulo p1 p2 p3) = distPontos p1 p2 + distPontos p2 p3 + distPontos p1 p3
perimetroFig (Circulo _ r) = 2 * pi * r

-- 8. Utilizando as funções ord :: Char -> Int e chr :: Int -> Char do módulo Data.Char, defina as seguintes funções:
-- (a) isLower 
isLower :: Char -> Bool
isUpper :: Char -> Bool
isLower c = c `elem` ['a'..'z']
isUpper c = c `elem` ['A'..'Z']

-- (b) isDigit
isDigit :: Char -> Bool
isDigit c = c `elem` ['1'..'9']

-- (c) isAlpha
isAlpha :: Char -> Bool 
isAlpha c = Data.Char.isLower c || Data.Char.isUpper c

-- (d) toUpper
offset :: Int
toUpper :: Char -> Char
offset = fromEnum 'A' - fromEnum 'a'
toUpper c = toEnum (fromEnum c + offset)

-- (e) intToDigit
intToDigit :: Int -> Char
intToDigit n = chr (n + 48)

-- (f) digitToInt 
digitToInt :: Char -> Int
digitToInt n = ord n - 48 
