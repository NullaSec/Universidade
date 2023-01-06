{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
import Data.Char()
import Data.List()
import GHC.Unicode
import GHC.Base

-- FICHA 2

-- 1. Indique como é que o interpretador de Haskell avalia as expressões das alı́neas que se seguem, apresentando a cadeia de redução de cada uma dessas expressões (i.e., os vários passos intermédios até se chegar ao valor final).
-- (a) Qual é o valor de funA [2,3,5,1]
funA :: [Double] -> Double
funA ys = Prelude.foldr (\ y -> (+) (y ^ 2)) 0 ys

-- funA [2,3,5,1] = funA (2:[3,5,1]) = 4 funA (3:[5,1]) = 4 + 9 + funA (5:[1]) = 13 + 25 + funA (1:[]) = 38 + 1 funA [] = 39 + 0 = 39

-- (b) Qual é o valor de funB [8,5,12]
funB :: [Int] -> [Int]
funB [] = []
funB (h:t) = if even h then h : funB t else funB t

-- funB [8,5,12] = funB (8:[5,12]) = 8 : funB [5,12] = 8 : funB (5:[12]) = 8 : 12 : funB [] = 8:12:[] = [8, 12]

-- (c) Qual é o valor de funC [1,2,3,4,5]
funC (x:y:t) = funC t
funC [x] = [x]
funC[] = []

-- funC [1,2,3,4,5] = funC (1:2:[3,4,5]) = funC [3,4,5] = funC (3:4:[5]) = funC [5] = []

-- (d) Qual é o valor de funD "otrec" (NÃO PERCEBI)
-- funD 1 = g [] 1
-- g acc [] = acc
-- g acc (h:t) = g (h:acc) t

-- funD "otrec" = g [] "otrec" = g [] 'o':"trec" = g 'o':[] "trec" = g ['o'] 't':"rec" = g 't':['o'] "rec" = g "to" 'r':"ec" = g 'r':"to" "ec" = g "rto" 'e':['c'] = g 'e':"rto" ['c'] = g "erto" 'c':[] = g 'c':"erto" [] = "certo"

-- 2. Defina recursivamente as seguintes funções sobre listas:
-- (a) dobros :: [Float] -> [Float]
dobros :: [Float] -> [Float]
dobros t = map (* 2) t

-- (b) num0corre :: Char -> String -> Int
num0corre :: Char -> String -> Int
num0corre _ [] = 0
num0corre x (h:t)
    | x == h = 1 + num0corre x t
    | otherwise = num0corre x t

-- (c) positivos :: [Int] -> Bool
positivos :: [Int] -> Bool
positivos [] = True
positivos (h:t)
    | h > 0 = positivos t
    | otherwise = False

-- (d) soPos :: [Int] -> Int
soPos :: [Int] -> [Int]
soPos [] = []
soPos (h:t)
    | h > 0 = h : soPos t
    | otherwise = soPos t

-- (e) somaNeg :: [Int] -> Int 
somaNeg:: [Int] -> Int
somaNeg [] = 0
somaNeg (h:s)
    | h < 0 = h + somaNeg s
    | otherwise = somaNeg s

-- (f) tresUlt :: [a] -> [a]
tresUlt :: [a] -> [a]
tresUlt (x1:x2:x3:x4:t) = tresUlt (x2:x3:x4:t)
tresUlt l = l

-- (g) segundos :: [(a,b)] -> [b]
segundos :: [(a,b)] -> [b]
segundos [] = []
segundos ((a,b):t) = b : segundos t

-- (h) nosPrimeiros :: (Eq a) => a -> [(a,b)] -> Bool
nosPrimeiros :: (Eq a) => a -> [(a,b)] -> Bool
nosPrimeiros _ [] = False
nosPrimeiros elem ((a,b):t)
    | elem == a = True
    | otherwise = nosPrimeiros elem t

-- (i) sumTriplos :: (Num a, Num b, Num c) => [(a,b,c)] -> (a,b,c)
sumTriplos :: (Num a, Num b, Num c) => [(a,b,c)] -> (a,b,c)
sumTriplos [(a,b,c)] = (a,b,c)
sumTriplos ((a,b,c):t) = (a+x,b+y,c+z)
    where (x,y,z) = sumTriplos t

-- 3. Recorrendo a funções do módulo Data.Char, defina recursivamente as seguintes funções sobre strings:
-- (a) soDigitos :: [Char] -> [Char]
soDigitos :: String -> String
soDigitos [] = []
soDigitos (h:t) = if isDigit h then h : soDigitos t else soDigitos t

-- (b) minusculas :: [Char] -> Int
minusculas :: String -> Int
minusculas [] = 0
minusculas (h:t) =
        if isLower h then 1 + minusculas t
        else minusculas t

-- (c) nums :: String -> [Int]
nums :: String -> [Int]
nums "" = []
nums (h:t) = if h `elem` ['0'..'9'] then (ord h - ord '0') : nums t else nums t

-- 4.  Uma forma de representar polinómios de uma variável é usar listas de monómios representados por pares (coeficiente, expoente)
type Polinomio = [Monomio]
type Monomio = (Float, Int)
-- (a) conta :: Int -> Polinomio -> Int
conta :: Int -> Polinomio -> Int
conta x [] = 0
conta n ((x,xs):t)
    | n == xs = 1 + conta n t
    | otherwise = conta n t

-- (b) grau :: Polinomio -> Int 
grau :: Polinomio -> Int
grau [] = 0
grau [(x,xs)] = xs
grau ((x,xs):(y,ys):t)
    | xs < ys = grau ((y,ys):t)
    | otherwise = grau ((x,xs):t)

-- (c) selgrau :: Int -> Polinomio -> Polinomio 
selgrau :: Int -> Polinomio -> Polinomio
selgrau n [] = []
selgrau n ((x,xs):t)
    | n == xs = (x,xs):selgrau n t
    | otherwise = selgrau n t

-- (d) deriv :: Polinomio -> Polinomio
deriv :: Polinomio -> Polinomio
deriv [] = []
deriv ((x,xs):t)
    | xs > 0 = (x * fromIntegral xs, xs - 1) : deriv t
    | otherwise = deriv t

-- (e) calcula :: Float -> Polinomio -> Float
calcula :: Float -> Polinomio -> Float
calcula 0 p = 0
calcula x [] = 0
calcula x ((y,ys):t)
    | ys > 0 = y * (x^ys) + calcula x t
    | otherwise = calcula x t

-- (f) simp :: Polinomio -> Polinomio
simp :: Polinomio -> Polinomio
simp [] = []
simp ((x,xs):t) 
    | x == 0 = simp t
    | otherwise = (x,xs) : simp t

-- (g) mult :: Monomio -> Polinomio -> Polinomio
mult :: Monomio -> Polinomio -> Polinomio
mult _ [] = []
mult (b,e) ((bp,ep):ps) = (b*bp,e+ep):mult (b,e) ps

-- (h) normaliza :: Polinomio -> Polinomio 
normaliza :: Polinomio -> Polinomio 
normaliza [] = []
normaliza ((n1,g1):t) = let lgi = selgrau g1 t
                            lgd = selgrau g1 t
                            x2 = sumRep ((n1,g1):lgi)
                            in if(x2==0) then normaliza lgd else (x2,g1):(normaliza lgd)
sumRep :: Polinomio -> Float
sumRep [] = 0
sumRep ((n1,g1):t) = n1 + sumRep t

-- (i) soma :: Polinomio -> Polinomio -> Polinomio
soma :: Polinomio -> Polinomio -> Polinomio
soma p1 p2 = normaliza(p1++p2)

-- (j) produto :: Polinomio -> Polinomio -> Polinomio 
produto :: Polinomio -> Polinomio -> Polinomio
produto [] _ = []
produto _ [] = []
produto (p1:t) p2 = mult p1 p2 ++ produto t p2

-- (k) ordena :: Polinomio -> Polinomio 
ordena :: Polinomio -> Polinomio
ordena [] = []
ordena ((n1,g1):t) = insertP (n1,g1) (ordena t)
                     where insertP :: Monomio -> Polinomio -> Polinomio
                           insertP (n1,g1) [] = [(n1,g1)]
                           insertP (n1,g1) ((n2,g2):t) = 
                            if g1 < g2 then (n1,g1):((n2,g2):t) else (n2,g2) : insertP (n1,g1) t

--(l) equiv :: Polinomio -> Polinomio -> Bool 
equiv :: Polinomio -> Polinomio -> Bool
equiv p1 p2 = ordena(normaliza p1) == ordena(normaliza p2)

-- Obrigado ao NECC e à RysingFisan por terem GitHubs tão bons