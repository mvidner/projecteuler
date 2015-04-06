module PE0021 where

import PE0012 (allDivisors)

properDivisors :: Integer -> [Integer]
properDivisors 0 = []
properDivisors n = filter (/= n) $ allDivisors n

sumOfProperDivisors = sum . properDivisors

isAmicable n =
  let d  = sumOfProperDivisors n
      dd = sumOfProperDivisors d
  in (n /= d) && (n == dd)

main = do
  print $ sum $ filter isAmicable [1..9999]
