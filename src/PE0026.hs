module PE0026 where

{-
This can be solved with permutations of the possible remainders when doing
long division.
-}
import Control.Monad (liftM)
import Data.Array
import Data.List (foldl', maximumBy)
import Data.Function (on)

type Aperiodic = Double -- dubious but uninteresting
type Digit = Int

-- Decomposes (1 / n) to an aperiodic part after the decimal point
-- and a recurring digit cycle
-- >>> unitFractionCycle 2
-- ([5],[])
-- >>> unitFractionCycle 3
-- ([],[3])
-- >>> unitFractionCycle 4
-- ([2,5],[])
-- >>> unitFractionCycle 6
-- ([1],[6])
-- >>> unitFractionCycle 7
-- ([],[1,4,2,8,5,7])
unitFractionCycle :: Int -> ([Digit], [Digit])
unitFractionCycle = undefined

-- | remainders n is an array indexed from 0 to n-1
-- where (remainders n i) is  ((10 * i) `rem` n)
--
-- >>> remainders 6
-- array (0,5) [(0,0),(1,4),(2,2),(3,0),(4,4),(5,2)]
remainders :: Int -> Array Int Int
remainders n = listArray (0, n-1) [(10 * i) `rem` n | i <- [0 .. n-1]]

--type Permutation = Array Int Int

--permutationCycles :: Permutation -> [[Int]]
--permutationCycles perm

-- headElemTail xs = case xs of [] -> False;  y:ys -> y `elem` ys

-- untie an infinite cycle
uncycle :: [Int] -> [Int]
uncycle [] = []
uncycle xs =
    reverse$ uncycle' [] xs
  where
    uncycle' sofar (z:zs) = if z `elem` sofar
                            then sofar
                            else uncycle' (z:sofar) zs

-- |
-- >>> remainderCycle 13 1
-- [1,10,9,12,3,4]
--
-- Note that this is not a cycle but a graph containing a cycle:
--
-- >>> remainderCycle 6 1
-- [1,4]
remainderCycle :: Int -> Int -> [Int]
remainderCycle n i =
    uncycle $ iterate nextRemainder i
  where
    nextRemainder i = remainders n ! i

updateAlist :: Int -> Int -> [(Int, Maybe Int)]
updateAlist n i = [(r, Just $ length c) | r <- c] where c = remainderCycle n i

knownRemainderCycleLengths :: Int -> Array Int (Maybe Int)
knownRemainderCycleLengths n =
    foldl' nextArray emptyArray [0 .. n-1]
  where
    emptyArray = listArray (0, n - 1) (repeat Nothing)
    nextArray sofar i
        | sofar ! i == Nothing = sofar // updateAlist n i
        | otherwise = sofar

{-
maxRemainderCycleLength n =
    maximum $ map length [remainderCycle n i | i <- [0..n - 1]]
-}
maxRemainderCycleLength n =
    case maximum $ elems $ knownRemainderCycleLengths n of
        Just m -> m
        _      -> error "knownRemainderCycleLengths isnt total"

answer =
    let lengths = [(i, maxRemainderCycleLength i) | i <- [1..999]]
    in maximumBy (compare `on` snd) lengths

main = print answer
