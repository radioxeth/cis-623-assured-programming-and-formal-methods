# Week 3 Programming Paradigms Part 1
## Table of Contents
- [Week 1 Introduction](../week1/README.md)
- [Week 2 Beginning Steps](../week2/README.md)
- **&rarr;[Week 3 Programming Paradigms Part 1](README.md)**
- [Week 4 Formal Methods and Programming](../week4/README.md)
- [Week 5 Applying Formal Methods Part 1](../week5/README.md)
- [Week 6 Applying Formal Methods Part 2](../week6/README.md)
- [Week 7 Programming Paradigms Part 2](../week7/README.md)
- [Week 8 Applying Formal Methods Part 3](../week8/README.md)
- [Week 9 Applying Formal Methods Part 4](../week9/README.md)
- [Week 10 Applying Formal Methods Part 5](../week10/README.md)

### Learning Objectives and Outcomes

- Explain the role of types in functional programming and the importance of identifying type errors through type checking.
- Give examples of basic data types, list and tuple types, and function types in the Haskell language.
- Describe and explain recursion and list comprehension as fundamental paradigms of functional programming and provide Haskell functions as examples for illustration.
- Specify proper types and apply recursion, list comprehension to define Haskell functions.

### Overview
- types, guard protections, pattern matching, etc
- recursion
- list comprehensions
- data declarations
- high-order functions

#### Recursion
- recursive definitions (induction definitions)
- th basic mechanism for looping haskell
- base case and recursive case

#### List Comprehensions
- set and lists
- specifying sets
- generators and guards
- can be combined with recursion (quicksort example)


### Types ad Programming Part 1

#### Defining Functions
- basic mechanisms
  - conditional expressions
  - guard equations
  - pattern matching
  - list patterns

#### conditional expressions
- as in most programming languages functions can be defined using conditional expressions

```hs
abs :: Int -> Int
abs n = if n >= 0 then n else -n
```

- nested

```hs
signum :: Int -> Int
singum n = if n < 0 then -1 else
                if n == 0 then else 1
```

in haskell conditional expressions must **always** have an else branch

#### Guarded equations

```hs
abs n | n >= 0    =  n
      | otherwise = -n
```

```hs
signum n | n < 0     = -1
         | n == 0    = 0
         | otherwise = 1
```


**otherwise** is defined in the prelude by `otherwise = True`

#### Pattern Matching

```hs
not :: Bool -> Bool
not False = True
not True  = False
```

- functions can often be defined in many different ways using pattern matching for example:

```hs
(&&) :: Bool -> Bool -> Bool
True && True = True
True && False = False
False && True = False
False && False = False
```

- can be defined more compactly by 

```hs
True && True = True
_    && _ = False
```

- The following definition is more efficient because it avoids evaluating the second argument if the first argument is False:

```hs
True  && b = b
False && _ = False
```

- Note: The underscore symbol `_` is a wildcard pattern that matches any argument value.

- **patterns are matched in order**; for example the following definition always returns false

```hs
_ && _ = False
True && True = True
```

- patterns **may not repeat** variables; for example, the following definition gives an error:

```hs
b && b = b
_ && _ = False
```

#### List Patterns

- every nonempty list is constructed by repeated use of an operator `:` called "cons" that adds an element to the start of a list

- `[1,2,3,4]`

- Means `1:(1:(3:(4:[])))`

- Functions on lists can be defined using `x:xs` patterns

```hs
head :: [a]   -> a
head :: (x:_)  = x

tail :: [a]   -> [a]
tail :: (_:xs) = xs
```

- head and tail map any nonempty list to its first and remaining elements
- x:xs patterns only match nonempty lists
```hs
> head []
**** exception
```
- x:xs patterns must be parenthesized because application has priority over `:`

```hs
> head x:_ = x
**** gives error
```


### Types and Programming Part 2
- currying, polymorphic functions, and lambda expressions

#### Currying Fucntions

- functions with multiple arguments are also possible by returning **functions as results**:

```hs
add` :: Int -> (Int, Int)
add` :: x y = x+y
```

- `add'` takes an integer `x` and returns a function `add' x`. In turn this function takes an integer `y` and returns the result `x + y`

- add and add' produce the same results, but add takes its two arguments at the same time, whereas add' takes them oune at a time

```hs
add  :: (Int,Int)->Int
add' :: Int -> (Int -> Int)
```

- functions that take their arguments one at a time are called **curried** functions

#### Why is Currying Useful?

- curried functions are more flexible than functions on tuples because useful functions can often be made by **partially applying** a curried function

