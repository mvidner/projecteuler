module PE0015 where

answer n = (2 * n) `over` n

over n k = factorial n `quot` ((factorial k) * (factorial (n-k)))

factorial 0 = 1
factorial n = n * factorial (n - 1)

main = print $ answer 20
