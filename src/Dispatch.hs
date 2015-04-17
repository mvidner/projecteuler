module Dispatch
       (
           dispatch
       ) where

-- Add here, and to /projecteuler.cabal(library/exposed-modules)

import qualified PE0001(main)
import qualified PE0002(main)
import qualified PE0003(main)
import qualified PE0004(main)
import qualified PE0005(main)
import qualified PE0006(main)
import qualified PE0007(main)
import qualified PE0008(main)
import qualified PE0009(main)
import qualified PE0010(main)
import qualified PE0011(main)
import qualified PE0012(main)
import qualified PE0013(main)
import qualified PE0014(main)
import qualified PE0015(main)
import qualified PE0016(main)
import qualified PE0017(main)
import qualified PE0018(main)
import qualified PE0019(main)
import qualified PE0020(main)
import qualified PE0021(main)
import qualified PE0022(main)
import qualified PE0023(main)
import qualified PE0024(main)
import qualified PE0025(main)
import qualified PE0026(main)
import qualified PE0027(main)
import qualified PE0028(main)
import qualified PE0029(main)
import qualified PE0030(main)
import qualified PE0031(main)
import qualified PE0032(main)
import qualified PE0033(main)

-- | An IO action dispatching from the common 'Main.main' to the
--   respective main of each problem module.
dispatch :: Int -> IO ()
dispatch 0001 = PE0001.main
dispatch 0002 = PE0002.main
dispatch 0003 = PE0003.main
dispatch 0004 = PE0004.main
dispatch 0005 = PE0005.main
dispatch 0006 = PE0006.main
dispatch 0007 = PE0007.main
dispatch 0008 = PE0008.main
dispatch 0009 = PE0009.main
dispatch 0010 = PE0010.main
dispatch 0011 = PE0011.main
dispatch 0012 = PE0012.main
dispatch 0013 = PE0013.main
dispatch 0014 = PE0014.main
dispatch 0015 = PE0015.main
dispatch 0016 = PE0016.main
dispatch 0017 = PE0017.main
dispatch 0018 = PE0018.main
dispatch 0019 = PE0019.main
dispatch 0020 = PE0020.main
dispatch 0021 = PE0021.main
dispatch 0022 = PE0022.main
dispatch 0023 = PE0023.main
dispatch 0024 = PE0024.main
dispatch 0025 = PE0025.main
dispatch 0026 = PE0026.main
dispatch 0027 = PE0027.main
dispatch 0028 = PE0028.main
dispatch 0029 = PE0029.main
dispatch 0030 = PE0030.main
dispatch 0031 = PE0031.main
dispatch 0032 = PE0032.main
dispatch 0033 = PE0033.main
dispatch    n = error $ "No runner defined for problem " ++ show n
