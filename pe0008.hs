
digitString :: IO [Char]
digitString = do
--  h <- openFile "pe0008-Largest-product-in-a-series.txt"
  return "123456789123456789" -- fake

-- (theProduct, theDigits) = largestProduct numDigits digitString
largestProduct :: Int -> [Char] -> (Integer, [Int])
largestProduct numDigits digitString = (42, [6, 7]) -- fake

main :: IO ()
main = do
  ds <- digitString
  (product, digits) <- return $ largestProduct 13 ds
  putStrLn $ "Product: " ++ show product
  putStrLn $ "Digits:  " ++ show digits
