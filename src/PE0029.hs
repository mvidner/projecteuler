module PE0029 where

import Data.Set (fromList, size)

problem :: Int -> Int
problem n = size $ fromList [a^b | a <-[2..n], b<-[2..n]]

main :: IO ()
main = print $ problem 100

