module Main where

import System.Process
-- set -hide-package cryptonite
import Crypto.Number.Prime 
import Crypto.Random
import Control.Monad
main = do
    --call the process
    ePool <- createEntropyPool 
    let g0 = cprgCreate ePool :: SystemRNG
    looper 1000 g0
    where 
        looper :: Int -> SystemRNG -> IO ()
        looper 0 _ = print "Done!" 
        looper n seed = do
            res <- readProcess "/Users/jarvis/code/PKIApp/primeTester/target/debug/primeTester" [] "" 
            let primeNum = read res:: Integer
            let (res, g0') = isProbablyPrime seed primeNum 
            unless res (print primeNum)
            looper (n-1) g0'
