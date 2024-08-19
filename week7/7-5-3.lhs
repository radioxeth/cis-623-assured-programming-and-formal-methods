--------------------------------------------------------------------------------
7.5.3  Programming examples 

       Illustrate high order functions which capture common patterns of 
       computations
 
--------------------------------------------------------------------------------

> import Prelude hiding (all, any, until)

a. Function all

pattern:  all p lst

determine if every element in lst satisfy p 

> all      :: (a -> Bool) -> [a] -> Bool
> all p xs = and [p x | x <- xs]


> eg1 = all even [2,4,6,8,10]
> eg2 = all (\x -> (x>1) && (x<4)) [2,3,3]

b. Function any

pattern:  any p lst

determine if there's an  element in lst satisfy p

> any      :: (a -> Bool) -> [a] -> Bool
> any p xs = or [p x | x <- xs]

> eg3 = any odd [2,4,6,8,10]
> eg4 = any (\x -> (x>1) && (x<4)) [1,4,4,1]


c. Function until

pattern:  

until ("good enough") ("perform next iteration to improve the current iterate).


> until           :: (a -> Bool) -> (a -> a) -> a -> a
> until p f x 
>     | p x       = x
>     | otherwise = until p f (f x)


i.  Recall: using until in iterations (compute sqrt, see file sqrt.lhs from Bird)

> sqrt :: Float -> Float
> sqrt x = until goodenough improve x
>   where goodenough y = abs (y*y-x) < eps*x
>         improve y = (y+x/y)/2
>         eps = 0.000001


The above function carries out the following iterations:

compute a solution to the equation x^2 = a by the iteration:

Guess x1 (> 0)
x_{n+1} = 1/2 [x_{n} + (a / x_{n})]