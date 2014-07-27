module Shapes
( Point(..)
, Shape(..)
, surface
, nudge
, baseCircle
, baseRectangle
) where

import qualified Data.Map as Map

-- SECTION Defining data types.

-- 'data' defines a new data type
-- part before '=' is denotes the type
-- the part after '=' are value constructors
data MyBool = MyFalse | MyTrue

data Point = Point Float Float deriving (Show)

-- Note that Cirle/Rectangle aren't types, they are value constructors.
-- Shape is the type here.
data Shape  = Circle Point Float | Rectangle Point Point deriving (Show)

surface :: Shape -> Float
surface (Circle _ r)          = pi * r ^ 2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)

-- value constructors are functions and hence could be mapped, partially
-- applied and so on.
cocentricCircles = map (Circle (Point 0 0)) [1, 2, 3]

nudge :: Shape -> Float -> Float -> Shape
nudge (Circle (Point x y) r) dx dy                  = Circle (Point (x+dx) (y+dy)) r
nudge (Rectangle (Point x1 y1) (Point x2 y2)) dx dy = Rectangle (Point (x1+dx) (y1+dy)) (Point (x2+dx) (y2+dy))

baseCircle :: Float -> Shape
baseCircle r = Circle (Point 0 0) r

baseRectangle :: Float -> Float -> Shape
baseRectangle w h = Rectangle (Point 0 0) (Point w h)

aRectangle = nudge (baseRectangle 40 100) 60 23

-- SECTION Record syntax

data Person = Person { firstName   :: String
                     , lastName    :: String
                     , age         :: Int
                     , height      :: Float
                     , phoneNumber :: String
                     , flavor      :: String
                     } deriving (Show, Eq)

guy  = Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"
girl = Person "Broady" "Finklestein" 43 184.2 "526-2928" "Chocolate"

data Car = Car { company         :: String
               , model           :: String
               , year            :: Int
               } deriving (Show)

tellCar :: Car -> String
tellCar (Car c m y) = "This " ++ c ++ " " ++ m ++ " was made in " ++ (show y) ++ "."

ferrari = Car "Ferrari" "Ferrari" 1967
-- order doesn't matter in record syntax
mustang = Car {company="Ford", year=1967, model="Mustang"}

-- SECTION Recursive data structures

infixr 5 :-:          -- left-associative with fixity of 5
data List a = EmptyList | a :-: (List a) deriving (Show, Read, Eq, Ord)

infixr 5 .++
(.++) :: List a -> List a -> List a
EmptyList .++ ys      = ys
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


-- SECTION Derived instances

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
           deriving (Eq, Ord, Show, Read, Bounded, Enum)

-- SECTION Type classes

class Equal a where
    (.==) :: a -> a -> Bool
    (./=) :: a -> a -> Bool
    x .== y = not (x ./= y)
    x ./= y = not (x .== y)

data TrafficLight = Red | Yellow | Green

instance Equal TrafficLight where
    Red .== Red        = True
    Green .== Green    = True
    Yellow .== Yellow  = True
    _ .== _            = False

instance Show TrafficLight where
    show Red    = "Red Light"
    show Yellow = "Yellow Light"
    show Green  = "Green Light"

instance (Equal m) => Equal (Maybe m) where
    Just x .== Just y   = x .== y
    Nothing .== Nothing = True
    _ .== _             = False

-- SECTION Type parameters

-- MyMaybe is a type constructor, it takes type as parameters and produces
-- a type
data MyMaybe a = MyNothing | MyJust a deriving (Show)

mayBeA = MyJust 'A'

data MyEither a b = MyLeft a | MyRight b deriving (Eq, Ord, Read, Show)

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


-- SECTION Type synonyms


type AssociationList k v = [(k,v)]

type PhoneNumber = String
type Name        = String
type PhoneBook   = AssociationList Name PhoneNumber

inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool
inPhoneBook name pnumber pbook = (name, pnumber) `elem` pbook

getValue :: (Eq k) => k -> AssociationList k v -> Maybe v
getValue _ [] = Nothing
getValue key ((k,v):xs) = if key == k then Just v
                                      else getValue key xs

type IntMap = Map.Map Int


-- SECTION YesNo


class YesNo a where
    yesno :: a -> Bool

instance YesNo Int where
    yesno 0 = False
    yesno _ = True

instance YesNo [a] where
    yesno [] = False
    yesno _  = True

instance YesNo Bool where
    yesno = id

instance YesNo (Maybe a) where
    yesno Nothing = False
    yesno _       = True

instance YesNo (Tree a) where
    yesno EmptyTree = False
    yesno _         = True

instance YesNo TrafficLight where
    yesno Red = False
    yesno _   = True

yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult = if yesno yesnoVal then yesResult else noResult


-- SECTION Functors

class MyFunctor f where
    myfmap :: (a -> b) -> f a -> f b

instance MyFunctor List where
    myfmap _ EmptyList   = EmptyList
    myfmap fn (x :-: xs) = fn x :-: myfmap fn xs

instance MyFunctor MyMaybe where
    myfmap _ MyNothing   = MyNothing
    myfmap fn (MyJust x) = MyJust (fn x)

instance MyFunctor Tree where
    myfmap _ EmptyTree            = EmptyTree
    myfmap fn (Node x left right) = Node (fn x) (myfmap fn left) (myfmap fn right)

instance MyFunctor (MyEither a) where
    myfmap fn (MyLeft x)  = MyLeft x
    myfmap fn (MyRight x) = MyRight (fn x)

