module Paths_gdiff_th (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,1], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/Users/jfischoff/Library/Haskell/lib//bin"
libdir     = "/Users/jfischoff/Library/Haskell/lib//lib/gdiff-th-0.1.0.1/x86_64/ghc-7.6.1"
datadir    = "/Users/jfischoff/Library/Haskell/lib//share/gdiff-th-0.1.0.1"
libexecdir = "/Users/jfischoff/Library/Haskell/lib//libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "gdiff_th_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "gdiff_th_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "gdiff_th_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "gdiff_th_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
