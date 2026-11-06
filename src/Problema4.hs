-- Problema 4: eliminar elementos indicados de una lista, usando lambdas.
module Problema4 (eliminar, problema4) where

-- Se conserva cada elemento que NO aparece en la lista a borrar.
-- Los elementos a borrar que no existen (como 'cafe') simplemente se ignoran.
eliminar :: Eq a => [a] -> [a] -> [a]
eliminar borrar = filter (\x -> not (x `elem` borrar))

problema4 :: IO ()
problema4 = do
  let colores = ["rojo", "verde", "azul", "amarillo", "gris", "blanco", "negro"]
      borrar  = ["amarillo", "cafe", "blanco"]
  putStrLn "=== Problema 4: eliminar elementos de una lista ==="
  putStrLn ("Lista inicial:      " ++ show colores)
  putStrLn ("Elementos a borrar: " ++ show borrar)
  putStrLn ("Resultado:          " ++ show (eliminar borrar colores))
