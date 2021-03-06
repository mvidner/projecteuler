Problem 1:

  If we list all the natural numbers below 10 that are multiples of 3
  or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

  Find the sum of all the multiples of 3 or 5 below 1000.

> module PE0001 where
>
> import Benchmark

First let's do a brute force solution to practice Haskell basics:

> divides :: Integral a => a -> a -> Bool
> n `divides` k = k `mod` n == 0

> multipleOf3Or5 :: Integral a => a -> Bool
> multipleOf3Or5 n = 3 `divides` n || 5 `divides` n

> sumFizzBuzzUnder :: Integral a => a -> a
> sumFizzBuzzUnder n = sum $ filter multipleOf3Or5 [1 .. n-1]

And this is an $O(n)$ solution:

> sumOfMultiplesUnder :: Integral a => a -> a -> a
> sumOfMultiplesUnder d n = dd * (intSum m)
>                           where dd       = fromIntegral d
>                                 m        = (n - 1) `div` dd
>                                 intSum a = a * (a + 1) `div` 2
>
> sumFizzBuzzUnder' :: Integral a => a -> a
> sumFizzBuzzUnder' n = sumOfMultiplesUnder 3  n +
>                       sumOfMultiplesUnder 5  n -
>                       sumOfMultiplesUnder 15 n

Run it:

> main :: IO ()
> main = do
>   n <- arg 1 "1000"
>   print $ sumFizzBuzzUnder' $ (read n :: Integer)
