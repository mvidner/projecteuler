module PE0010 where

-- trial division from PE0007
primes :: [Integer]
primes = 2 : [x | x <- [3..], isprime x]

isprime :: Integer -> Bool
isprime x = all (\p -> x `mod` p > 0) (factorsToTry x)
  where
    factorsToTry y = takeWhile (\p -> p*p <= y) primes

main :: IO ()
main = do
  print $ sum $ takeWhile (< 2000000) primes
