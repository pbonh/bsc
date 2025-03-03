module Comp.Classic (SyntaxMode(..),
                setSyntax,
                isBSV, isClassic, isEse
               ) where

import Comp.Libs.IOMutVar(MutableVar, newVar, readVar, writeVar)
import System.IO.Unsafe(unsafePerformIO)

data SyntaxMode = BSV | CLASSIC | ESE
                   deriving Eq

syntax :: MutableVar SyntaxMode
syntax = unsafePerformIO $ (newVar CLASSIC)

setSyntax :: SyntaxMode -> IO ()
setSyntax m = writeVar syntax m

isBSV :: () -> Bool
isBSV() = (unsafePerformIO $ readVar syntax) == BSV

isClassic :: () -> Bool
isClassic() = (unsafePerformIO $ readVar syntax) == CLASSIC

isEse :: () -> Bool
isEse() = (unsafePerformIO $ readVar syntax) == ESE
