module PE0007 where

-- Spotted on the front page of haskell.org
-- but Melissa O'Neil calls it The Unfaithful Sieve
-- in http://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf
primes' :: [Integer]
primes' = sieve [2..]
  where sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p /= 0]
        sieve [] = []

-- "We can write trial division more clearly as"

primes :: [Integer]
primes = 2 : [x | x <- [3..], isprime x]

isprime :: Integer -> Bool
isprime x = all (\p -> x `mod` p > 0) (factorsToTry x)
  where
    factorsToTry y = takeWhile (\p -> p*p <= y) primes

main :: IO ()
main = do
  print $ primes !! 10000
