--------------------------------------------------------------------------------
3.4.2  More Programming examples 

       Illustrate Currying, Polymorphic Functions and Lambda Functions (3.4.1) 
 
--------------------------------------------------------------------------------

> import Prelude hiding (length)


a. Currying

-- Example on adding two integers

> add'     :: Int -> (Int -> Int)
> add' x y = x + y

> add       :: (Int,Int) -> Int
> add (x,y) = x+y


-- Example on multipying 3 integers

> mult       :: Int -> (Int -> (Int -> Int))
> mult x y z = x*y*z

> mult1       :: Int -> Int -> Int -> Int
> mult1 x y z = x*y*z

Remarks:  mult x y z means   (((mult x) y) z

Try

> test x y z = (mult x y z) == (mult1 x y z)

What is the type of the function test ?  (exercise)


b. Polmorphic functions

> length1    :: [a] -> Int
> length1 []     = 0
> length1 (x:xs) = 1 + (length1 xs)

After hiding the length function from prelude, we have

> length    :: [a] -> Int
> length []     = 0
> length (x:xs) = 1 + (length xs)


c. Overloaded functions

> (#) :: Num a => a -> a -> a
> x # y = x + y + 1


> q    :: Ord a => [a]  -> [a]
> q []     = []
> q (x:xs) = q ys  ++  [x] ++ q zs
>     where
>       ys = [ a | a <- xs, a <= x]
>       zs = [ b | b <- xs, b > x]


