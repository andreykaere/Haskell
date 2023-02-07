module Exercises where

import Data.Bifunctor
import Data.Functor.Const
import Data.Functor.Identity
-- import Data.Profunctor
import Data.Maybe

-- class Bifunctor f where
--   bimap :: (a -> c) -> (b -> d) -> f a b -> f c d
--   bimap g h = first g . second h
--   first :: (a -> c) -> f a b -> f c b
--   first g = bimap g id
--   second :: (b -> d) -> f a b -> f a d
--   second = bimap id

-- data Const c a = Const c
-- data Identity a = 

-- instance Bifunctor Const where
--   bimap f _ (Const v) = Const (f v)
-- instance Bifunctor Either where
--   bimap f _ (Left x) = Left (f x)
--   bimap _ g (Right y) = Right (g y)

-- instance Bifunctor (,) where
--   bimap f g (a, b) = (f a, g b)

-- foo' x = Just (fromJust (fst x) + fromJust (snd x))

data Pair a b = Pair a b
  deriving Show

instance Bifunctor Pair where
  bimap f g (Pair a b) = Pair (f a) (g b)
  first f (Pair a b) = Pair (f a) b
  second g (Pair a b) = Pair a (g b)


type Maybe' a = Either (Const () a) (Identity a)

phi :: Maybe' a -> Maybe a
phi (Left _) = Nothing
phi (Right (Identity x)) = Just x

phi_inv :: Maybe a -> Maybe' a
phi_inv Nothing = Left (Const ())
phi_inv (Just x) = Right (Identity x)


-- phi_inv (phi Left (Const())) = phi_inv Nothing = Left (Const ())
-- phi_inv (phi Right (Identity x)) = phi_inv (Just x) = Right (Identity x)



data PreList a b = Nil | Cons a b


instance Bifunctor PreList where
  bimap f g (Cons a b) = Cons (f a) (g b)
  bimap _ _ Nil = Nil

  first _ Nil = Nil
  first f (Cons a b) = Cons (f a) b

  second _ Nil = Nil
  second g (Cons a b) = Cons a (g b)



data K2 c a b = K2 c
data Fst a b = Fst a
data Snd a b = Snd b

instance Bifunctor (K2 c) where
  bimap _ _ (K2 c) = K2 c

instance Bifunctor Fst where
  bimap f _ (Fst a) = Fst (f a)

instance Bifunctor Snd where
  bimap _ g (Snd b) = Snd (g b)


{--


-- Folding exercises

rev :: [a] -> [a]
rev x = foldl add [] x
  where add l a = (a:l)

prefixes :: [a] -> [[a]]
prefixes x = foldl (\acc x -> step x acc) [] x 
  where   
    step x [] = [[x]]
    step x acc = add_to_end (add_to_end x (last acc)) acc
    add_to_end x xs = rev (x : rev xs)


data Trie a = Leaf a | Node a [Trie a]

foldtrie :: (b -> a -> b) -> b -> Trie a -> b
foldtrie f acc (Leaf x) = f acc x
foldtrie f acc (Node x xs) = foldl f' (f acc x) xs
  where f' acc t = foldtrie f acc t


phi :: Maybe a -> Either () a
phi (Just a) = Right a
phi Nothing = Left ()
phi_inv :: Either () a -> Maybe a
phi_inv (Left ()) = Nothing
phi_inv (Right a) = Just a


-- data Bool = True | False

-- 2 x a
-- (Bool, a)

-- a + a
-- Either a a 


rho :: (Bool, a) -> Either a a 
rho x = case x of
  (True, a)  -> Left a
  (False, a) -> Right a

rho_inv :: Either a a -> (Bool, a)
rho_inv x = case x of 
  Right a -> (False, a)
  Left a  -> (True, a)

-- fmap :: (a -> b) -> (Maybe a -> Maybe b)
fmap :: (a -> b) -> Maybe a -> Maybe b
fmap _ Nothing = Nothing
fmap f (Just x) = Just (f x)


elem' :: (Eq a) => a -> [a] -> Bool
elem' _ [] = False
elem' a (x:xs) 
  | a == x = True
  | True = elem' a xs


nub' :: (Eq a) => [a] -> [a]
nub' [] = []
nub' (x:xs) 
  | elem' x xs = nub' xs
  | True = (x : nub' xs)

isAsc :: [Int] -> Bool
isAsc [] = True
isAsc [_] = True
isAsc (x:y:xs) = (x <= y) && isAsc (y:xs)

--}

