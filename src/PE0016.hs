module PE0016 where

import Data.Char (digitToInt)

main :: IO ()
main = do
  print $ sum $ map digitToInt $ show $ 2^1000
