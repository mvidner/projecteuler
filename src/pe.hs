module Main where

import Benchmark (arg)
import Dispatch (dispatch)

main :: IO ()
main = do
    n <- arg 3 "1"
    let d = dispatch $ read n
    putStrLn $ "Running " ++ n
    d

