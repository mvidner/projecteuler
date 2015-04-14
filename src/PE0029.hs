module PE0029 where

import Data.Set (fromList, size)

problem n = size $ fromList [a^b | a <-[2..n], b<-[2..n]]

main = print $ problem 100

