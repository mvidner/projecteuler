module PE0014 where

import Data.List (maximumBy)
import Data.Ord (comparing)

collatzStep :: Integral a => a -> a
collatzStep n | even n    = n `div` 2
collatzStep n | otherwise = 3 * n + 1

-- |
-- >>> collatzChain 3
-- [3,10,5,16,8,4,2,1]
collatzChain :: Integral a => a -> [a]
collatzChain 1 = [1]
collatzChain n | n > 1     = n : collatzChain (collatzStep n)
               | otherwise = []

-- |
-- >>> collatzChainLengths [1..4]
-- [(1,1),(2,2),(3,8),(4,3)]
collatzChainLengths :: [Int] -> [(Int, Int)]
collatzChainLengths = map (\i -> (i, length $ collatzChain i))

main :: IO ()
main = do
  print $ maximumBy (comparing snd) $ collatzChainLengths [1..999999]
