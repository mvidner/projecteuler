import System.IO
import Data.Char (isDigit, digitToInt)
import Data.List.Split

fileContents :: IO String
fileContents = do
  handle   <- openFile "pe0008-Largest-product-in-a-series.txt" ReadMode
  contents <- hGetContents handle
  print $ lines contents -- why needed??
  hClose handle
  return contents

digitString :: IO [Char]
digitString = do
  contents <- fileContents
  return $ foldl (++) "" $ filter hasDigitsOnly $ lines contents where
    hasDigitsOnly = all isDigit

spans :: Int -> [a] -> [[a]]
spans n []     = []
spans n (x:xs) = (fst $ splitAt n (x:xs)):(spans n xs)

stringProduct :: String -> Int
stringProduct s = product $ map digitToInt s

-- (theProduct, theDigits) = largestProduct numDigits digitString
largestProduct :: Int -> [Char] -> (Integer, [Int])
largestProduct numDigits digitString =
  (fromIntegral $ maximum $ products numDigits digitString , [6,7]) where
    products n s = map stringProduct $ spans n s
{-
  let nonZeroChunks = splitOn "0" digitString,
      longChunks = filter ((>= numDigits) . length) nonzeroChunks

  longChunks numDigits $ nonZeroChunks digitString
-}

main :: IO ()
main = do
  len <- return 13
  ds <- digitString
  nonzeroChunks <- return $ splitOn "0" ds
  longChunks <- return $ filter ((>= len) . length) nonzeroChunks
  print longChunks
  (product, digits) <- return $ largestProduct len ds
  putStrLn $ "Product: " ++ show product
  putStrLn $ "Digits:  " ++ show digits
