module PE0023 where

import PrimeFactors (allDivisors)
import qualified Data.Set as Set

sumOfProperDivisors n = sum (allDivisors n) - n

sumOfProperDivisorsAlist :: [(Integer,Integer)]
sumOfProperDivisorsAlist = map (\n -> (n, sumOfProperDivisors n)) [0..]

isAbundant :: Int -> Bool
isAbundant n =
    let (_, spd) = sumOfProperDivisorsAlist !! n
    in spd > fromIntegral n

-- isPerfect n
-- isDeficient n

abundantNumbers :: [Integer]
abundantNumbers = map fromIntegral $ filter isAbundant [1..]

sumsOfTwoAbundantNumbersUnder :: Integer -> Set.Set Integer
sumsOfTwoAbundantNumbersUnder limit =
    let ans = takeWhile (< limit) abundantNumbers
        allSums = [a + b |
                   a <- ans,
                   b <- ans,
                   a <= b]
    in Set.fromList allSums

-- isS2A = `elem` sumsOfTwoAbundantNumbers

-- sum $ filter (not isS2A) [1..28123]
-- This would be inefficient

sumInts n = n * (n + 1) `div` 2
limit :: Integer
limit = 28123

answer = (sumInts limit) - (sum summableNumbers)
         where summableNumbers =
                   takeWhile (<= limit) $ Set.toList $ sumsOfTwoAbundantNumbersUnder limit

main = do
  print answer
