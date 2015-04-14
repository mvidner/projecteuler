import Control.Monad (filterM)
import System.Directory (doesFileExist)
import Test.DocTest
import Text.Printf (printf)

doctestFiles :: IO [String]
doctestFiles = do
    let names = [prefix ++ suffix |
                 i <- [1..26] :: [Int],
                 prefix <- [printf "src/PE%04d" i],
                 suffix <- [".hs", ".lhs"]
                ]
    filterM doesFileExist names

main = do
    f <- doctestFiles
    doctest $ ["-isrc"] ++ f
