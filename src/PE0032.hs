module PE0032 where
{-
Problem:

We shall say that an n-digit number is pandigital if it makes use of all the
digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1
through 5 pandigital.

The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing
multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity
can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only
include it once in your sum.
-}

import Data.List (sort)
import qualified Data.Set

import Benchmark (arg)

panN :: Int -> String
panN n
    | n < 10    = take n ['1'..]
    | otherwise = undefined

isPandigitalN :: Int -> String -> Bool
isPandigitalN n s = (length s) == n && (sort s == panN n)

isPandigitalListN :: Int -> [Int] -> Bool
isPandigitalListN n xs = isPandigitalN n $ concat $ map show xs

{-
A positive integer @i@ has (truncate (logBase 10 i)) digits
-}
numDigits :: Int -> Int
numDigits n = length $ show n

-- | Minimal and maximal @n@-digit integer
-- >>> nBounds 3
-- (100,999)
nBounds :: Int -> (Int, Int)
nBounds n = (10 ^ (n-1) , (10 ^ n) - 1)


pandigitalProductsN :: Int -> [(Int,Int,Int)]
pandigitalProductsN n = [
    (a,b,p)
    | a <- [2..alimit]
    , b <- [(bLower a)..(bUpper a)]
    , p <- [a * b]
    , isPandigitalListN n [a, b, p]
    ]
  where
    alimit = truncate $ (10::Double) ** (fromIntegral n / 2.0)
    bLower _  = 2
    bUpper aa = aa

main :: IO ()
main = do
    n <- arg 1 "9"
    let n' = read n :: Int
    putStrLn "A very stupid algorithm"
    let ps = pandigitalProductsN n'
    print ps
    let uniqueProducts = Data.Set.fromList $ map (\(_,_,p) -> p) ps
    print $ sum $ Data.Set.toList uniqueProducts

