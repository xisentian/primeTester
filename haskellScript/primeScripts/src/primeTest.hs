import System.Process
-- set -hide-package cryptonite
import Crypto.Number.Prime 
import Crypto.Random
main = do
--call the process
    res <- readProcess "/Users/jarvis/code/PKIApp/primeTester/target/debug/primeTester" [] "" 
    let primeNum = read res:: Integer
    g0 <- cprgCreate <$> createEntropyPool :: IO SystemRNG
    --let g = Crypto.Random.Generator.CPRG g
    --print primeNum
    --let (h,_) = isProbablyPrime primeNum
--    print $checkPrime primeNum


--checkPrime :: Integer -> Bool 
--checkPrime num
--    | isProbablyPrime num = True 
--    | otherwise = False 