```hs
add' 1 :: Int -> Int
take 5 :: [Int] -> [Int]
drop 5 :: [Int] -> [Int]
```

The arrow -> associates to the right


#### Polymorphic Functions
- a function is call polymorphic ("of many forms") if its type contains one or more type variables

`length :: [a]->Int`

- may of the functions defined in the prelude are polymorphic

```hs
fst  :: (a,b) -> a
head :: [a]   -> a
take :: Int   -> [a] -> [a]
zip  :: [a]   -> [b] -> [(a,b)]
id   :: a     -> a
```

#### Overloaded Functions

- Polymorphic Function is called **overloaded** if its type contains one or more class constraints 

```hs
(+)::Num => a -> a -> a
```

- for any numeric type a (+) takes two values of type a and returns a value of type a

```hs
> 1 + 2
3

> 1.0 + 2.0
3.0

> 'a' + 'b'
error
char is not numeric type
```

- haskell has a number of tpe classes including:

```hs
Num - numeric types
Eq - equality types
Ord - ordered types
```

```hs
(+)  :: Num a => a -> a -> a
(==) :: Eq  a => a -> a -> Bool
(<)  :: Ord a => a -> a -> Bool
```

#### Why are Lambdas Useful

- lambda expressions can be used to give a formal meaning to functions defined using currying:
- For example:

```hs
> add x y = x + y

means

> add lambda x->(lambda y -> x+y)

> \x -> (\y -> x + y)
```

#### Example
[3-4-2.lhs](./3-4-2.lhs)

### Recursion Part 1

#### Intro
- as we have seen, many functoins can caturlly be definied in terms of other functions

```hs
fac :: Int -> Int
fac n = product [1..n]
```

```hs
fac :: Int -> Int
fac 0 = 1
fac n = n * fac(n-1)
```


#### Why is recursion useful?
- some functions such as factorial are simpler to define in terms of other functions
- as we shall see, many functions can naturally be defined in terms of themselves
- properties of functions defined using recursion can be proved using the simple but powerful mathematical technique **induction**

#### Recursion on Lists
- recursion is not restricted to numbers but can also be used to define functions on lists


```hs
product :: Num a => [a] -> a
product :: [] = 1
product (n:ns) = n * product ns
```
- product maps the empty list to 1 and any nonempty list to its head multiplied by the product of its tail

```hs
length
```

```hs
reverse ::[a]->[a]
reverse []=[]
reverse (x:xs) = reverse xs ++ [x]
```
- use append function

#### Multiple Arguments
- zip elements of two lists together

```hs
zip :: [a]->[b]->[(a,b)]
zip []   = []
zip _  [] = []
zip (x:xs) (y:ys) = (x,y):zip xs ys
```

#### Recursion Example
[3-5-2.lhs](./3-5-2.lhs)

### Recursion Part 2

Defining/Specifying a Function by Recursion

- the design and specification of quicksort
- general principles
- advise

#### Quicksort
- the quicksort algorithm for sorting a lis of values can be specified by the following two rules
  - the empty list is already sorted
  - nonempty lists can be sorted by sorting the tail values less than or equal to the head, sorting the tail values greater than the head, and then appending the resulting lists on either side of the head value.

```hs
qsort :: Ord a => [a] -> [b]
qsort [] = [] -- base case
qsort (x:xs) = 
  qsort smaller ++ [x] ++ qsort larger
  where
    smaller = [a | a <- xs, a <= x]
    larger = [b | b <- xs, b > x]
```

#### Hints and Tips
- when defining a new function in Haskell, it is useful to begin by writing down its type
- within a script, it is good practice to state the type of every noe function defined
- when stating the types of polymorphic functions that use numbers, equality, or orderings, take care to include the necessary class constraints 

#### Advice
- Define the type
- Enumerate the cases
- Define the simple cases
- Define the other cases
- Generalize and simplify


#### Practice

|steps|quicksort|
|:-:|:-:|
|define tye type||
|enumerate the class|[] (x:xs)|
|define the simple cases|q[]|
|define the other cases|q(x:xs)|
|generalize and simplify|...|


#### drop
```hs
drop:: Int->[a]->[a]
--     k    xs   xs
-- drop the first k elements

drop 0 []=[]
drop 0 (x:xs)=xs
drop n []=[]
drop n (x:xs)=

```

|steps|drop|
|:-:|:-:|
|define tye type|`drop:: Int -> [a] -> [a]`|
|enumerate the class||
|define the simple cases||
|define the other cases||
|generalize and simplify||

### List Comprehensions Part 1


