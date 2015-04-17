module PE0033 where

import Data.Ratio

dcfs :: [(Ratio Int, Int, Int)]
dcfs = [ (a % b,a,b) | a<-[10..99], b<-[(a+1)..99], isDcf a b]

isDcf :: Int -> Int -> Bool
isDcf ab cd =
    let r = ab % cd
        (a,b) = ab `quotRem` 10
        (c,d) = cd `quotRem` 10
        r1 = [a % c | c /= 0, b == d, b /=0]
        r2 = [b % d | d /= 0, a == c]
        r3 = [a % d | d /= 0, b == c]
        r4 = [b % c | c /= 0, a == d]
    in r `elem` (concat [r1, r2, r3, r4])

main :: IO ()
main = do
    print dcfs
    print $ denominator $ product $ map (\(a, _, _) -> a) dcfs
