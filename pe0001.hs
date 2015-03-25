import System.Environment (getArgs)

divides :: Integral a => a -> a -> Bool
n `divides` k = k `mod` n == 0

multipleOf3Or5 :: Integral a => a -> Bool
multipleOf3Or5 n = 3 `divides` n || 5 `divides` n

sumFizzBuzzUnder :: Integral a => a -> a
sumFizzBuzzUnder n = sum $ filter multipleOf3Or5 [1 .. n-1]

sumOfMultiplesUnder :: Int -> Integer -> Integer
sumOfMultiplesUnder d n = dd * (intSum m)
                          where dd       = fromIntegral d
                                m        = (n - 1) `div` dd
                                intSum a = a * (a + 1) `div` 2

sumFizzBuzzUnder' n = sumOfMultiplesUnder 3  n +
                      sumOfMultiplesUnder 5  n -
                      sumOfMultiplesUnder 15 n

-- helper for benchmarks
argWithDefault :: Integer -> IO Integer
argWithDefault s = do
  args <- getArgs
  return $ case args of
    (x:xs) -> read x
    []     -> s

main = do
  n <- argWithDefault 1000
  print $ sumFizzBuzzUnder' n
