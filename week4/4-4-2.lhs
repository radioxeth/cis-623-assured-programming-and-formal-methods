--------------------------------------------------------------------------------
4.4.2  Sorting 

       Show how to implement insertion sort and merge sort via recursion.

       Illustrate how we can test/verify a number of sorting methods
       (implemented via Haskell)
 
--------------------------------------------------------------------------------

a.  Insertion sort (Hutton, page 62-63)

> insert      :: Ord a => a -> [a] -> [a]
> insert x [] = [x]
> insert x (y:ys)
>     | x <= y    = x:y:ys
>     | otherwise = y:insert x ys

> isort    :: Ord a => [a] -> [a]
> isort []     = []
> isort (x:xs) = insert x (isort xs)


b.  Merge sort (Bird, page 76-77)


> merge       :: (Ord a) => [a] -> [a] -> [a]
> merge [] ys = ys
> merge xs []         = xs
> merge (x:xs) (y:ys) 
>     | x <= y    = x:merge xs (y:ys)
>     | otherwise = y:merge (x:xs) ys

> halve xs = (take n xs, drop n xs)
>     where n = length xs `div` 2

> msort    :: (Ord a) => [a] -> [a]
> msort [] = []
> msort [x] = [x]
> msort xs  = merge (msort ys) (msort zs)
>             where (ys,zs) = halve xs
 

c. Test(s) 

> pairs :: [a] -> [(a,a)]
> pairs xs = zip xs (tail xs)

> sorted :: Ord a => [a] -> Bool
> sorted xs = and [x <= y | (x,y) <- pairs xs]


> testMerge :: (Ord a) => [a] -> [a] -> Bool
> testMerge xs ys = (not cond1) || (cond2)              
>     where
>       cond1 = (sorted xs) && (sorted ys)
>       cond2 = (sorted (merge xs ys))



