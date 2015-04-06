module PE0013 where

import Data.List
import Data.Char (isDigit)

main = do
  sum <- largeSum
  putStrLn $ firstDigits 10 sum

for = flip map

numbersIn :: String -> [Integer]
numbersIn contents =
  for (lines contents) $ \line ->
    if hasDigitsOnly line
      then read line :: Integer
      else 0

hasDigitsOnly s = (all isDigit s) && (s /= "")

largeSum :: IO Integer
largeSum = do
  contents <- readFile "pe0013-Large-sum.txt"
  return $ sum $ numbersIn contents

firstDigits :: Int -> Integer -> String
firstDigits count bigNumber =
  take count $ show bigNumber
