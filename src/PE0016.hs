module PE0016 where

import Data.Char (digitToInt)

main :: IO ()
main = do
    print $ sum $ map digitToInt $ show bigNum
  where
    bigNum = 2 ^ (1000 :: Int) :: Integer
