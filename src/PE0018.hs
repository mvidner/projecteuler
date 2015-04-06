module PE0018 where

import Data.Char (isDigit)

type Row = [Int]
type TriangleGraph = [Row]

-- from position n in a given row,
-- positions n and n+1 are reachable in the next row
sample :: TriangleGraph
sample = [
    [3],
    [7, 4],
    [2, 4, 6],
    [8, 5, 9, 3]
  ]

-- combine two neighboring positions in pathsSoFar
--  with a corresponding nextRow position
combine :: (Int, Int) -> Int -> Int
combine (a, b) n = max (a+n) (b+n)

combine0 :: Int
combine0 = 0

nextPaths :: Row -> Row -> Row
nextPaths pathsSoFar nextRow = nextPaths0 (combine0:pathsSoFar) nextRow

nextPaths0 :: Row -> Row -> Row
nextPaths0 (a:b:paths) (n:row) = (combine (a, b) n) : (nextPaths0 (b:paths) row)
nextPaths0 (a:[])      (n:[])  = (combine (a, combine0) n) : []
nextPaths0 _ _                 = error "wrong row lenght"

graphPath :: TriangleGraph -> Row
graphPath g = foldl nextPaths [] g

maximumPathSum :: TriangleGraph -> Int
maximumPathSum = maximum . graphPath

getGraph :: IO TriangleGraph
getGraph = do
  text <- readFile "pe0018-Maximum-path-sum-I.txt"
  let graphText = getGraphText text
  return $ parseGraph graphText

getGraphText :: String -> String
getGraphText = unlines . (filter startsWithDigit) . lines
  where startsWithDigit s = case s of c:cs -> isDigit c
                                      _    -> False

parseGraph :: String -> TriangleGraph
parseGraph s = map parseGraphLine (lines s)

parseGraphLine :: String -> Row
parseGraphLine l = map read (words l)

main = do
  g <- getGraph
  print $ maximumPathSum g
