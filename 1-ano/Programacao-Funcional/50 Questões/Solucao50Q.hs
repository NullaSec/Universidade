{-# OPTIONS_GHC -Wno-incomplete-patterns #-}

-- 1. enumFromTo :: Int -> Int -> [Int]
enumFromTo' :: Int -> Int -> [Int]
enumFromTo' n1 n2
    | n1 < n2 = n1 : enumFromTo' (n1 + 1) n2
    | n1 > n2 = [n1]
    | otherwise = []

-- 2. enumFromThenTo :: Int -> Int -> Int -> [Int]
enumFromThenTo' :: Int -> Int -> Int -> [Int]
enumFromThenTo' n1 e n2
    | n1 < n2 && e < n2 = n1 : enumFromThenTo' e (e + (e - n1)) n2
    | otherwise = []

-- 3. (++) :: [a] -> [a] -> [a]
(+++) :: [a] -> [a] -> [a]
(+++) x [] = x
(+++) [] x = x
(+++) (h1:t1) x = h1 : (+++) t1 x

-- 4. (!!) :: [a] -> Int -> [a]
(!!!) :: [a] -> Int -> a
(!!!) (h:t) 0 = h
(!!!) (h:t) n = (!!!) t (n - 1)

-- 5. reverse :: [a] -> [a] 
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (h:t) = reverse' t ++ [h]

-- 6. take :: Int -> [a] -> [a]
take' :: Int -> [a] -> [a]
take' n [] = []
take' 1 (h:t) = [h]
take' n (h:t) = h : take' (n - 2) t

-- 7. drop :: Int -> [a] -> [a]
drop' :: Int -> [a] -> [a]
drop' n [] = []
drop' n (h:t)
    | n > 0 = drop' (n - 1) t
    | otherwise = h:t

-- 8. zip :: [a] -> [b] -> [(a,b)]
zip' :: [a] -> [b] -> [(a,b)]
zip' (h1:t1) (h2:t2) = (h1,h2) : zip' t1 t2
zip' _ _ = []

-- 9. replicate :: Int -> a -> [a]
replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' n c = c : replicate' (n - 1) c

-- 10. intersperse :: a -> [a] -> [a]
intersperse' :: a -> [a] -> [a]
intersperse' _ [] = []
intersperse' n (h:t) = h : n : intersperse' n t

-- 11. group :: Eq a => [a] -> [[a]]
group' :: Eq a => [a] -> [[a]]
group' [] = []
group' (x:xs) = (x:ys) : group' zs
  where ys = takeWhile (== x) xs
        zs = dropWhile (== x) xs

-- 12. concat :: [[a]] -> [a]
concat' :: [[a]] -> [a]
concat' [] = []
concat' (h:t) = h ++ concat' t

-- 13. inits :: [a] -> [[a]]
inits' :: [a] -> [[a]]
inits' [] = [[]]
inits' l = inits' (init l) ++ [l]

-- 14. tails :: [a] -> [[a]]
tails' :: [a] -> [[a]]
tails' [] = [[]]
tails' l = l : tails' (tail l)

-- 15. heads :: [[a]] -> [a]
headss :: [[a]] -> [a]
headss [[]] = []
headss ((h:hs):xs) = h : headss xs

-- 16.  total :: [[a]] -> Int
total :: [[a]] -> Int
total [[]] = 0
total ([]:t) = 0 + total t
total ((x:xs):t) = 1 + total (xs:t)

-- 17. fun :: [(a,b,c)] -> [(a,c)]
fun :: [(a,b,c)] -> [(a,c)]
fun [] = []
fun ((x,y,z):t) = (x,z) : fun t

-- 18. cola :: [(String,b,c)] -> String
cola :: [(String,b,c)] -> String
cola [] = ""
cola ((x,y,z):t) = x ++ cola t

-- 19. idade :: Int -> Int -> [(String,Int)] -> [String]
idade :: Int -> Int -> [(String,Int)] -> [String]
idade a i [] = []
idade a i ((x,y):t)
    | a - y >= i = x : idade a i t
    | otherwise = idade a i t

-- 20. powerEnumFrom :: Int -> Int -> [Int]
powerEnumFrom :: Int -> Int -> [Int]
powerEnumFrom n 0 = [1]
powerEnumFrom n m
    | m > 1 = powerEnumFrom n (m - 1) ++ [n^(m-1)]
    | otherwise = []

-- 21. isPrime :: Int -> Bool 
isPrime :: Int -> Bool
isPrime n   | divisoes n 2 == 0 = True
            | otherwise = False
                                        -- Obrigado Eduardo :)
divisoes :: Int -> Int -> Int
divisoes a b | b >= a = 0
             | mod a b == 0 = 1
             | otherwise = divisoes a (b+1)

