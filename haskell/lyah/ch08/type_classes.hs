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
