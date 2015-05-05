module PE0008 where

import Data.Char (isDigit, digitToInt)
import Data.List (maximumBy)
import Data.Ord (comparing)

-- | Applies a function but returns a pair of (input, output)
apply :: (a -> b) -> a -> (a, b)
apply f x = (x, f x)

fileContents :: IO String
fileContents = readFile "PE0008-Largest-product-in-a-series.txt"

getDigitString :: IO [Char]
getDigitString = do
  contents <- fileContents
  return $ foldl (++) "" $ filter hasDigitsOnly $ lines contents where
    hasDigitsOnly = all isDigit

spans :: Int -> [a] -> [[a]]
spans _ []     = []
spans n (x:xs) = (fst $ splitAt n (x:xs)):(spans n xs)

stringProduct :: String -> Integer
stringProduct s = product $ map (fromIntegral . digitToInt) s

-- (theDigits, theProduct) = largestProduct numDigits digitString
largestProduct :: Int -> [Char] -> ([Char], Integer)
largestProduct numDigits digitString =
  maximumBy (comparing snd) $ products numDigits digitString where
    products n s = map (apply stringProduct) $ spans n s

main :: IO ()
main = do
  let len = 13
  ds <- getDigitString
  (digits, theProduct) <- return $ largestProduct len ds
  putStrLn $ "Product: " ++ show theProduct
  putStrLn $ "Digits:  " ++ show digits
