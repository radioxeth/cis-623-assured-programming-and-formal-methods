--------------------------------------------------------------------------------
3.8.2  Examples 

       Illustrate, via examples, some common techniques which help to define
       functions via list comprehensions. Note that string comprehension is a
       specific case. 

--------------------------------------------------------------------------------

a. Function: prime etc.  

> factors :: Int -> [Int]
> factors n = [ x | x <- [1..n], n `mod` x == 0]

We can a function to tell if an integer is a prime or not:

> prime   :: Int -> Bool
> prime n = factors n == [1,n]

In addition, we can print the prime numbers without bounds:

> theprimes :: [Int]
> theprimes =  [ n  | n <- [2..], prime n]

b.  Function: noCommonF

Let us "TRANSLATE" a mathematical definition using list comprehension.

Example:  

two positive integers n, m is said to be relative prime  provided 
the only common factor of n, m is 1.

This can be translated to the following implementation

> noCommonF     :: Int -> Int -> Bool
> noCommonF n m = null lst
>     where   lst = [ x | x <- factors n, y <- factors m, x==y, y > 1] 
>             -- lst is the list of common factors of n, m that is > 1


3. Function: zip

Discussions on list comprehension:

When will you prefer to use list comprehension ?  Why ?

Example: using zip functions

> index    :: [a] -> [(a,Integer)]
> index xs = zip xs [0..]

using index, we can specify the positions of an element x in a list

> positions      :: Eq a => a -> [a] -> [Integer]
> positions x xs = [ i | (x',i) <- index xs, x == x']

> charindexedLst :: [(Char,Integer)]
> charindexedLst = index ['a'..'z']

> pairs :: [a] -> [(a,a)]
> pairs xs = zip xs (tail xs)

Write a test to verify if a list is sorted in ascending order.

> sorted :: Ord a => [a] -> Bool
> sorted xs = and [x <= y | (x,y) <- pairs xs]

