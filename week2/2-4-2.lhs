--------------------------------------------------------------------------------
2.4.2  Simple Haskell Scripts 
--------------------------------------------------------------------------------

This simple script (2-4-2.lhs) demonstrates the examples from 2.3.2. to 2.3.3

a. Basic types

-- The type String is a synonym for the type: list of characters (i.e., [Char]).

> courseName :: String
> courseName = ['c','i','s',' ','6','2','3']

biginteger is an example of a 256 bit prime 

> biginteger :: Integer
> biginteger = 109939025753834733498749075564102728424911782303658486825359178646821371085889

> const1  :: Float
> const1  = 2.71828

b. List types

> empty :: [a]
> empty =  []

c. Tuple types

> aPair :: (Integer , String)
> aPair = (0, "Zero")

> aTriple :: (Char, Int, String)
> aTriple = ('B', 6, "Tuples")

d. Function types

-- odd

> odd1 :: Int -> Bool
> odd1 = not . even

-- add1

> add1 :: Int -> Int
> add1 = (\ x -> x+1) 

> addk    :: Int -> Int -> Int
> addk  k = (\ x -> x+k)

e. Operator Sections

> eg1 :: Int -> Int
> eg1 =  (+1)

> half :: Float -> Float
> half = (/2)

> cons :: Int -> [Int]
> cons = (:[0]) 






