import Control.Monad (filterM)
import System.Directory (doesFileExist, removeFile)
import System.FilePath (replaceExtension)
import Test.DocTest
import Text.Printf (printf)

numProblems = 26 :: Int
dir = "src"

objectForSource :: String -> String
objectForSource s = replaceExtension s ".o"

removePeskyObjectFiles :: [String] -> IO ()
removePeskyObjectFiles hs = do
    let os = map objectForSource hs
    existingOs <- filterM doesFileExist os
    mapM_ removeFile existingOs

doctestFiles :: IO [String]
doctestFiles = do
    let names = [prefix ++ suffix |
                 i <- [1 .. numProblems],
                 prefix <- [printf "%s/PE%04d" dir i],
                 suffix <- [".hs", ".lhs"]
                ]
    peFiles <- filterM doesFileExist names
    let libFiles = map ((dir ++ "/") ++) [ "Benchmark.hs"
                                         , "PrimeFactors.hs"
                                         , "Primes.hs"
                                         ]
    return $ peFiles ++ libFiles

main = do
    fs <- doctestFiles
    removePeskyObjectFiles fs
    doctest $ ["-i" ++ dir] ++ fs
