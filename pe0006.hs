import Control.Applicative  -- <$> and <*>

sumn n = (n + 1) * n `div` 2

squareOfSum = (^2) . sumn

sumOfSquares n = sum $ map (^2) [1..n]

sumSquareDifference n = (squareOfSum n) - (sumOfSquares n)

sumSquareDifference'  = subtract <$> sumOfSquares <*> squareOfSum 

main :: IO ()
main = do
  print $ sumSquareDifference 100
