module PE0024 where

import Data.List (permutations, sort)
import Data.ByteString.Char8 (pack, unpack)


charPermutations = permutations "0123456789"
sortedPermutations = sort $ map pack charPermutations

main = do
  putStrLn $ unpack $ sortedPermutations !! 999999