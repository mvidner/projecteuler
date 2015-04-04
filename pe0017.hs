import Data.Char (isLetter)

digitWords =
  ["zero", "one", "two", "three", "four",
   "five", "six", "seven", "eight", "nine"]

teens =
  ["ten", "eleven", "twelve", "thirteen", "fourteen",
   "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]

tens =
  [undefined, undefined, "twenty", "thirty", "forty",
   "fifty", "sixty", "seventy", "eighty", "ninety"]

numberInWords :: Int -> String
numberInWords n
  | n < 0 = "minus " ++ numberInWords (-n)
  | n < 10 = digitWords !! n
  | n < 20 = teens !! (n - 10)
  | n < 100 = connectedNumberInWords (tensInWords n) "-" (n `mod` 10)
  | n < 1000 = connectedNumberInWords (hundredsInWords n) " and " (n `mod` 100)
  | n < 10000 = connectedNumberInWords (thousandsInWords n) " " (n `mod` 1000)
  | otherwise = "many"


tensInWords n = tens !! (n `div` 10)
hundredsInWords n = (numberInWords (n `div` 100)) ++ " hundred"
thousandsInWords n = (numberInWords (n `div` 1000)) ++ " thousand"

-- connectedNumberInWords "twenty" "-" 0
-- >> "twenty"
-- connectedNumberInWords "twenty" "-" 1
-- >> "twenty-one"
-- connectedNumberInWords "two hundred" " and " 0
-- >> "two hundred"
-- connectedNumberInWords "two hundred" " and " 15
-- >> "two hundred and fifteen"
connectedNumberInWords :: String -> String -> Int -> String
connectedNumberInWords bigWord connector smallNumber =
  if smallNumber == 0
  then bigWord
  else bigWord ++ connector ++ (numberInWords smallNumber)

main = do
  print $ sum $ map (length . (filter isLetter) . numberInWords) [1..1000]
