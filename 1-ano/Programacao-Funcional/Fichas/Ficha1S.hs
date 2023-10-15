-- Ficha 1
-- 1.
-- (a)
perimetro :: Double -> Double
perimetro r = 2 * pi * r

-- (b)
dist :: (Double, Double) -> (Double, Double) -> Double
dist (x1,y1) (x2,y2) = sqrt((x1-x2)^2 * (y1-y2)^2)

-- (c)
primUlt :: [a] -> (a, a)
primUlt l = (head l, last l)

-- (d)
multiplo :: Int -> Int -> Bool
multiplo m n = mod m n == 0

-- (e)
truncaImpar :: [a] -> [a]
truncaImpar [] = []
truncaImpar l
    | mod (length l) 2 /= 0 = tail l
    | otherwise = l

-- (f) 
max2 :: Int -> Int -> Int
max2 0 x = x
max2 y 0 = y
max2 y x
    | y > x = y
    | otherwise = x

-- (g)
max3 :: Int -> Int -> Int -> Int
max3 x y z
    | max2 x y < z = z
    | max2 x z < y = y
    | otherwise = x

-- 2.
-- (a)
nRaizes :: Double -> Double -> Double -> Int
nRaizes a b c
    | delta < 0 = 0
    | delta == 0 = 1
    | otherwise = 2
    where delta = b^2 - 4*a*c

-- (b)
raizes :: Double -> Double -> Double -> [Double]
raizes a b c
    | nRaizes a b c == 0 = []
    | nRaizes a b c == 1 = [-b / 2*a]
    | otherwise = [(-b + delta)/2*a,(-b + delta)/2*a]
    where delta = b^2 - 4*a*c

-- 3.
type Hora = (Int, Int)
-- (a)
validar :: Hora -> Bool
validar (h,m)
    | h < 0 || h > 23 = False
    | m < 0 || m > 59 = False
    | otherwise = True

-- (b)
depois :: Hora -> Hora -> Bool
depois (h1, m1) (h2, m2)
    | h1 > h2 = True
    | h1 == h2 && m1 > m2 = True
    | otherwise = False

-- (c)
convHorMin :: Hora -> Int
convHorMin (h, m) = h * 60 + m

-- (d)
convMinHor :: Int -> Hora
convMinHor m = (div m 60, mod m 60)

-- (e)
difHoras :: Hora -> Hora -> Int
difHoras (h1, m1) (h2, m2) = (h2-h1)*60 + (m2-m1)

-- (f)
addMin :: Int -> Hora -> Hora
addMin min (h, m) = (h + div min 60, m + mod min 60)

-- 4.
-- data Hora2 = H Int Int deriving (Show, Eq)

-- 5. 
data Semaforo = Verde | Amarelo | Vermelho deriving (Show,Eq)
-- (a)
next :: Semaforo -> Semaforo
next Verde = Amarelo
next Amarelo = Vermelho
next _ = Verde

--(b)
stop :: Semaforo -> Bool
stop Verde = False
stop Amarelo = False
stop _ = True

-- (c)
safe :: Semaforo -> Semaforo -> Bool
safe Vermelho _ = True
safe _ Vermelho = True
save _ _ = False

-- 6.
data Ponto = Cartesiano Double Double | Polar Double Double deriving (Show,Eq)
-- (a)
posx :: Ponto -> Double
posx (Cartesiano x y) = x
posx (Polar d r) = d * cos r

-- (b)
posy :: Ponto -> Double
posy (Cartesiano x y) = y
posy (Polar d r) = d * sin r

-- (c)
raio :: Ponto -> Double 
raio (Cartesiano x y) = sqrt(x^2 + y^2)
raio (Polar d r) = r

-- (d)
angulo :: Ponto -> Double 
angulo (Cartesiano x1 y1) 
    |x1==0 && y1==0 =0
    |x1==0 && y1>0 = pi/2
    |x1==0 && y1<0 = -pi/2
    |x1>0 = atan (y1/x1)
    |x1<0 && y1>=0 = atan (y1/x1) + pi
    |otherwise = atan (y1/x1) - pi

angulo (Polar d a) = a

