import Data.List (maximumBy)
import Data.Ord (comparing)

collatzStep n | even n    = n `div` 2
collatzStep n | otherwise = 3 * n + 1

collatzChain 1 = [1]
collatzChain n | n > 1     = n : collatzChain (collatzStep n)
collatzChain n | otherwise = []

-- collatzChainLengths [1..4]
-- >>> [(1,1),(2,2),(3,8),(4,3)]
collatzChainLengths = map (\i -> (i, length $ collatzChain i))

main = do
  print $ maximumBy (comparing snd) $ collatzChainLengths [1..999999]
