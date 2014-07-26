infixr 5 :-:          -- left-associative with fixity of 5
data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)

infixr 5 .++
(.++) :: List a -> List a -> List a
Empty .++ ys      = ys
(x :-: xs) .++ ys = x :-: (xs .++ ys)

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node v left right)
    | x == v = Node v left right
    | x < v  = Node v (treeInsert x left) right
    | x > v  = Node v left (treeInsert x right)

treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem _ EmptyTree = False
treeElem x (Node v left right)
    | x == v = True
    | x < v  = treeElem x left
    | x > v  = treeElem x right

nums = [8,6,4,1,7,3,5]
numsTree = foldr treeInsert EmptyTree nums
