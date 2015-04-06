module PE0022 where

import Data.Char (ord)
import Data.List (sort)
import Data.Text (splitOn, pack, unpack)

parse :: String -> [String]
parse s = map (read . unpack) $ splitOn (pack ",") (pack s)

-- |
-- >>> wordValue "ABCD"
-- 10
-- >>> wordValue "COLIN"
-- 53
wordValue :: String -> Int
wordValue s = sum $ map letterValue s
  where letterValue c | ('A' <= c && c <= 'Z') = (ord c) - (ord 'A') + 1
                      | otherwise              = 0

-- the resulting list is sorted by the strings
sortedValues :: [String] -> [(String, Int)]
sortedValues l =
  map (\s -> (s, wordValue s)) $ sort l

-- multiply value by the position
scoreValues :: [(String, Int)] -> [(String, Int)]
scoreValues vs = zipWith (\ (s, v) (_, i) -> (s, v*i))
                         vs
                         (map (\i -> ("",i)) [1..])

main = do
  text <- readFile "pe0022-names.txt"
  let names = parse text
  let sortedNameValues = sortedValues names
  let scoredNameValues = scoreValues sortedNameValues
  print $ sum $ map snd scoredNameValues
