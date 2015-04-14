module Primes
    ( isPrime
    , primes
    , trialDivisionPrimes
    , unfaithfulSievePrimes
    ) where

primes = trialDivisionPrimes

unfaithfulSievePrimes = sieve [2..]
  where sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p /= 0]

-- Melissa O'Neil
-- in http://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf
trialDivisionPrimes = 2 : [x | x <- [3..], isPrime x]

isPrime x = all (\p -> x `mod` p > 0) (factorsToTry x)
  where
    factorsToTry x = takeWhile (\p -> p*p <= x) trialDivisionPrimes
