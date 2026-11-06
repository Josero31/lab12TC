-- Problema 3: transpuesta de una matriz (lista de listas), usando lambdas.
module Problema3 (transpuesta, problema3) where

-- Cada fila se "pega" columna por columna con zipWith (:).
-- La lambda recibe una fila y el acumulado (las columnas ya formadas).
transpuesta :: [[a]] -> [[a]]
transpuesta [] = []
transpuesta m  = foldr (\fila acc -> zipWith (:) fila acc) (repeat []) m

mostrarMatriz :: Show a => [[a]] -> IO ()
mostrarMatriz = mapM_ (\fila -> putStrLn ("  " ++ unwords (map show fila)))

problema3 :: IO ()
problema3 = do
  let x  = [[1,2,3],[4,5,6],[7,8,9]] :: [[Int]]
      y  = [[1,2],[3,4],[5,6]]       :: [[Int]]
  putStrLn "=== Problema 3: matriz transpuesta ==="
  putStrLn "X ="                 >> mostrarMatriz x
  putStrLn "X^T ="               >> mostrarMatriz (transpuesta x)
  putStrLn ("Como lista de listas: " ++ show (transpuesta x))
  putStrLn "Ejemplo no cuadrado (3x2):" >> mostrarMatriz y
  putStrLn "Transpuesta (2x3):"         >> mostrarMatriz (transpuesta y)