- sets, set builder notation, lists

#### Set Comprehensions
In Mathematics, the comprehension notation can be used to construct new sets from old sets.

{x^2|x&in;{1..5}}

- the set {1,4,9,16,25} of all numbers z^2 such that x is an element of the set {1..5}

#### List Comprehensions
In Haskell, a similar comprehension notation can be used to construct new lists from old lists

[x^2|x<-[1..5]]
- the list [1,4,9,16,25] of all numbers x^2 such that x is an element of the list [1..5]

Note:
- the expression x<-[1..5] is called a **generator**, as it states how to generate values for x
- comprehensions can have **multiple** generators, separated by commas, for example:

```hs
> hs [(x,y) | x <- [1,2,3], y <- [4,5]]
[(1,4),(1,5),(2,4),(2,5),(3,4),(3,5)]
```

- changing the **order** of the generators changes the order of the elements in the final list:

```hs
> [(x,y) | y <- [4,5], x <- [1,2,3]]
[(1,4)(2,4)(3,4)(1,5)(2,5)(3,5)]
```

- multiple generates are like **nested loops**, with later generators as more deeply nested loops whose variables change value more frequently

### Dependent Generators

- later generators can **depend** on the variables that are introduced by earlier generators

```hs
[(x,y) | x <- [1..3],y <- [x..3]]
```

- the list [(1,1)(1,2)(1,3)(2,2)(2,3)(3,3)] of all pairs of numbers (x,y) such that x,y are elements of the list [1..3] and y >= x


- using a depenedent generator, we can define the library function that concatenates a list of lists

```hs
concat :: [[a]]->[a]
concat xss = [x | xs <- xss, x <- xs]


> concat[[1,2,3],[4,5],[6]]
[1,2,3,4,5,6]
```

### List Comprehensions Example 1
[3-7-2.lhs](./3-7-2.lhs)


Propose two practice problems, one on programming by recursion and the other on programming via list comprehension. Give an outline solution to one of them.
Your Answer:
For recursion you could practice fizz buzz or whatever, where every element is the string version of the letter. and every mod 3 is fizz and every mod 5 is buzz.

base case

fb []=[]

fb x:xs=
  | x `mod` 3 == 0 && x `mod` 5 == 0 "fizzbuzz"
  | x `mod` 3 == 0 "fizz"
  | x `mod` 5 == 0 "buzz"
  | otherwise toString(x)

### List Comprehensions 2

#### Guards

- list comprehensions can use guards to restrict the values produced by earlier generators

```hs
[x|x<-[1..10],even x]
-- 2,4,6,8,10
```

- using a guard we can define a function that maps a positive integer to its list of factors:
```hs
factors: Int -> [Int]
factors n = [x | x <-[1..n], n `mod` x==0]

> factors 15
[1,3,5,15]
```

- a positive integer is prime if its only factors ar e1 and itself

```hs
prime :: Int -> Bool
prim n = factors n == [1,n]
```

- primes up to n

```hs
primes :: Int -> [Int]
primes n = [x | x <- [2..n], prime x]

> primes 40
[2,3,5,7,11,13,17,19,23,29,31,37]
```
#### Zip Function

- the zip function maps two lists to a list of pairs of their corresponding elements

```hs
zip :: [a]->[b]->[(a,b)]
```

- using zip we can define  a function that returns the list of all positions of a value in a list

```hs
positions :: Eq a => a -> [a] -> [Int]
positions x xs = [i|(x',i)<- zip xs [0..],x==x']

> positions 0 [1,0,0,1,0,1,1,0]
[1,2,4,7]
```

#### String Comprehensions
- a **string** is a list

- list comprehensions can also be used to define functions on strings

```hs
count :: Char -> String -> Int
count x xs = length [x' | x' <- xs, x==x']

>count 's' "mississippi"
4
```

#### examples
[3-8-2.lhs](./3-8-2.lhs)

## Live Session

Logical formulas for access control logic ([see week 2](../week2/README.md#logical-formulas))

- P => Q
  - P speaks for Q
- &Phi;1 &sup; &Phi;2
  - if &Phi;1 then &Phi;2


- P says &Phi;
  -  P requests &Phi; **or** P states/believes &Phi; is true
- P controls &Phi;
  - if P says &Phi;, then &Phi; is true
  - P says &Phi; &rarr; &Phi;
- P &rArr; Q 
  - P speaks for Q

- P,Q are principal expressions
  - P & Q
    - P in conjunction with Q
  - P | Q
    - P quotes 
    
### homework
- submit .lhs file and screenshot of terminal