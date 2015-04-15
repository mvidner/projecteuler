module PE0015 where

answer :: Integer -> Integer
answer n = (2 * n) `over` n

over :: Integer -> Integer -> Integer
over n k = factorial n `quot` ((factorial k) * (factorial (n-k)))

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

main :: IO ()
main = print $ answer 20
