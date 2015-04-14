module PE0030 where

import Data.Char (digitToInt)

is5PowerSum n = n == (sum $ map (^5) $ map digitToInt $ show n)

problem = sum [n | n <- [2.. (10^6)], is5PowerSum n]

main = print problem
