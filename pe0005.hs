module PE0005 where

main :: IO ()
main = do
  print $ foldl lcm 1 [1..20]
