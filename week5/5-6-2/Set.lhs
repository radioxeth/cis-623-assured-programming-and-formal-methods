--------------------------------------------------------------------------------

Set.lhs 

This module implement an abstract data type of sets, as a list (a member of Eq). 
The primary method of implementation is list comprehensions.

--------------------------------------------------------------------------------

> module Set  ( Set ,
> empty              , -- Set a
> sing               , -- a -> Set a
> subSet             , -- Eq a => Set a -> Set a -> Bool
> eqSet              , -- Eq a  => Set a -> Set a -> Bool
> memSet             , -- Eq a => Set a -> a -> Bool
> flatten            , -- Set a -> [a]
> makeSet            , -- Eq a => [a] -> Set a
> union,inter,diff   , -- Eq a => Set a -> Set a -> Set a
> card               , -- Set a -> Int
> showSet            , -- (a -> String) -> Set a -> String
> ) where

mapSet             , -- Eq b => (a -> b) -> Set a -> Set b
filterSet          , -- (a -> Bool) -> Set a -> Set a
foldSet            , -- (a -> a -> a) -> a -> Set a -> a

We may use functions from the Data.List library (except union)

> import Prelude hiding (elem)
> import Data.List hiding (union, inter, elem)

Declare the data type Set

> newtype Set a = Set [a]

> empty :: Set a
> empty = Set []

> sing   :: a -> Set a
> sing x = Set [x]

> flatten :: Set a -> [a]
> flatten (Set xs) = xs

> elem      :: Eq a => a -> [a] -> Bool
> elem x xs = or [ x == y | y <- xs]

> memSet            :: (Eq a) => a -> Set a  -> Bool
> memSet y (Set xs) =  elem y xs

> subLSet          :: Eq a => [a] -> Set a -> Bool
> subLSet [] (Set xs)     = True
> subLSet (y:ys) (Set xs) = (memSet y (Set xs)) && (subLSet ys (Set xs)) 

> subSet :: Eq a => Set a -> Set a -> Bool
> subSet (Set xs) (Set ys) = subLSet xs (Set ys)

> eqSet                   :: Eq a => Set a -> Set a -> Bool
> eqSet (Set xs) (Set ys) = (subSet (Set xs) (Set ys)) && (subSet (Set ys) (Set xs))

> makeSet :: Eq a => [a] -> Set a
> makeSet = Set . nub

> remDups :: Eq a => [a] -> [a]
> remDups []  = []
> remDups [x] = [x]
> remDups (x:y:zs)
>     | (x == y) || (elem x zs) = remDups (y:zs)
>     | otherwise               = x:(remDups (y:zs))

Remarks: We can use the function nub (in prelude) to eliminate duplicates

> union :: Eq a => Set a -> Set a -> Set a
> union (Set xs) (Set ys) = Set (xs ++ ys)

> inter                   :: Eq a => Set a -> Set a -> Set a
> inter (Set xs) (Set ys) = Set (int xs ys)

> int       :: Eq a => [a] -> [a] -> [a]
> int xs ys = [ x | x <- xs, elem x ys]


> diff                   :: Eq a => Set a -> Set a -> Set a
> diff (Set xs) (Set ys) = Set (dif xs ys)

> dif       :: Eq a => [a] -> [a] -> [a]
> dif xs ys = [ x | x <- xs, not (elem x ys)]


> card          :: (Eq a) => Set a -> Int
> card (Set xs) =  length (nub xs)

> showSet :: (Eq a) => (a -> String) -> Set a -> String
> showSet f (Set xs) = "{ " ++ concat (map ((++ " ") . f) (nub xs)) ++ "}"

