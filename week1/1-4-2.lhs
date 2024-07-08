1.4.3 

Examples for section 1.4.2

1. 

> f1   :: Integer -> Integer
> f1 x = x*x + 1


2.

> f2         :: (Integer, Integer, Integer) -> Integer 
> f2 (x,y,z) = x + y + z + 1

3.

> f3 :: Integer -> Integer 
> f3 x
>     | x <= 0 = 0
>     | x == 1 = 2
>     | x> 1   = f3 (x-1) + 2 

4.

> f4       :: (Integer, Integer)-> Integer
> f4 (x,y) 
>     | y <= 1    = 0
>     | otherwise = x `div` y

5.

> f5 :: (Integer, Integer)-> (Integer, Integer)
> f5 (x,y)  
>     | y <= 1    = (0,0)
>     | otherwise = (z, y-z)
>     where
>       z = x `div` y


6.

> f6   :: Float -> Float
> f6 x = sin x


7.

> f7    :: Float -> Float
> f7  r = log r

8.

> f8      :: (a -> b) -> (b -> c) -> (a -> c)
> f8  f g = g . f


Examples taken from Prelude

9. 

> l    :: [a] -> Integer
> l []     = 0
> l (x:xs) = 1 + (l xs)

Remarks:  

i.   [a] denotes the list where each element is of type a. Note that
     there is no restriction imposed on a.

ii.  l is the function that computes, by *recursion*, the number of elements 
     in the list [a].



10. 


> s    :: [Char] -> Integer
> s str = l [ 1 |  c <- str, (c == 'a') || (c == 'A')] 
  
i.   The function s counts the number of characters c in a string str where
     the character c is either the lower case a (i.e. 'a') or the upper case
     A (i.e. 'A').

ii.  Note that str is a list of characters. Here, we construct a new list from 
     an existing list and the method is referred as *list comprehensions*.


