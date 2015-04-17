import Data.Tuple (swap)

import Primes(isPrime)

rotations :: [a] -> [[a]]
rotations xs =
    map (\(a,b) -> a ++ b) $ map (\i -> swap $ splitAt i xs) $ [1..(length xs)]

numRotations :: Integer -> [Integer]
numRotations n = map read $ rotations $ show n

main = do
    let rotationalPrimes = filter (all isPrime . numRotations) [1..1000000]
    print rotationalPrimes
    print $ length rotationalPrimes

