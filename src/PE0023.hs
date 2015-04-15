module PE0023 where

import PrimeFactors (allDivisors)
import qualified Data.Set as Set

sumOfProperDivisors :: Integer -> Integer
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
sumsOfTwoAbundantNumbersUnder alimit =
    let ans = takeWhile (< alimit) abundantNumbers
        allSums = [a + b |
                   a <- ans,
                   b <- ans,
                   a <= b]
    in Set.fromList allSums

-- isS2A = `elem` sumsOfTwoAbundantNumbers

-- sum $ filter (not isS2A) [1..28123]
-- This would be inefficient

sumInts :: Integral a => a -> a
sumInts n = n * (n + 1) `div` 2

limit :: Integer
limit = 28123

answer :: Integer
answer = (sumInts limit) - (sum summableNumbers)
         where summableNumbers =
                   takeWhile (<= limit) $ Set.toList $ sumsOfTwoAbundantNumbersUnder limit

main :: IO ()
main = do
  print answer
