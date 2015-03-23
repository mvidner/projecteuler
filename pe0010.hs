-- trial division from pe0007
primes = 2 : [x | x <- [3..], isprime x]

isprime x = all (\p -> x `mod` p > 0) (factorsToTry x)
  where
    factorsToTry x = takeWhile (\p -> p*p <= x) primes

main = do
  print $ sum $ takeWhile (< 2000000) primes
