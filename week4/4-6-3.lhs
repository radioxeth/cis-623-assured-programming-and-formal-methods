--------------------------------------------------------------------------------
4.6.3  Programming Examples

       Define data via the data mechanism (demo.) for different data types 
       (including the recursive data type), state their constructors and
       walk thru. a number of programming examples.

--------------------------------------------------------------------------------

Beginning examples

> data Answer = Yes | No | Unknown


> data Shape = Circle Float | Rect Float Float
>              deriving (Show, Eq)

> square   :: Float -> Shape
> square x = Rect x x

     - Write functions involving shapes

       Pattern Matching !!!

> area            :: Shape -> Float
> area (Circle r) =  pi * r^2
> area (Rect x y) =  x * y

> totalArea    :: [Shape] -> Float
> totalArea []              = 0.0
> totalArea ((Circle r):xs) = (area (Circle r)) + totalArea xs
> totalArea ((Rect l w):xs) = (area (Rect l w)) + totalArea xs

> totalArea1    :: [Shape] -> Float
> totalArea1 zs =  sum [area s | s <- zs ]

c. Recursive data types

> data Nat = Zero | Succ Nat

Join the type class Show by using the deriving keyword.

Conversion functions  

> nat2int      :: Nat -> Int
> nat2int Zero     = 0
> nat2int (Succ n) = 1 + nat2int n

> int2nat   :: Int -> Nat
> int2nat 0 = Zero
> int2nat n = Succ (int2nat (n-1))

Two ways to define the addition of natural numbers

> add1     :: Nat -> Nat -> Nat
> add1 m n = int2nat (nat2int m + nat2int n)

> add2        :: Nat -> Nat -> Nat
> add2 Zero n     = n
> add2 (Succ m) n = Succ (add2 m n)









