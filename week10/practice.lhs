> import Prelude hiding (takeWhile,map)

> addMap :: [Int] -> [Int]
> addMap [] = []
> addMap xs = map (1+) xs

> recipMap :: [Float] -> [Float]
> recipMap [] = []
> recipMap xs = map (1/) xs

> halvMap :: [Float] -> [Float]
> halvMap [] = []
> halvMap xs = map (/2) xs

> doubMap :: [Int] -> [Int]
> doubMap [] = []
> doubMap xs = map (2*) xs


-- The type of takeWhile:
-- takeWhile takes a predicate (a -> Bool) and a list of type [a], and returns a sublist of type [a].

> takeWhile :: (a -> Bool) -> [a] -> [a]

-- Base case 1: If the list is empty, return an empty list.

> takeWhile _ [] = []

-- Recursive case: If the predicate holds for the head of the list, take the head and apply takeWhile to the tail.

> takeWhile pred (x:xs)
>     | pred x    = x : takeWhile pred xs  -- If pred x is True, include x and continue recursion.
>     | otherwise = []                     -- If pred x is False, stop and return an empty list.


-- The type of subsetL:
-- subsetL takes two lists of type [a], and returns a Bool indicating whether the first list is a subset of the second.

> subsetL :: Eq a => [a] -> [a] -> Bool

-- Base case: An empty list is a subset of any list, so return True.

> subsetL [] _ = True

-- Recursive case: Check if the head of the first list is in the second list.
-- If it is, recurse on the rest of the list. If it is not, return False.

> subsetL (x:xs) t
>     | x `elem` t = subsetL xs t  -- If x is in t, check the rest of the list.
>     | otherwise  = False         -- If x is not in t, return False.

> s::[(Int,Int)]
> s = [(1,2),(2,3),(3,4)]

> t::[(Int,Int)]
> t = [(1,2)]


> map :: (a -> b) -> [a] -> [b]
> map _ []     = []  -- Base case: an empty list returns an empty list
> map f (x:xs) = f x : map f xs  -- Recursive case: apply f to the head and recurse on the tail


> productFoldr :: Num a => [a] -> a
> productFoldr = foldr (*) 1


> andFoldr :: [Bool] -> Bool
> andFoldr = foldr (&&) True


> orFoldr :: [Bool] -> Bool
> orFoldr = foldr (||) False

