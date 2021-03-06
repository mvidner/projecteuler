module PE0004 where

import Benchmark

isPalindrome :: String -> Bool
isPalindrome s = s == reverse s

productsOfNDigitFactors :: Int -> [Int]
productsOfNDigitFactors n = let limit = 10^n
                            in [a * b | a <- [1 .. limit-1],
                                        b <- [1 .. a]]
{-
OK to brute-force this for n <= 3, even 4
-}
-- |
-- >>> largestPalindromeProduct 2
-- 9009
largestPalindromeProduct :: Int -> Int
largestPalindromeProduct n = maximum $
                             filter (isPalindrome . show)
                                    (productsOfNDigitFactors n)

main :: IO ()
main = do
    n <- arg 1 "3"
    print $ largestPalindromeProduct $ read n
