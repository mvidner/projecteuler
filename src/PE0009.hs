module PE0009 where

import Benchmark

isPythagoreanTriplet :: (Num a, Eq a) => (a, a, a) -> Bool
isPythagoreanTriplet (a, b, c) = a*a + b*b == c*c

-- triangle triplets a < b < c whose circumference < n
-- but those are too much!
trianglesUnderCircumference :: (Integral a) => a -> [(a, a, a)]
trianglesUnderCircumference n = [(a, b, c) | c <- [3 .. n],
			      	     	     b <- [2 .. c-1],
					     a <- [c-b+1 .. min (n-c-b-1) (b-1)]]

trianglesWithCircumference :: (Integral a) => a -> [(a, a, a)]
trianglesWithCircumference n = [(a, b, c) | c <- [n `div` 3 .. n],
			       	       	    b <- [2 .. c - 1],
					    a <- [n - c - b], 0 < a, a < b]

pythagoreanTripletsWithCircumference :: (Integral a) => a -> [(a, a, a)]
pythagoreanTripletsWithCircumference n =
  filter isPythagoreanTriplet $
    trianglesWithCircumference n

main :: IO ()
main = do
  n <- arg 1 "1000"
  let n' = read n :: Int
  (a, b, c) <- return $ head $ pythagoreanTripletsWithCircumference n'
  print (a, b, c)
  putStrLn $ "Product: " ++ (show $ a*b*c)
