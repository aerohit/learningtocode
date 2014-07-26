import qualified Data.Map as Map

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