-- 22. isPrefixOf :: Eq a => [a] -> [a] -> Bool
isPrefixOf' :: Eq a => [a] -> [a] -> Bool
isPrefixOf' _ [] = False
isPrefixOf' [] _ = True
isPrefixOf' (h1:t1) (h2:t2)
    | h1 == h2 = isPrefixOf' t1 t2
    | otherwise = False

-- 23. isSuffixOf :: Eq a => [a] -> [a] -> Bool
isSuffixOf' :: Eq a => [a] -> [a] -> Bool
isSuffixOf' [] [] = True
isSuffixOf' [] _ = True
isSuffixOf' _ [] = False
isSuffixOf' (h1:t1) (h2:t2)
    | h1 /= h2 = isSuffixOf' t1 (h2:t2)
    | otherwise = False

-- 24. isSubsequenceOf :: Eq a => [a] -> [a] -> Bool
isSubsequenceOf' :: Eq a => [a] -> [a] -> Bool
isSubsequenceOf' [] [] = True
isSubsequenceOf' [] _ = True
isSubsequenceOf' _ [] = False
isSubsequenceOf' (h1:t1) (h2:t2)
    | h1 == h2 = isSuffixOf' t1 t2
    | otherwise = False

-- 25. elemIndices :: Eq a => a -> [a] -> Int
elemIndices' :: Eq a => a -> [a] -> [Int]
elemIndices' _ [] = []
elemIndices' e (h:t)
    | e == h = 0 : map (+1) (elemIndices' e t)
    | otherwise = map (+1) (elemIndices' e t)

-- 26. nub :: Eq a => [a] -> [a]
nub' :: Eq a => [a] -> [a]
nub' [] = []
nub' (h:t)
    | h `elem` t = nub' t
    | otherwise = h : nub' t

-- 27. delete :: Eq a => a -> [a] -> [a]
delete' :: Eq a => a -> [a] -> [a]
delete' _ [] = []
delete' e (h:t)
    | e == h = t
    | otherwise = h : delete' e t

-- 28. (\\) :: Eq a => a -> [a] -> [a]
(\\\) :: Eq a => [a] -> [a] -> [a]
(\\\) a [] = a
(\\\) (x:xs) (y:ys)
    | x == y = (\\\) xs ys
    | otherwise = x : (\\\) xs (y:ys)

-- 29. union :: Eq a => [a] -> [a] -> [a]
union' :: Eq a => [a] -> [a] -> [a]
union' [] l = l
union' l [] = l
union' l (h:t)
    | h `elem` l = union' l t
    | otherwise = union' (l++[h]) t

-- 30. intersect :: Eq a => [a] -> [a] -> [a]
intersect' :: Eq a => [a] -> [a] -> [a]
intersect' [] l = []
intersect' l [] = []
intersect' (h:t) l
    | h `elem` l = h : intersect' l t
    | otherwise = intersect' t l

-- 31. insert :: Ord a => a -> a -> [a]
insert' :: Ord a => a -> [a] -> [a]
insert' x [] = [x]
insert' n (h:t)
    | n < h = n : h : t
    | otherwise = h : insert' n t

-- 32. unwords :: [String] -> String
unwords' :: [String] -> String
unwords' [] = ""
unwords' [x] = x
unwords' (h:t) = h ++ " " ++ unwords' t

-- 33. unlines :: [String] -> String
unlines' :: [String] -> String
unlines' [] = ""
unlines' [x] = x
unlines' (h:t) = h ++ "\n" ++ unlines' t

-- 34. pMaior :: Ord a => [a] -> Int
pMaior :: Ord a => [a] -> Int
pMaior (h:t) = aux 0 0 h t
            where aux i im _ [] = im
                  aux i im x (y:ys) =
                    if x < y then aux (i + 1) (i + 1) y ys
                    else aux (i + 1) im x ys

-- 35. lookup :: Eq a => a -> [(a,b)] -> Maybe b  
lookup' :: Eq a => a -> [(a,b)] -> Maybe b
lookup' _ [] = Nothing
lookup' a ((x,xs):t)
    | a == x = Just xs
    | otherwise = lookup' a t

-- 36. preCrescente :: Ord a => [a] -> [a]
preCrescente :: Ord a => [a] -> [a]
preCrescente [] = []
preCrescente [x] = [x]
preCrescente (x:xs:t)
    | x < xs = x : preCrescente (xs:t)
    | otherwise = [x]

-- 37. iSort :: Ord a => [a] -> [a]
iSort :: Ord a => [a] -> [a]
iSort [] = []
iSort [x] = [x]
iSort (h:t) = insert' h (iSort t) -- função insert' do ex.31

-- 38. menor :: String -> String -> Bool (NÃO GARANTO QUE FUNCIONE)
menor :: String -> String -> Bool
menor "" "" = False
menor s "" = False
menor "" s = True
menor (h1:t1) (h2:t2) = menor t1 t2

-- 39. elemMSet :: Eq a => a -> [(a,Int)] -> Bool
elemMSet :: Eq a => a -> [(a,Int)] -> Bool
elemMSet a [] = False
elemMSet a ((x,xs):t) | a == x = True
                      | otherwise = elemMSet a t

-- 40. converteMSet :: [(a,Int)] -> [a]
converteMSet :: [(a,Int)] -> [a]
converteMSet [] = []
converteMSet ((x,xs):t) | xs > 0 = x : converteMSet ((x,xs-1):t)
                        | otherwise = converteMSet t

-- 41. insereMSet :: Eq a => a -> [(a,Int)] -> [(a,Int)]
insereMSet :: Eq a => a -> [(a,Int)] -> [(a,Int)]
insereMSet a [] = []
insereMSet a ((x,xs):t) | x == a = (x,xs+1):t
                        | otherwise = (x,xs) :insereMSet a t

-- 42. removeMSet :: Eq a => a -> [(a,Int)] -> [(a,Int)]
removeMSet :: Eq a => a -> [(a,Int)] -> [(a,Int)]
removeMSet a [] = []
removeMSet a ((x,xs):t) | x == a && xs > 1= (x,xs-1):t
                        | x /= a = (x,xs) : removeMSet a t
                        | otherwise = t

-- 43. constroiMSet :: Ord a => [a] -> [(a,Int)]
constroiMSet :: Ord a => [a] -> [(a,Int)]
constroiMSet [] = []
constroiMSet (h:t) = (h,1 + length (filter (==h) t)):constroiMSet (filter (/=h) t)

-- 44. partitionEitherss :: [Either a b] -> ([a],[b])
partitionEitherss :: [Either a b] -> ([a],[b])
partitionEitherss [] = ([],[])
partitionEitherss l = (partitionLeft l, partitionRight l)
    where partitionLeft [] = []
          partitionLeft ((Left x):xs) = x : partitionLeft xs
          partitionLeft ((Right _):xs) = partitionLeft xs
          partitionRight [] = []
          partitionRight ((Right x):xs) = x : partitionRight xs
          partitionRight ((Left _):xs) = partitionRight xs

-- 45. catMaybees :: [Maybe a] -> [a]
catMaybees :: [Maybe a] -> [a]
catMaybees [] = []
catMaybees ((Just a): xs) = a : catMaybees xs
catMaybees (Nothing: xs) = catMaybees xs

-- 46. caminho :: (Int,Int) -> (Int,Int) -> [Movimento]
data Movimento = Norte | Sul | Este | Oeste
               deriving Show
caminho :: (Int,Int) -> (Int,Int) -> [Movimento]
caminho (a,b) (c,d)   | a > b = Oeste : caminho (a-1,c) (b,d)
                      | a < b = Este : caminho (a+1, c) (b,d)
                      | c > d = Sul : caminho (a, c-1) (b,d)
                      | c < d = Norte : caminho (a, c+1) (b,d)
                      | otherwise = []
                    
-- 47. hasLoops :: (Int,Int) -> [Movimento] -> Bool
hasLoops :: (Int,Int) -> [Movimento] -> Bool
hasLoops (a,b) [] = False
hasLoops (a,b) x
           | elem (a,b) (aux (a,b) x) = True
           | otherwise                = False

aux :: (Int,Int) -> [Movimento] -> [(Int,Int)]
aux (a,b) [] = []
aux (a,b) (x:xs) = case x of
    Norte -> (a,b+1):aux (a,b+1) xs
    Sul -> (a,b-1):aux (a,b-1) xs
    Este -> (a+1,b):aux (a+1,b) xs
    Oeste -> (a-1,b):aux (a-1,b) xs

-- 48. contaQuadrados :: [Rectangulo] -> Int
type Ponto = (Float,Float)
data Rectangulo = Rect Ponto Ponto
contaQuadrados :: [Rectangulo] -> Int
contaQuadrados ((Rect (a,b)(c,d)): xs) | abs(a-c) == abs(b-d) = 1 + contaQuadrados xs
                                       | otherwise = contaQuadrados xs

-- 49. areaTotal :: [Rectangulo] -> Float
areaTotal :: [Rectangulo] -> Float
areaTotal [] = 0
areaTotal ((Rect (a,b) (c,d)):t) = abs((a-b)*(c-d)) + areaTotal t

-- 50. 
data Equipamento = Bom | Razoavel | Avariado
               deriving Show
naoReparar :: [Equipamento] -> Int
naoReparar [] = 0
naoReparar (Avariado:t) = naoReparar t
naoReparar (_:t) = 1+ naoReparar t