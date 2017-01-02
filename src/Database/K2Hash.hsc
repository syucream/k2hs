module Database.K2Hash where

import Foreign
import Foreign.C.String
import Foreign.C.Types

#include <k2hash/k2hash.h>

type K2H_H = Word64
type PPVal = Ptr CString
type PSize = Ptr CSize

foreign import ccall safe "k2hash/k2hash.h k2h_open"
  k2h_open :: CString -> Bool -> Bool -> Bool -> Int -> Int -> Int -> CSize -> IO K2H_H

foreign import ccall "k2hash/k2hash.h k2h_get_value"
  k2h_get_value :: K2H_H -> CString -> CSize -> PPVal -> PSize -> IO Int

foreign import ccall "k2hash/k2hash.h k2h_get_str_direct_value"
  k2h_get_str_direct_value :: K2H_H -> CString -> IO CString

foreign import ccall safe "k2hash/k2hash.h k2h_set_value"
  k2h_set_value :: K2H_H -> CString -> CSize -> CString -> CSize -> IO Int

foreign import ccall safe "k2hash/k2hash.h k2h_close"
  k2h_close :: K2H_H -> IO Int

