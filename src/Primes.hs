module Primes
    ( isPrime
    , primes
    , trialDivisionPrimes
    , unfaithfulSievePrimes
    ) where

primes :: [Integer]
primes = trialDivisionPrimes

unfaithfulSievePrimes :: [Integer]
unfaithfulSievePrimes = sieve [2..]
  where sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p /= 0]
        sieve []     = []

-- Melissa O'Neil
-- in http://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf
trialDivisionPrimes :: [Integer]
trialDivisionPrimes = 2 : [x | x <- [3..], isPrime x]

-- | Test primality by trial division
isPrime :: Integer -> Bool
isPrime x | x < 2 = False
isPrime x | otherwise = all (\p -> x `mod` p > 0) (factorsToTry x)
  where
    factorsToTry y = takeWhile (\p -> p*p <= y) trialDivisionPrimes
