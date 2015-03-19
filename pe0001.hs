divides :: Integral a => a -> a -> Bool
n `divides` k = k `mod` n == 0

multipleOf3Or5 :: Integral a => a -> Bool
multipleOf3Or5 n = 3 `divides` n || 5 `divides` n

sumFizzBuzzUnder :: Integral a => a -> a
sumFizzBuzzUnder n = sum $ filter multipleOf3Or5 [1 .. n-1]

main = do
  print $ sumFizzBuzzUnder 1000
