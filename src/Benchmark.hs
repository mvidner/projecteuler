module Benchmark
    ( arg
    ) where

import System.Environment (getArgs)

-- | Access System.Environment.getArgs with, a default value.
arg :: Int                      -- ^ Argument index (1-based)
    -> String                   -- ^ The default value
    -> IO String
arg index fallback = do
  args <- getArgs
  let argsAl = zip [1..] args
  let a = lookup index argsAl
  return $ maybe fallback id a
