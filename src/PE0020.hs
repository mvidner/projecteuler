module PE0020 where

import Data.Char (digitToInt)

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n-1)

digitSum :: Integer -> Int
digitSum n = sum $ map digitToInt $ show n

main :: IO ()
main = do
  print $ digitSum $ factorial 100
