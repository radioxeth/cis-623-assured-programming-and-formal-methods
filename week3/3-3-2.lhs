--------------------------------------------------------------------------------
3.3.2  Programming examples 

       Illustrate the machanism for defining functions (3.3.1)
 
--------------------------------------------------------------------------------

> import Prelude hiding (abs, (&&), tail)

a. Conditional expressions

> abs   :: Int -> Int
> abs n = if n >= 0 then n else -n

> signum :: Int -> Int
> signum n = if n < 0 then -1 else
>                if n == 0 then 0 else 1

b. Guard equations

> abs1   :: Int -> Int
> abs1 n
>     | n >= 0    = n
>     | otherwise = -n



> signum1 :: Int -> Int
> signum1 n 
>     | n < 0     = -1 
>     | n == 0    =  0 
>     | otherwise =  1


c. Pattern matching

> not       :: Bool -> Bool
> not False = True
> not True  = False


-- Use wildcards

(&&) :: Bool -> Bool -> Bool
True && True = True
_ && _ = False 


alternatively, we can write

> (&&) :: Bool -> Bool -> Bool
> True && b = b
> False && _ = False

-- Remarks

   -- Always follow the given order to evaluate 
   -- no repeat variables

d. List patterns 

-- (:) cons operator to build lists

> f1    :: [a] -> Bool
> f1 []     = True
> f1 (x:xs) = False

   Remarks: check out the null function

-- head and tail functions

> head1       :: [a] -> a
> head1 (x:_) = x

> tail        :: [a] -> [a]
> tail (_:xs) = xs
 

