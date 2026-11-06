module Main where

import System.Environment (getArgs)
import Problema2 (problema2)
import Problema3 (problema3)
import Problema4 (problema4)

-- Uso: runghc Main.hs        -> corre todos
--      runghc Main.hs 2|3|4  -> corre solo ese problema
main :: IO ()
main = do
  args <- getArgs
  let problemas = [("2", problema2), ("3", problema3), ("4", problema4)]
      elegidos  = if null args then problemas
                  else filter (\(n, _) -> n `elem` args) problemas
  mapM_ (\(_, p) -> p >> putStrLn "") elegidos
