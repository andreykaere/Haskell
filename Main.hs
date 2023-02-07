module Main where


-- foo x y = x >>= (\_ -> y) 

-- main = putStr "Hello " `foo` putStrLn "world!"

-- main = 
--     getContents >>= (\y ->
--     a:b:_ = words y
--     read a::Int
--     read b::Int
--     c = a + b
--     show c)
--     >>= (\c -> putStrLn c)


-- foo y = 
--   let
--     a:b:_ = words y
--     c = read a :: Integer
--     d = read b :: Integer
--     e = c + d
--   in show e


-- main = getContents >>= (\y -> pure (
--                    let
--                      a:b:_ = words y
--                      c = read a :: Integer
--                      d = read b :: Integer
--                      e = c + d
--                    in show e
--                    ))
--                    >>= (\c -> putStrLn c)





-- main = do
--   text <- getContents

--   let allNumbers = read <$> words text :: [Integer]
--       n:rest  = allNumbers
--       numbers = take (fromInteger n) rest

--   putStrLn $ show $ sum numbers



main :: IO()
-- main = print "Hello world!"
-- main = do
--   text <- getContents
  
--   let numbers = read <$> words text :: [Integer]

--   putStrLn $ show $ sum numbers

main = getContents >>= (putStrLn . show . sum . ((read :: String -> Integer) <$>) . words)
