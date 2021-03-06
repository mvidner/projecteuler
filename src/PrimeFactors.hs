module PrimeFactors
    ( primeFactorization
    , canonicalRepresentation
    , allDivisors
    ) where

import Primes (primes)
import Data.List (find, group)

divides :: Integer -> Integer -> Bool
n `divides` k = k `mod` n == 0

-- primes that are less or equal to (sqrt n) and thus can be a factor of n
possiblePrimeFactors :: Integer -> [Integer]
possiblePrimeFactors n = takeWhile (\p -> p*p <= n) primes

-- The first prime factor or Nothing if n is prime or <= 1
firstFactor :: Integer -> Maybe Integer
firstFactor n = find (`divides` n) (possiblePrimeFactors n)

-- |
-- >>> primeFactorization 100
-- [2,2,5,5]
primeFactorization :: Integer -> [Integer]
primeFactorization n
  |  n <= 1
  = []
  | otherwise
  = case firstFactor n of
      Nothing -> [n] -- n is a prime
      Just k  -> k : (primeFactorization $ n `div` k)

-- |
-- >>> canonicalRepresentation 1100
-- [(2,2),(5,2),(11,1)]
canonicalRepresentation :: Integer -> [(Integer, Int)]
canonicalRepresentation n =
  let groupedFactors = group $ primeFactorization n :: [[Integer]]
  in map ( \ (x:xs) -> (x, length (x:xs))) groupedFactors

-- |
-- >>> prod [1,3,9] [1,2,4]
-- [1,2,4,3,6,12,9,18,36]
prod :: Num a => [a] -> [a] -> [a]
prod as bs = [a * b | a <- as, b <- bs]

allDivisorsFromCanonicalRepresentation :: [(Integer, Int)] -> [Integer]
allDivisorsFromCanonicalRepresentation [] = [1]
allDivisorsFromCanonicalRepresentation ((prime, power):rest) =
  [prime ^ e | e <- [0..power]] `prod` (allDivisorsFromCanonicalRepresentation rest)

-- |
-- (note the list is not sorted)
--
-- >>> allDivisors 28
-- [1,7,2,14,4,28]
allDivisors :: Integer -> [Integer]
allDivisors n = allDivisorsFromCanonicalRepresentation $
	          canonicalRepresentation n
