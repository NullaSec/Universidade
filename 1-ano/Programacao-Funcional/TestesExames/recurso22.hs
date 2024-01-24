import System.Random (randomRIO)
-- Recurso 2021/2022
-- 1.
replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' quantidade num
    | quantidade > 0 = num : replicate' (quantidade-1) num
    | otherwise = []

-- 2. 
intersect' :: Eq a => [a] -> [a] -> [a]
intersect' l [] = l
intersect' [] _ = []
intersect' (h1:t1) l
    | h1 `elem` l = h1 : intersect' t1 l
    | otherwise = intersect' t1 l

-- 3.
conv :: LTree Int -> FTree Int Int
conv (Tip x) = Leaf x  -- Caso base: folha na árvore de folhas, cria uma folha na árvore cheia
conv (Fork left right) = No (sumLeaves left) (conv left) (conv right)
  where
    sumLeaves (Tip y) = y  -- Soma de folhas: caso base, retorna o valor da folha
    sumLeaves (Fork l r) = sumLeaves l + sumLeaves r  -- Soma de folhas: soma os valores das folhas nas subárvores

-- 4.
--type Mat a = [[a]]
--triSup :: Num a => Mat a -> Bool
--triSup [] = False
--triSup ((x:xs):(y:ys):t)
--    | 

-- 5.
data SReais = AA Double Double | FF Double Double
            | AF Double Double | FA Double Double
            | Uniao SReais SReais
-- (a)
instance Show SReais where
  show (AA x y) = "] " ++ show x ++ "," ++ show y ++ "["
  show (FF x y) = "[ " ++ show x ++ "," ++ show y ++ " ]"
  show (AF x y) = "] " ++ show x ++ "," ++ show y ++ "]"
  show (FA x y) = "[ " ++ show x ++ "," ++ show y ++ "["
  show (Uniao a b) = "(" ++ show a ++ " U " ++ show b ++ ")"

-- (b)
tira :: Double -> SReais -> SReais
tira _ (AA x y) = AA x y
tira _ (FF x y) = FF x y
tira _ (AF x y) = AF x y
tira _ (FA x y) = FA x y
tira elem (Uniao a b) = Uniao (tira elem a) (tira elem b)

-- 6.
--func :: Float -> [(Float,Float)] -> [Float]
--func x l = map snd (filter ((>x) . fst) l)
func' :: Float -> [(Float,Float)] -> [Float]
func' _ [] = []
func' n ((x,xs):t)
    | x > n = xs : func' n t
    | otherwise = func' n t

-- 7. 
subseqSum :: [Int] -> Int -> Bool
subseqSum [] 0 = True
subseqSum [] _ = False
subseqSum (x:xs) k = subseqSum xs k || subseqSum xs (k - x)

-- 8.
-- import System.Random (randomRIO)

jogo :: Int -> (Int, Int) -> IO ()
jogo n (a, b) = do
  lista <- gerarListaAleatoria n (a, b)
  putStrLn $ "Lista gerada: " ++ show lista
  numero <- pedirNumero
  let verificaSubsequencia = subseqSum lista numero
  putStrLn $ if verificaSubsequencia then "A propriedade foi verificada." else "A propriedade não foi verificada."

gerarListaAleatoria :: Int -> (Int, Int) -> IO [Int]
gerarListaAleatoria n (a, b) = sequence $ replicate n (randomRIO (a, b))

pedirNumero :: IO Int
pedirNumero = do
  putStrLn "Digite um número para verificar se existe uma sub-sequência com essa soma:"
  readLn
