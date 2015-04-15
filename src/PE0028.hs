module PE0028 where

-- n: the size of the spiral is 2*n + 1
oneCorner :: Integer -> Integer
oneCorner n = (2*n+1)^2

sumCorners :: Integer -> Integer
sumCorners 0 = 1
sumCorners n = 4 * (oneCorner n) - 12 * n

sumDiagonals :: Integer -> Integer
sumDiagonals n = sum $ map sumCorners [0..n]

problem :: Integer -> Integer
problem spiralSize | even spiralSize = error "expecting an odd sized spiral"
problem spiralSize | otherwise       = sumDiagonals (spiralSize `quot` 2)

main :: IO ()
main = print $ problem 1001

