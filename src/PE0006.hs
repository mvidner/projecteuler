module PE0006 where

import Control.Applicative  -- <$> and <*>

sumn :: Integer -> Integer
sumn n = (n + 1) * n `div` 2

square :: Integer -> Integer
square n = n * n

squareOfSum :: Integer -> Integer
squareOfSum = square . sumn

sumOfSquares :: Integer -> Integer
sumOfSquares n = sum $ map square [1..n]

sumSquareDifference :: Integer -> Integer
sumSquareDifference n = (squareOfSum n) - (sumOfSquares n)

sumSquareDifference' :: Integer -> Integer
sumSquareDifference'  = subtract <$> sumOfSquares <*> squareOfSum 

main :: IO ()
main = do
  print $ sumSquareDifference 100
