--------------------------------------------------------------------------------
4.3.2  Program Verification and Testing 

       Illustrate, via simple examples, how to verify and test properties of
       a Haskell program (function)
 
--------------------------------------------------------------------------------

> import Prelude hiding (drop, init)
> import Data.List hiding (drop, init)
> import Test.QuickCheck


> drop      :: Integral b => b -> [a] -> [a]
> drop 0 []     = []
> drop 0 (x:xs) = x:xs
> drop n []     = []
> drop n (x:xs) = drop (n-1) xs


> init     :: [a] -> [a]
> init [_]    = []
> init (x:xs) = x:init xs


Example: 

--------------------
a.  Blackbox Testing
--------------------

Test only relies on the external system interface (Input/Output pairs in 
functional programs) to verify its correct.
 

    eg. input - output pairs for the function drop  


function: drop 5

Input: eg1

> eg1 :: [Int]
> eg1 = [1..10]

Output:  [6,7,8,9,10] 


function: init

Input: eg1

Output:  [1..9] 


--------------------
b.  Whitebox Testing
--------------------

Use knowledge of the implementation to drive to drive the test process.


    eg. access the implementation (say a helper function internally) 
        for the main function (program)


> factors   :: Int -> [Int]
> factors n = [ x | x <- [1..n], n `mod` x == 0]


> prime   :: Int -> Bool
> prime n = factors n == [1..n] 


Test the function: factors

Test the property: for any n, n is a factor of itself


> testb n = elem n (factors n) 


--------------------
c.  Property testing
--------------------

1.  Writing property: sorted in Haskell.

> pairs :: [a] -> [(a,a)]
> pairs xs = zip xs (tail xs)

> sorted :: Ord a => [a] -> Bool
> sorted xs = and [x <= y | (x,y) <- pairs xs]


and use it to test the function sort (Data.List)

> testc = sorted (sort [1,2,3])   -- positive  
> testd = sorted (sort [1,2,3,1]) -- negative


2.  Write property: reverse a list two times resulting in the same list
(not counting multiplicity)

> sameLst :: [Int] -> [Int] -> Bool
> sameLst xs ys = cond1 && cond2
>     where cond1 = and [elem x ys| x <- xs]
>           cond2 = and [elem y xs| y <- ys]

> teste    :: [Int] -> Bool   
> teste xs =  sameLst (reverse (reverse xs)) xs



Remark: there are software tools that can generate random data for testing.

Try execute quickCheck prop_RevRev 

> prop_RevRev xs = reverse (reverse xs) == xs
>     where types = xs::[Int]









