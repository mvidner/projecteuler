module PE0013 where

import Data.Char (isDigit)

main :: IO ()
main = do
  sum <- largeSum
  putStrLn $ firstDigits 10 sum

for :: [a] -> (a -> b) -> [b]
for = flip map

numbersIn :: String -> [Integer]
numbersIn contents =
  for (lines contents) $ \line ->
    if hasDigitsOnly line
      then read line :: Integer
      else 0

hasDigitsOnly :: String -> Bool
hasDigitsOnly s = (all isDigit s) && (s /= "")

largeSum :: IO Integer
largeSum = do
  contents <- readFile "PE0013-Large-sum.txt"
  return $ sum $ numbersIn contents

firstDigits :: Int -> Integer -> String
firstDigits count bigNumber =
  take count $ show bigNumber
