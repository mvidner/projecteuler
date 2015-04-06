module PE0020 where

import Data.Char (digitToInt)

factorial 0 = 1
factorial n = n * factorial (n-1)

digitSum n = sum $ map digitToInt $ show n

main = do
  print $ digitSum $ factorial 100
