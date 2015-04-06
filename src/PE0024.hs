module PE0024 where

import Data.List (permutations,sort)

main = do
  putStrLn $ (sort (permutations "0123456789")) !! 999999
