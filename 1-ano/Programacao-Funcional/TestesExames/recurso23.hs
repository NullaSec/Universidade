-- Recurso 22/23
-- 1.
type MSet a = [(a,Int)]
-- (a)
converteMSet :: MSet a -> [a]
converteMSet [] = []
converteMSet ((c,num):t)
    | num > 0 = c : converteMSet ((c,num-1):t)
    | otherwise = converteMSet t

-- (b)
removeMSet :: Eq a => a -> MSet a -> MSet a
removeMSet _ [] = []
removeMSet el ((c,num):t)
    | el == c && num > 1 = (c,num-1) : removeMSet el t
    | el == c && num == 1 = t
    | otherwise =(c,num) : removeMSet el t

-- (c) (podia fazer com elem)
uniaoMSet :: Eq a => MSet a -> MSet a -> MSet a
uniaoMSet c [] = c
uniaoMSet [] c = c
uniaoMSet ((e1,n1):t) conj2 =
    case lookup e1 conj2 of
        Just n2 -> (e1, n1 + n2) : uniaoMSet t (removeMSet e1 conj2)
        Nothing -> (e1,n1) : uniaoMSet t conj2

-- 2.
type Posicao = (Int,Int)
data Movimento = Norte | Sul | Este | Oeste
data Caminho = C Posicao [Movimento]

instance Eq Caminho where
    (C p1 m1) == (C p2 m2) =
        p1 == p2 && length m1 == length m2 

-- 3. 
-- func :: [[Int]] -> [Int]
-- func l = concat (filter (\x -> sum x >10) l)
func' :: [[Int]] -> [Int]
func' [] = []
func' l = faux l []

faux :: [[Int]] -> [Int] -> [Int]
faux [] filtro = filtro
faux (x:t) filtro
    | sum x > 10 = faux t (filtro ++ x)
    | otherwise = faux t filtro

-- 4. 
data Prop = Var String | Not Prop | And Prop Prop | Or Prop Prop
p1 :: Prop
p1 = Not (Or (And (Not (Var "A")) (Var "B")) (Var "C"))
-- (a)
eval :: [(String,Bool)] -> Prop -> Bool
eval l (Var n) = lookup' n l
eval l (Not p) = not (eval l p)
eval l (And p1 p2) = eval l p1 && eval l p2
eval l (Or p1 p2) = eval l p1 || eval l p2

lookup' :: String -> [(String, Bool)] -> Bool
lookup' n l = case lookup n l of
    Just val -> val
    Nothing -> error "Variável não encontrada" 

-- (b)
-- p1 = Não(((Não A) e B) ou C)
nnf :: Prop -> Prop
nnf (Var n) = Var n
nnf (Not(Not p1)) = Not p1
nnf (Not(And p1 p2)) = Or (Not p1) (Not p2)
nnf (Not(Or p1 p2)) = And (Not p1) (Not p2)
nnf (Or p1 p2) = Or (nnf p1) (nnf p2)
nnf (And p1 p2) = And (nnf p1) (nnf p2)
nnf (Not p1) = Not (nnf p1)