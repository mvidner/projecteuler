import Primes (trialDivisionPrimes)
import Data.List (find, group)

primes =  trialDivisionPrimes

divides :: Integer -> Integer -> Bool
n `divides` k = k `mod` n == 0

possibleFirstFactors n = takeWhile (\p -> p*p <= n) primes

-- The first prime factor or Nothing if n is prime or <= 1
firstFactor :: Integer -> Maybe Integer
firstFactor n = find (`divides` n) (possibleFirstFactors n)

-- primeFactorization 100
-- >>> [2,2,5,5]
primeFactorization :: Integer -> [Integer]
primeFactorization n
  |  n <= 1
  = []
  | otherwise
  = case firstFactor n of
      Nothing -> [n] -- n is a prime
      Just k  -> k : (primeFactorization $ n `div` k)

-- canonicalRepresentation 1100
-- >>> [(2,2),(5,2),(11,1)]
canonicalRepresentation :: Integer -> [(Integer, Int)]
canonicalRepresentation n =
  let groupedFactors = group $ primeFactorization n :: [[Integer]]
  in map ( \ (x:xs) -> (x, length (x:xs))) groupedFactors

prod as bs = [a * b | a <- as, b <- bs]

allDivisorsFromCanonicalRepresentation :: [(Integer, Int)] -> [Integer]
allDivisorsFromCanonicalRepresentation [] = [1]
allDivisorsFromCanonicalRepresentation ((prime,exponent):rest) =
  [prime ^ e | e <- [0..exponent]] `prod` (allDivisorsFromCanonicalRepresentation rest)

-- (note the list is not sorted)
-- allDivisors 1100
-- >>> [1,2,4, 5,10,20, 25,50,100, 11,   (2,2),(5,2),(11,1)]
allDivisors :: Integer -> [Integer]
allDivisors n = allDivisorsFromCanonicalRepresentation $
	          canonicalRepresentation n

triangulars = [n*(n+1) `div` 2 | n <- [1..]]

main = do
  print $ find ((>500) . length . allDivisors) triangulars
