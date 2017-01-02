import Database.K2Hash
import Foreign.C.String
import Foreign.Ptr

main = do
    cpath <- newCString "/tmp/tmp.k2hash"
    handler <- k2h_open cpath False False True 8 4 32 128
    let key = "key1"
    let val = "val1"
    ckey <- newCString key
    cval <- newCString val
    setResult <- k2h_set_str_value handler ckey cval
    cretval <- k2h_get_str_direct_value handler ckey
    retval <- peekCString cval
    _ <- k2h_close handler
    print $ val

