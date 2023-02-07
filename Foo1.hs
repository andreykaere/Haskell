{-# LANGUAGE RankNTypes #-}

module Foo where

data Sequence x = Empty
                | Cons x (Sequence x)
  deriving(Show)


{--
readMaybe text = case reads text of
    (x,_):_ -> Just x
    []      -> Nothing
--}
