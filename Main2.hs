{-
compress text@(a:b:rest)
  | length text == 2 && a == b = [a]
  | length text == 2           = [a, b]
  | a == b = compress (b : rest)
  | True   = (a : compress (b : rest))

main = getContents >>= (putStrLn . compress)
-}



process 

main = getContents >>= (putStrLn . process)
