module PE0030 where

import Data.Char (digitToInt)

is5PowerSum :: Integer -> Bool
is5PowerSum n = n == (sum $ map (^5) $ map (fromIntegral . digitToInt) $ show n)

problem :: Integer
problem = sum [n | n <- [2.. (10^6)], is5PowerSum n]

main :: IO ()
main = print problem
