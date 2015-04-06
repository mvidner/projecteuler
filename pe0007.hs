module PE0007 where

-- Spotted on the front page of haskell.org
-- but Melissa O'Neil calls it The Unfaithful Sieve
-- in http://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf
primes' = sieve [2..]
  where sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p /= 0]

-- "We can write trial division more clearly as"

primes = 2 : [x | x <- [3..], isprime x]

isprime x = all (\p -> x `mod` p > 0) (factorsToTry x)
  where
    factorsToTry x = takeWhile (\p -> p*p <= x) primes

main = do
  print $ primes !! 10000
