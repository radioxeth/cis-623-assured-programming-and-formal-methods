--------------------------------------------------------------------------------
7.3.2  Programming examples 

       Illustrate list processing by using maps and filters 
 
--------------------------------------------------------------------------------


> import Prelude hiding (map, filter)
> import Data.Char

a. define map and filter by using recursion 


> map      :: (a -> b) -> [a] -> [b]
> map f []     = []
> map f (x:xs) = (f x):(map f xs)

> f   :: Int -> Int
> f x = x + 1

> eg1 = map (f) [1..10]


> filter      :: (a -> Bool) -> [a] -> [a]
> filter p [] =  []
> filter p (x:xs) 
>        | p x       =  x:(filter p xs)
>        | otherwise =  filter p xs

> p   :: Int -> Bool
> p x = even x

> eg2 = filter (p) [1..10]


b. define map and filter by using list comprehensions


> map1 :: (a -> b) -> [a] -> [b]
> map1 f xs = [ f x | x <- xs] 


> filter1      :: (a -> Bool) -> [a] -> [a]
> filter1 p xs = [ x | x <- xs, p x]
 

c. Examples of using map 

ops: an operation
lst: a list

Apply operation ops to each element in the list lst
pattern: map (ops) lst

> eg3 = map (+1) [1..10]
> eg4 = map (toUpper) "formal methods"
> eg5 = map (toLower) eg4

Is map (f . g) = (map f) . (map g) ?  

Eg. 

map (f.g) [1,2,3]
=
[f.g 1, f.g 2, f.g 3]
=
[ f(g 1), f (g 2), f (g 3)]
= 
map f [g 1, g 2, g 3]
=
(map f) . (map g) [1,2,3]
 

d. Examples of using filter 

p:    a boolean condition
lst:  a list 

Scan the list lst. from left to right.  Keep only those 
elements e such that p e is true.


> eg6 = filter (>= 0) [(-3)..2]
> eg7 = filter (/= ' ') "formal methods"




What does the following function do ?

> rmd    :: Eq a => [a] -> [a]
> rmd []     = []
> rmd (x:xs) = x : filter (/= x) (rmd xs) 




