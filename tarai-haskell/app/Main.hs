module Main where

import Lib
import System.Environment ( getArgs )

main :: IO ()
main = do
    args <- getArgs
    let (x:y:z:_) = fmap read args
    putStrLn $ "Result: " ++ (show $ tarai x y z)