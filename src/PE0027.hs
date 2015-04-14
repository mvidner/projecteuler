module PE0027 where

import Data.List (foldl')

import Benchmark
import Primes (isPrime)

genericQuadratic a b n = n*n + a*n + b

fortyPrimeQuadratic  = genericQuadratic 1 41
eightyPrimeQuadratic = genericQuadratic (-79) 1601

primeRunLength :: (Integer -> Integer) -> Integer
primeRunLength generator =
    prl 0 generator
  where
    prl start generator
        | isPrime (generator start) = prl (start + 1) generator
        | otherwise = start

-- apply a binary function, remembering the arguments
tabulate2 f x y = (f x y, x, y)

strictMaximum = foldl' max 0
strictMaximum1stOf3 =
    foldl' max1Of3 (0,undefined,undefined)
  where
    max1Of3 a@(a1,_,_) b@(b1,_,_) = if b1 > a1
                                    then b
                                    else a
solve n = strictMaximum [
    primeRunLength (genericQuadratic a b)
    | a <- [(-n)..n]
    , b <- [(-n)..n]
    ]

solve2 n = (\(l,a,b) -> (l,a,b,a*b)) $ strictMaximum1stOf3 [
    (primeRunLength (genericQuadratic a b), a, b)
    | a <- [(-n)..n]
    , b <- [(-n)..n]
    ]


main = do
  n <- arg 1 "1000"
  let n' = read n :: Integer
  let result = solve2 n'
  print result
