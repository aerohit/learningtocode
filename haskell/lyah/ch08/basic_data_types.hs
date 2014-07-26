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
