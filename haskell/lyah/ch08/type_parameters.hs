-- MyMaybe is a type constructor, it takes type as parameters and produces
-- a type
data MyMaybe a = MyNothing | MyJust a deriving (Show)

mayBeA = MyJust 'A'

data Vector a = Vector a a a deriving (Show)

vectorAdd :: (Num t) => Vector t -> Vector t -> Vector t
(Vector a b c) `vectorAdd` (Vector p q r) = Vector (a+p) (b+q) (c+r)

vectorMult :: (Num t) => Vector t -> Vector t -> Vector t
(Vector a b c) `vectorMult` (Vector p q r) = Vector (a*p) (b*q) (c*r)

scalarMult :: (Num t) => Vector t -> Vector t -> t
(Vector a b c) `scalarMult` (Vector p q r) = a*p +  b*q + c*r
