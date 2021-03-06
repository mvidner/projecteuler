module PE0003 where

import Benchmark
import qualified Primes

divides :: Integral a  => a -> a -> Bool
divides x y = y `rem` x == 0

candidateFactors :: Ord a => [a] -> a -> [a]
candidateFactors pr n = reverse $ takeWhile (< n) pr

largestPrimeFactor :: Integral a => [a] -> a -> a
largestPrimeFactor primes n = head $ filter (`divides` n) $
                                  candidateFactors primes n

-- | The first factor of @n@ since @since@.
--
-- >>> factorSince 1 10
-- 1
--
-- >>> factorSince 2 10
-- 2
--
-- >>> factorSince 3 10
-- 5
--
-- >>> factorSince 6 10
-- 10
--
-- >>> factorSince 10 10
-- 10
--
-- If @since@ > @n@ you get an exception
--
-- >>> factorSince 11 10
-- *** Exception: ...
factorSince :: Integral a => a -> a -> a
factorSince since n =
    head [i | i <- [since..n], i `divides` n]

-- | The first factor of @n@ since @since@ ('factorSince'),
--   and the resulting quotient.
--
-- >>> factorQuotientSince 3 10
-- (5,2)

-- If @since@ > @n@ you get an exception
--
-- >>> factorQuotientSince 11 10
-- *** Exception: ...
factorQuotientSince :: Integral a => a -> a -> (a, a)
factorQuotientSince since n =
    (f, n `quot` f)
  where
    f = factorSince since n

-- | Find largest factor of @n@ since @since@.
--   As @n@ has no factors less than @since@, that factor is a prime.
lpf3' :: Integral a => a -> a -> (a, a)
lpf3' since n =
    case factorQuotientSince since n of
    (prime, 1)  -> (prime, 1)
    (f, q)      -> lpf3' f q

lpf3 :: Integral a => a -> a
lpf3 1 = 1
lpf3 n = fst $ lpf3' 2 n

-- | A mapping between algorithm names and implementations
algo :: String -> (Integer -> Integer)
algo "lpf1" = largestPrimeFactor Primes.unfaithfulSievePrimes
algo "lpf2" = largestPrimeFactor Primes.trialDivisionPrimes
algo "lpf3" = lpf3
algo a = error $ "No such alorithm " ++ a

main :: IO ()
main = do
  n <- arg 1 "600851475143"
  a <- arg 2 "lpf3"
  let n' = read n :: Integer
  let result = (algo a) n'
  print result
