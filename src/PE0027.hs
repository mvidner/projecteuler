module PE0027 where

import Data.List (foldl')

import Benchmark
import Primes (isPrime)

genericQuadratic :: Integer -> Integer -> Integer -> Integer
genericQuadratic a b n = n*n + a*n + b

fortyPrimeQuadratic :: Integer -> Integer
fortyPrimeQuadratic  = genericQuadratic 1 41

eightyPrimeQuadratic :: Integer -> Integer
eightyPrimeQuadratic = genericQuadratic (-79) 1601

primeRunLength :: (Integer -> Integer) -> Integer
primeRunLength g =
    prl 0 g
  where
    prl start generator
        | isPrime (generator start) = prl (start + 1) generator
        | otherwise = start

strictMaximum :: [Integer] -> Integer
strictMaximum = foldl' max 0

strictMaximum1stOf3 :: [(Integer, a, b)] -> (Integer, a, b)
strictMaximum1stOf3 =
    foldl' max1Of3 (0,undefined,undefined)
  where
    max1Of3 a@(a1,_,_) b@(b1,_,_) = if b1 > a1
                                    then b
                                    else a

solve :: Integer -> Integer
solve n = strictMaximum [
    primeRunLength (genericQuadratic a b)
    | a <- [(-n)..n]
    , b <- [(-n)..n]
    ]

solve2 :: Integer -> (Integer, Integer, Integer, Integer)
solve2 n = (\(l,a,b) -> (l,a,b,a*b)) $ strictMaximum1stOf3 [
    (primeRunLength (genericQuadratic a b), a, b)
    | a <- [(-n)..n]
    , b <- [(-n)..n]
    ]

main :: IO ()
main = do
  n <- arg 1 "1000"
  let n' = read n :: Integer
  let result = solve2 n'
  print result
