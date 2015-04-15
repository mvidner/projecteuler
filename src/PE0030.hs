module PE0030 where

import Data.Char (digitToInt)

is5PowerSum :: Integer -> Bool
is5PowerSum n =
    n == sum digitPowers
  where 
    digitPowers = map (^ (5 :: Int)) digits
    digits = map (fromIntegral . digitToInt) $ show n

-- approximated, 5 digits are not enough
limit :: Integer
limit = 10 ^ (6::Int)

problem :: Integer
problem = sum [n | n <- [2..limit], is5PowerSum n]

main :: IO ()
main = print problem
