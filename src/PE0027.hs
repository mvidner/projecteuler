module PE0027 where

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

solve n = maximum [primeRunLength (genericQuadratic a b)
                  | a <- [(-n)..n]
                  , b <- [(-n)..n]
                  ]

main = do
  n <- arg 1 "1000"
  let n' = read n :: Integer
  let result = solve n'
  print result
