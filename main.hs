import Database.K2Hash
import Foreign.C.String

main = do
    cpath <- newCString "/tmp/tmp.k2hash"
    handler <- k2h_open cpath False False True 8 4 32 128
    let key = "key1"
    let val = "val1"
    let keylen = fromInteger $ toInteger $ length key
    let vallen = fromInteger $ toInteger $ length val
    ckey <- newCString key
    cval <- newCString val
    result <- k2h_set_value handler ckey keylen cval vallen
    _ <- k2h_close handler
    print $ result

