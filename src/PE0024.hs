module PE0024 where

import Data.List (permutations, sort)
import Data.ByteString.Char8 (pack, unpack)
import Data.ByteString.Internal (ByteString)

charPermutations :: [[Char]]
charPermutations = permutations "0123456789"

sortedPermutations :: [Data.ByteString.Internal.ByteString]
sortedPermutations = sort $ map pack charPermutations

main :: IO ()
main = do
  putStrLn $ unpack $ sortedPermutations !! 999999
