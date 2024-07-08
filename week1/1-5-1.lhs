--------------------------------------------------------------------------------
1.5.1  Using the GHC System:  Beginning Examples
--------------------------------------------------------------------------------

a. Beginning Example (via GHCi)

> f :: Int -> Int
> f x = 2 * x 

> g     :: Int -> Int -> Int
> g x y = x + y

> h       :: (Int,Int) -> Int
> h (x,y) = x + y

> sum1    :: [Int] -> Int
> sum1 []     = 0           -- sum1.1
> sum1 (n:ns) = n + sum ns  -- sum1.2


Remarks: the function sum is a function preloaded to the system right after it 
starts.

 b. quicksort

> q    :: [Int]  -> [Int]
> q []     = []
> q (x:xs) = q ys  ++  [x] ++ q zs
>     where
>       ys = [ a | a <- xs, a <= x]
>       zs = [ b | b <- xs, b > x]


c. Running GHC (command line): The anagram example (Bird: ch. 1, Exercise G) 

 