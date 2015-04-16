module PE0031 where
{-
Problem:

In England the currency is made up of pound, £, and pence, p, and there are
eight coins in general circulation:

    1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).

It is possible to make £2 in the following way:

    1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p

How many different ways can £2 be made using any number of coins?
-}

import Benchmark

import Control.Exception.Base (assert)

-- | An amount in pennies
type Pennies = Int
-- (try it also with newtype?)

solve :: Pennies                -- ^ Total amount desired
       -> Int                   -- ^ Number of ways this can be paid
solve total = solveCoins1 englishCoins total

-- | A descending list of coin values
englishCoins :: [Pennies]
englishCoins = [200, 100, 50, 20, 10, 5, 2, 1]
{-
assert strictly-descending englishCoins?
-}

solveCoins :: [Pennies]         -- ^ Coin set (descending)
           -> Pennies           -- ^ Total amount desired
           -> Int               -- ^ Number of ways this can be paid

-- Let's see how to solve it for small target values and small coin sets.

solveCoins [] _ = error "This problem cannot be solved in a cashless society"
-- ^ An exception is OK since the recursion terminates on [c], a singleton

solveCoins [c] n  | c `divides` n = 1
                  | otherwise     = 0

solveCoins _ _ = error "The rest is not implemented yet"
{-
Observe that

solveCoins [3,2] 5 = 0

So let's first solve the easier problem where the coin set does include 1.
-}

-- | Solve for a list of coins that ends with a 1
--
-- >>> solveCoins1 [5,1] 10
-- 3
--
-- >>> solveCoins1 [2,1] 10
-- 6
--
-- >>> solveCoins1 [5,2,1] 10
-- 10
solveCoins1 :: [Pennies]         -- ^ Coin set (descending)
            -> Pennies           -- ^ Total amount desired
            -> Int               -- ^ Number of ways this can be paid

solveCoins1 [c, 1] n | n >= 0    = (n `quot` c) + 1
                     | otherwise = 0
solveCoins1 [_, _] _ = error "The coin list must end with 1"
solveCoins1 [1]    n | n >= 0    = 1
                     | otherwise = 0
solveCoins1 []     _ = error "The coin list must end with 1"

solveCoins1 (c:smallerCs) total =
    assert (c > (head smallerCs)) -- but the error message is unhelpful
    sum [solveCoins1 smallerCs (total - c * nC) | nC <- [0 .. total `quot` c]]

divides :: Int -> Int -> Bool
n `divides` k = k `rem` n == 0

main :: IO ()
main = do
    n <- arg 1 "200"
    let n' = read n :: Pennies
    print $ solve n'
