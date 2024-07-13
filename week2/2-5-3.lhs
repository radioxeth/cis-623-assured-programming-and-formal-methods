--------------------------------------------------------------------------------
2.5.3  Implementation and Testing (of "Numbers into Words" program)

File: NumbersToWords.lhs
 
--------------------------------------------------------------------------------

Numbers into words
8th March, 2012
In Chapter 01
_______________________________________________________

Revised and Comment added in Spring 2023
_______________________________________________________


> units, teens, tens :: [String]
> units = ["zero","one","two","three","four","five",
>          "six","seven","eight","nine"]
> teens = ["ten","eleven","twelve","thirteen","fourteen",
>          "fifteen","sixteen","seventeen","eighteen",
>          "nineteen"]
> tens  = ["twenty","thirty","forty","fifty","sixty",
>          "seventy","eighty","ninety"]

> convert1 :: Int -> String 
> convert1 n = units!!n

_______________________________________________________

Test convert1
_______________________________________________________


-- Exhaustive Test is possible 

   (rarely the case in general)

_______________________________________________________
_______________________________________________________


> digits2 :: Int -> (Int,Int)
> digits2 n = n `divMod` 10

> convert2 :: Int -> String
> convert2 = combine2 . digits2

> combine2 :: (Int,Int) -> String
> combine2 (t,u)
>    | t==0         = units!!u
>    | t==1         = teens!!u
>    | 2<=t && u==0 = tens!!(t-2)
>    | 2<=t && u/=0 = tens!!(t-2) ++ "-" ++ units!!u


_______________________________________________________

Test convert2
_______________________________________________________

-- Boundaries (program behavior changes at boundaries).

units | teens | tens

Test with input output pairs

_______________________________________________________
_______________________________________________________


> digits3 :: Int -> (Int,Int)
> digits3 n = n `divMod` 100

> convert3 :: Int -> String
> convert3 = combine3 . digits3

> combine3 :: (Int,Int) -> String
> combine3 (h,n)
>    | h==0      = convert2 n
>    | n==0      = units!!h ++ " hundred"
>    | otherwise = units!!h ++ " hundred and " ++ convert2 n

_______________________________________________________

Test convert3
_______________________________________________________


Compare the patterns between 

a). convert1 and convert2
b). convert2 and convert3


_______________________________________________________
_______________________________________________________




> digits6 :: Int -> (Int,Int)
> digits6 n = n `divMod` 1000

> convert6 :: Int -> String
> convert6 = combine6 . digits6

> combine6 :: (Int,Int) -> String
> combine6 (m,n)
>   | m==0      = convert3 n
>   | n==0      = convert3 m ++ " thousand"
>   | otherwise = convert3 m ++ " thousand" ++ link n ++
>                 convert3 n

> link :: Int -> String
> link n = if n < 100 then " and " else " "

> convert :: Int -> String
> convert = convert6

_______________________________________________________

Test convert6
_______________________________________________________


Compare the patterns between 

a). convert3 and convert6

_______________________________________________________
_______________________________________________________
