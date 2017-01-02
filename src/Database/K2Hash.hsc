module Database.K2Hash where

import Foreign
import Foreign.C.String

#include <k2hash/k2hash.h>

type K2H_H = Word64

foreign import ccall safe "k2hash/k2hash.h k2h_open"
  k2h_open :: CString -> Bool -> Bool -> Bool -> Int -> Int -> Int -> CSize -> IO K2H_H

foreign import ccall safe "k2hash/k2hash.h k2h_set_value"
  k2h_set_value :: K2H_H -> CString -> CSize -> CString -> CSize -> IO Int

foreign import ccall safe "k2hash/k2hash.h k2h_close"
  k2h_close :: K2H_H -> IO Int
