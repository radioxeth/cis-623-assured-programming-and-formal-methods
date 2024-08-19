--------------------------------------------------------------------------------
7.6.2  Programming examples 

       Illustrate the programming pattern as displayed by foldr 
       (a recursion operator)

--------------------------------------------------------------------------------

> import Prelude hiding (foldr, foldl, sum, product, or, and, length, reverse)

a. The foldr function and beginning examples


> foldr        :: (a -> b -> b) -> b -> [a] -> b
> foldr f v []     = v
> foldr f v (x:xs) = f x (foldr f v xs) 


> sum = foldr (+) 0
> product = foldr (*) 1
> or = foldr (||) False
> and = foldr (&&)  True

> length = foldr (\ _ n -> 1 + n) 0

> reverse = foldr (\x xs -> xs ++ [x])[]

b The foldl function and examples

> foldl        :: (a -> b -> a) -> a -> [b] -> a
> foldl f v []     = v
> foldl f v (x:xs) = foldl f (f v x) xs


> length1 :: [a] -> Int
> length1 = foldl (\ n _ -> n + 1) 0


> reverse1 :: [a] -> [a]
> reverse1 = foldl (\ xs x -> x:xs) []






