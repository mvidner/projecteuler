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

import Benchmark (arg)

panN :: Int -> String
panN n
    | n < 10    = take n ['1'..]
    | otherwise = undefined

isPandigitalN :: Int -> String -> Bool
isPandigitalN n s = (length s) == n && (sort s == panN n)

isPandigitalListN :: Int -> [Int] -> Bool
isPandigitalListN n xs = isPandigitalN n $ concat $ map show xs

pandigitalProductsN :: Int -> [Int]
pandigitalProductsN n = [p
                        | a <- [1..10^n]
                        , b <- [1..10^n]
                        , p <- [a * b]
                        , isPandigitalListN n [a, b, p]
                        ]

main :: IO ()
main = do
    n <- arg 1 "9"
    let n' = read n :: Int
    putStrLn "A very stupid algorithm"
    print $ take 2 $ pandigitalProductsN n'

