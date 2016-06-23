module Paths_primeScripts (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/jarvis/code/PKIApp/primeTester/haskellScript/primeScripts/.stack-work/install/x86_64-osx/lts-6.3/7.10.3/bin"
libdir     = "/Users/jarvis/code/PKIApp/primeTester/haskellScript/primeScripts/.stack-work/install/x86_64-osx/lts-6.3/7.10.3/lib/x86_64-osx-ghc-7.10.3/primeScripts-0.1.0.0-CHzY9HPVveOBXbsakpSepf"
datadir    = "/Users/jarvis/code/PKIApp/primeTester/haskellScript/primeScripts/.stack-work/install/x86_64-osx/lts-6.3/7.10.3/share/x86_64-osx-ghc-7.10.3/primeScripts-0.1.0.0"
libexecdir = "/Users/jarvis/code/PKIApp/primeTester/haskellScript/primeScripts/.stack-work/install/x86_64-osx/lts-6.3/7.10.3/libexec"
sysconfdir = "/Users/jarvis/code/PKIApp/primeTester/haskellScript/primeScripts/.stack-work/install/x86_64-osx/lts-6.3/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "primeScripts_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "primeScripts_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "primeScripts_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "primeScripts_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "primeScripts_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
