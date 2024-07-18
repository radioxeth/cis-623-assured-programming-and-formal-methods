--------------------------------------------------------------------------------
3.5.2  Examples 

       Illustrate, via examples, how to define functions by recursion. 

--------------------------------------------------------------------------------

> import Prelude hiding (product, reverse, zip)

a. Function: product

   1. What's the type ?
   2. What's the base case(s) ?
   3. Induction / recursion steps ?
   4. Test(s)
   5. Revisions and generalizations

> product :: Num a => [a] -> a
> product [] = 1                    -- base case
> product (n:ns) = n * product ns   -- recursion step 


b. Functon: reverse

Demonstration: define the reverse function

> reverse    :: [a] -> [a]
> reverse []     = []
> reverse (x:xs) = reverse xs ++ [x]

Remark: The function (++) (See slides) is a function to append two lists



c. Function zip: zipping the elements of two lists
             
-- usage: indexing a list

Demonstration: define the zip function

> zip      :: [a] -> [b] -> [(a,b)]
> zip [] _ = []
> zip _ []          = []
> zip (x:xs) (y:ys) = (x,y):zip xs ys


