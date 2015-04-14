module Benchmark
    ( arg
    ) where

import System.Environment (getArgs)

arg :: Int
    -> String
    -> IO String
arg index fallback = do
  args <- getArgs
  let argsAl = zip [1..] args
  let arg = lookup index argsAl
  return $ maybe fallback id arg
