module PE0003 where

import Benchmark
import qualified Primes

divides x y = y `rem` x == 0

candidateFactors pr n = reverse $ takeWhile (< (ceiling $ sqrt $ fromIntegral n)) pr

largestPrimeFactor primes n = head $ filter (`divides` n) $
                                  candidateFactors primes n

algo "lpf1" = largestPrimeFactor Primes.unfaithfulSievePrimes
algo "lpf2" = largestPrimeFactor Primes.trialDivisionPrimes
algo a = error $ "No such alorithm " ++ a

main = do
  n <- arg 1 "600851475143"
  a <- arg 2 "lpf2"
  let n' = read n :: Integer
  let result = (algo a) n'
  print result
