> import Prelude hiding (unzip)

> fbrec :: [Int] -> [String]
> fbrec []=[]
> 
> fbrec (x:xs)  | x `mod` 3 == 0 && x `mod` 5 == 0 = fbrec xs ++ ["fizzbuzz"]
>   | x `mod` 3 == 0  = fbrec xs ++ ["fizz"]
>   | x `mod` 5 == 0  = fbrec xs ++ ["buzz"]
>   | otherwise = fbrec xs ++ [show x]

fizzbuz using list comprehension

% > fblc :: [Int] -> [String]
% > fblc [if x `mod` 3 == 0 && x `mod` 5 == 0 then "fizzbuzz" else if x `mod` 3 == 0 then "fizz" else if x `mod` 5 == 0 then "buzz" else show x | x <- xs]


unzip using list comprehension

> unzip :: [(a,b)] -> ([a],[b])
> unzip [] = ([],[])
> unzip xs = ([a | (a,_) <- xs], [b | (_,b) <- xs])