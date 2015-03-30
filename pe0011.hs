import Data.Char (isDigit, digitToInt)
import Data.List (tails)
import System.IO

type SizeI  = Int
type EntryI = Int

type Grid = [[EntryI]]

type Tuple = [EntryI]
type Tuples = [Tuple]

fromString :: String -> Int
fromString s = read s

extractGrid :: String -> Grid
extractGrid contents = 
  let
    ls = lines contents :: [String]
    wordLines = map words ls :: [[String]]
    numericLines = filter (all (\word -> all isDigit word)) wordLines :: [[String]]
    numberLines = map (\line -> map (\word -> fromString word) line) numericLines
  in filter (not . null) numberLines

readGrid :: String -> IO Grid
readGrid fileName = do
  contents <- readFile fileName
  return $ extractGrid contents

maximumProductOfTuples :: Int -> Grid -> Integer
maximumProductOfTuples n grid =
  maximum $ map (product . map fromIntegral) $ candidateTuples n grid

candidateTuples :: Int -> Grid -> Tuples
candidateTuples n grid =
  (candidateTuplesHorizontal n grid) ++
  (candidateTuplesVertical   n grid) ++
  (candidateTuplesSlash      n grid) ++
  (candidateTuplesBackslash  n grid)

candidateTuplesHorizontal :: Int -> Grid -> Tuples
candidateTuplesHorizontal n grid =
  [ sliceH n grid (r, c) |
    r <- [0 .. (gridRows grid) - 1],
    c <- [0 .. (gridCols grid) - n]
  ]

candidateTuplesVertical   :: Int -> Grid -> Tuples
candidateTuplesVertical   n grid =
  [ sliceV n grid (r, c) |
    r <- [0 .. (gridRows grid) - n],
    c <- [0 .. (gridCols grid) - 1]
  ]

candidateTuplesSlash      :: Int -> Grid -> Tuples
candidateTuplesSlash      n grid =
  [ sliceS n grid (r, c) |
    r <- [0 .. (gridRows grid) - n],
    c <- [(n - 1) .. (gridCols grid) - 1]
  ]

candidateTuplesBackslash  :: Int -> Grid -> Tuples
candidateTuplesBackslash  n grid =
  [ sliceB n grid (r, c) |
    r <- [0 .. (gridRows grid) - n],
    c <- [0 .. (gridCols grid) - n]
  ]

gridGet :: Grid -> (SizeI, SizeI) -> EntryI
gridGet g (row, col) = (g !! row) !! col

gridRows :: Grid -> SizeI
gridRows g = length g

gridCols :: Grid -> SizeI
gridCols g = length $ head g

slice :: SizeI -> Grid -> (SizeI, SizeI) -> (SizeI, SizeI) -> Tuple
slice size g (startRow, startCol) (dRow, dCol) =
  take size [
       	     gridGet g (r, c) |
       	     r <- [startRow, startRow + dRow ..],
       	     c <- [startCol, startCol + dCol ..]
	    ]

sliceH size g (row, col) = slice size g (row, col) (0, 1)
sliceV size g (row, col) = slice size g (row, col) (1, 0)
sliceS size g (row, col) = slice size g (row, col) (1, -1)
sliceB size g (row, col) = slice size g (row, col) (1, 1)

main :: IO ()
main = do
  grid <- readGrid "pe0011-Largest-product-in-a-grid.txt"
--  print $ sliceH 4 grid (1, 2)
  print $ maximumProductOfTuples 4 grid
--  print $ candidateTuplesHorizontal 4 grid
