-- spotted on the front page of haskell.org
primes = sieve [2..]
  where sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p /= 0]

candidateFactors n = reverse $ takeWhile (< (ceiling $ sqrt $ fromIntegral n)) primes

largestPrimeFactor n = head $ filter (`divides` n) $ candidateFactors n
  where divides x y = y `mod` x == 0

main = do
  print $ largestPrimeFactor 600851475143
