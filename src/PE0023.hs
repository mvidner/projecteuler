module PE0023 where

import PrimeFactors (allDivisors)

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

sumsOfTwoAbundantNumbers = [a + b |
                            a <- abundantNumbers,
                            b <- abundantNumbers,
                            -- careful, b <= a would have a iterate to infinity
                            a <= b]
                            -- but this is still wrong

-- isS2A = `elem` sumsOfTwoAbundantNumbers

-- sum $ filter (not isS2A) [1..28123]
-- This would be inefficient

sumInts n = n * (n + 1) `div` 2
limit :: Integer
limit = 28123

answer = (sumInts limit) - (sum $ takeWhile (<= limit) sumsOfTwoAbundantNumbers)

main = do
  print answer
