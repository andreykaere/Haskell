--module Foo(main) where

--f >>= g = \world -> case f world of (a, world1) -> g a world1

main = 
    putStrLn "Enter your name: " >>= (\x ->
    getLine                      >>= (\y ->
    putStr   "Hello there, "     >>= (\z ->
    putStrLn y)))



--curry' :: (a -> b -> c) -> ((a,b) -> c)
--curry' :: ((a,b) -> c) -> (a -> b -> c)
--curry' f a b = f (a,b)

--x = (2 :: Int, "Vasya")
--y = (2, "Vasya")


--uncurry' :: (a -> b -> c) -> ((a,b) -> c)
--uncurry' f (a,b) = f a b


--foo x y = x + y

--bar = uncurry' foo


--x = [1,2,3]
--one=1
--two=2

--[two,three] = [2,3]

--two:three:[] = 2:3:[]

{-repeat x = x : repeat x

iterate f x = x : iterate f (f x)

take n [] = []
take n (x:xs) = x : take (n-1) xs

f <$> [] = []
f <$> (x:xs) = f x : (f <$> xs)

filter p [] = []
filter p (x:xs) 
  | p x  = x : filter p xs
  | True = filter p xs
  
-}


