fib2 (a,b) = (b,a+b)

fibs = map fst $ scanl (\a  _ -> fib2 a) (0,1) [1..]

main = do
  print $ sum $ filter even $ takeWhile (<4000000) fibs
