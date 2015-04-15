module PE0025 where

import Data.List

fibs :: [Integer]
fibs = 1 : 1 : ( zipWith (+) fibs (tail fibs))

main :: IO ()
main = do
  let mi = findIndex (\n -> 1000 == (length $show n)) fibs
  let result = case mi of Just i -> show (i+1)
                          _      -> "Oops"
  putStrLn result
