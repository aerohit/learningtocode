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
