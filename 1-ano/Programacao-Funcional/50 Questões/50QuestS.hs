-- 1. enumFromTo :: Int -> Int -> [Int]
enumFromTo' :: Int -> Int -> [Int]
enumFromTo' n1 n2
    | n1 < n2 = n1 : enumFromTo' (n1 + 1) n2
    | n1 > n2 = [n1]
    | otherwise = []

-- 2. enumFromThenTo :: Int -> Int -> Int -> [Int]
enumFTT :: Int -> Int -> Int -> [Int]
enumFTT i es f
    | i < f = i : enumFTT es (es + (es - i)) f
    | i >= f = [i]
    | otherwise = []

-- 3. (++) :: [a] -> [a] -> [a]
addList' :: [a] -> [a] -> [a]
addList' l [] = l
addList' [] l = l
addList' (x:xs) l = x : addList' xs l

-- 4.  (!!) :: [a] -> Int -> a
(!!!) :: [a] -> Int -> a
(!!!) (h:t) 0 = h
(!!!) (h:t) x = (!!!) t (x - 1)

-- 5. reverse :: [a] -> [a]
reversee :: [a] -> [a]
reversee [] = []
reversee (h:t) = reversee t ++ [h]

-- 6. take :: Int -> [a] -> [a]
takee :: Int -> [a] -> [a]
takee x (h:t)
    | x > 0 = h : takee (x - 1) t
    | otherwise = []

-- 7. drop :: Int -> [a] -> [a]
dropp :: Int -> [a] -> [a]
dropp x (h:t)
    | x > 0 = dropp (x - 1) t
    | otherwise = h:t

-- 8. zip :: [a] -> [b] -> [(a,b)]
zipp :: [a] -> [b] -> [(a,b)]
zipp (x:xs) (y:ys) = (x,y) : zipp xs ys
zipp _ _ = []

-- 9. replicate :: Int -> a -> [a]
rep :: Int -> a -> [a]
rep x y 
    | x > 0 = y : rep (x - 1) y
    | otherwise = []

-- 10. intersperse :: a -> [a] -> [a]
inter :: a -> [a] -> [a]
inter x [] = []
inter ele (h:t) = h : ele : inter ele t 

-- 11. group :: Eq a => [a] -> [[a]]
groupp :: Eq a => [a] -> [[a]]
groupp [] = []
groupp (h:t) = (h : takeWhile (==h) t) : groupp (dropWhile (==h) t)

-- 12. concat :: [[a]] -> [a]
concatt :: [[a]] -> [a]
concatt [] = []
concatt (h:t) = h ++ concatt t

-- 13. inits :: [a] -> [[a]]
initss :: [a] -> [[a]]
initss [] = [[]]
initss l = initss (init l) ++ [l]

-- 14. tails :: [a] -> [[a]]
tailss :: [a] -> [[a]]
tailss [] = [[]]
tailss l = l : tailss(tail l)

-- 15. heads :: [[a]] -> [a]
headss :: [[a]] -> [a]
headss [[]] = []
headss ((h:hs):xs) = h: headss xs 

-- 16. total :: [[a]] -> Int
totall :: [[a]] -> Int
totall [[]] = 0
totall ([]:t) = 0 + totall t
totall ((h:hs):t) = 1 + totall (hs:t)

-- 17. fun :: [(a,b,c)] -> [(a,c)]
funn :: [(a,b,c)] -> [(a,c)]
funn [(a,b,c)] = [(a,c)]
funn ((a,b,c):t) = (a,c) : funn t 

-- 18. cola :: [(String,b,c)] -> String
cola :: [(String,b,c)] -> String
cola [(str,b,c)] = str 
cola ((a,b,c):t) = a ++ cola t 

-- 19. idade :: Int -> Int -> [(String,Int)] -> [String]
idade :: Int -> Int -> [(String,Int)] -> [String]
idade ano age [] = []
idade ano age ((nome,ano_nasc):t) 
    | (ano - ano_nasc) >= age = nome : idade ano age t
    | otherwise = idade ano age t

-- 20. powerEnumFrom :: Int -> Int -> [Int]
pef :: Int -> Int -> [Int]
pef n 0 = [1]
pef n m
    | m > 1 = pef n (m - 1) ++ [n^(m-1)]
    | otherwise = []

-- 21. isPrime :: Int -> Bool
isPrime :: Int -> Bool
isPrime n   | divisoes n 2 == 0 =  True 
            | otherwise = False
                                        -- Obrigado Eduardo :)
divisoes :: Int -> Int -> Int
divisoes a b | b >= a = 0
             | mod a b == 0 = 1
             | otherwise = divisoes a (b+1)
            
-- 22. isPrefixOf :: Eq a => [a] -> [a] -> Bool
ipo :: Eq a => [a] -> [a] -> Bool
ipo [] [] = True
ipo [] _ = True
ipo _ [] = False
ipo (x:xs) (y:ys) 
    | x == y = ipo xs ys
    | otherwise = False

-- 23. isSuffixOf :: Eq a => [a] -> [a] -> Bool
iso :: Eq a => [a] -> [a] -> Bool
iso [] _ = True
iso _ [] = False
iso (x:xs) (y:ys) 
    | x /= y = iso xs (y:ys)
    |otherwise = False

-- 24. isSubsequenceOf :: Eq a => [a] -> [a] -> Bool
isof :: Eq a => [a] -> [a] -> Bool
isof [] x = True
isof x [] = False
isof (x:xs) (y:ys) 
    | x == y = isof xs ys
    | otherwise = isof (x:xs) ys 

-- 25. elemIndices :: Eq a => a -> [a] -> [Int]
elemIndicess :: Eq a => a -> [a] -> [Int]
elemIndicess _ [] = []
elemIndicess x (h:t) 
    | x == h = 0 : 0 : map (+1) (elemIndicess x t)
    | otherwise =  map (+1) (elemIndicess x t)

-- 26. nub :: Eq a => [a] -> [a]
nubb :: Eq a => [a] -> [a]
nubb [] = []
nubb (h:t) 
    | elem h t = nubb t
    | otherwise = h : nubb t

-- 27. delete :: Eq a => a -> [a] -> [a]
del :: Eq a => a -> [a] -> [a]
del _ [] = []
del x (h:t) 
    | x == h = t
    | otherwise = h : del x t

-- 28. (\\):: Eq a => [a] -> [a] -> [a]
(\\\) :: Eq a => [a] -> [a] -> [a]
(\\\) a [] = a
(\\\) (x:xs) (y:ys) 
    | x == y = (\\\) xs ys
    | otherwise = x : (\\\) xs (y:ys)
    