-- Problema 2: ordenar una lista de diccionarios por un key, usando lambdas.
module Problema2 (Valor(..), Diccionario, ordenarPorKey, mostrarDicc, problema2) where

import Data.List (sortBy)
import qualified Data.Map as M

-- Un valor del diccionario puede ser texto o número (como en el ejemplo).
data Valor = Texto String | Numero Int
  deriving (Eq, Ord)

instance Show Valor where
  show (Texto s)  = "'" ++ s ++ "'"
  show (Numero n) = show n

type Diccionario = M.Map String Valor

-- La lambda compara dos diccionarios usando el valor del key indicado.
ordenarPorKey :: String -> [Diccionario] -> [Diccionario]
ordenarPorKey key = sortBy (\a b -> compare (M.lookup key a) (M.lookup key b))

-- Muestra el diccionario respetando el orden make, model, color.
mostrarDicc :: [String] -> Diccionario -> String
mostrarDicc orden d =
  "{" ++ unirCon ", " (map (\k -> "'" ++ k ++ "': " ++ maybe "None" show (M.lookup k d)) orden) ++ "}"
  where unirCon sep = foldr1 (\x acc -> x ++ sep ++ acc)

telefonos :: [Diccionario]
telefonos = map M.fromList
  [ [("make", Texto "Nokia"),   ("model", Numero 216), ("color", Texto "Black")]
  , [("make", Texto "Mi Max"),  ("model", Numero 2),   ("color", Texto "Gold")]
  , [("make", Texto "Samsung"), ("model", Numero 7),   ("color", Texto "Blue")]
  ]

problema2 :: IO ()
problema2 = do
  let orden = ["make", "model", "color"]
      imprimir = mapM_ (\d -> putStrLn ("  " ++ mostrarDicc orden d))
  putStrLn "=== Problema 2: ordenar lista de diccionarios ==="
  putStrLn "Lista original:"
  imprimir telefonos
  mapM_ (\k -> do
           putStrLn ("Ordenada por key = '" ++ k ++ "':")
           imprimir (ordenarPorKey k telefonos))
        ["model", "make", "color"]
