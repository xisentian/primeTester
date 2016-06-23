module Main where

import System.Process
import System.Environment
-- set -hide-package cryptonite
import Crypto.Number.Prime 
import Crypto.Random
import Control.Monad
import Criterion.Main

looper :: Int -> SystemRNG -> IO ()
looper 0 _ = print "Done!" 
looper n seed = do
    res <- readProcess "/Users/jarvis/code/PKIApp/primeTester/target/debug/primeTester" [] "" 
    let primeNum = read res:: Integer
    let (res, g0') = isProbablyPrime seed primeNum 
    unless res (print primeNum)
    looper (n-1) g0'


main = do
    --call the process
    ePool <- createEntropyPool
    let g0 = cprgCreate ePool :: SystemRNG
    args <- getArgs
    case args of
        [num] -> do
            let loops = read num :: Int 
            defaultMain[ 
                bgroup "primeTest" [ bench "10" $ nfIO (looper loops g0)
                                   -- , bench "15" $ nfIO (looper 15 g1)
                                   -- , bench "20" $ whnf (looper 20 g2)
                                    ]
                        ]
        _ -> do 
            putStrLn "No args given: Running with only 10 loops.."
            defaultMain[ 
                bgroup "primeTest" [ bench "10" $ nfIO (looper 10 g0)
                                   -- , bench "15" $ nfIO (looper 15 g1)
                                   -- , bench "20" $ whnf (looper 20 g2)
                                    ]
                        ]

--Back-up 
--main = do
--    --call the process
--    ePool <- createEntropyPool 
--    let g0 = cprgCreate ePool :: SystemRNG
--    looper 10 g0
--    where 
--        looper :: Int -> SystemRNG -> IO ()
--        looper 0 _ = print "Done!" 
--        looper n seed = do
--            res <- readProcess "/Users/jarvis/code/PKIApp/primeTester/target/debug/primeTester" [] "" 
--            let primeNum = read res:: Integer
--            let (res, g0') = isProbablyPrime seed primeNum 
--            unless res (print primeNum)
--            looper (n-1) g0'
