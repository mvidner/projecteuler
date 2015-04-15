module PE0005 where

import Benchmark

problem :: Integer -> Integer
problem n = foldl lcm 1 [1..n]

main :: IO ()
main = do
  n <- arg 1 "20"
  let n' = read n :: Integer
  print $ problem n'
