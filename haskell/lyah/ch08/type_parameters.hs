import qualified Data.Map as Map

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

data LockerState = Taken | Free deriving (Show, Eq)
type Code = String
type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber map =
    case Map.lookup lockerNumber map of
      Nothing -> Left $ "Locker number " ++ show lockerNumber ++ " doesn't exist!"
      Just (state, code) -> if state /= Taken
                              then Right code
                              else Left $ "Locker " ++ show lockerNumber ++ " is already taken!"

lockers :: LockerMap
lockers = Map.fromList
    [(100,(Taken,"ZD39I"))
    ,(101,(Free,"JAH3I"))
    ,(103,(Free,"IQSA9"))
    ,(105,(Free,"QOTSA"))
    ,(109,(Taken,"893JJ"))
    ,(110,(Taken,"99292"))
    ]
