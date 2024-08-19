# Week 7 Programming Paradigms Part 2
## Table of Contents
- [Week 1 Introduction](../week1/README.md)
- [Week 2 Beginning Steps](../week2/README.md)
- [Week 3 Programming Paradigms Part 1](../week3/README.md)
- [Week 4 Formal Methods and Programming](../week4/README.md)
- [Week 5 Applying Formal Methods Part 1](../week5/README.md)
- [Week 6 Applying Formal Methods Part 2](../week6/README.md)
- **&rarr;[Week 7 Programming Paradigms Part 2](README.md)**
- [Week 8 Applying Formal Methods Part 3](../week8/README.md)
- [Week 9 Applying Formal Methods Part 4](../week9/README.md)
- [Week 10 Applying Formal Methods Part 5](../week10/README.md)

Learning Objectives
- State what higher order functions are and give examples, in the Haskell language, those that capture common programming patterns (e.g., map, filter, folder, etc.).
- Use the higher order functions such as map, filter etc. to compose Haskell functions.
- Describe and explain the terms reference monitors, tickets, and access control lists within the context of access control.
- State the Ticket Rule and provide the reasons to support it as an inference rule for access control logic.
- Describe the access rights of subjects to a list of objects by using an access control matrix.
- Explain how to derive from the access control matrix, an access control list or a capability list which specify the access rights of each subject.

### Overview

- higher-order functions
  - what are they>
  - observation: functions are data and can be treated like data
- basic access-control concepts

#### Introduction


- a function is called higher-order if it takes a function as an argument or returns a function as a result

```hs
twice :: (a -> a) -> a -> a
twice f x = f (f x)
```

#### Why are they useful?

- *common programming idioms* can be encoded as functions within the language itself
- *domain-specific languages* can be defined as collections of higher-order functions
- *algebraic properties* of higher-order functions can be used to reason about programs

### List Processing, Part 1

#### Maps and Filters

```hs
map f [x,y,z,w,v]=[f x, f y, f z, f w, f v]

filter p [x,y,z,w,v]=[x,z,v]
(p x = p z = p v = True; p y = p w = False)
```

#### The map function

- the higher order library function called map applies a function to every element of a list

```hs
map f xs = [f x | x <- xs]

map f [] = []
map f (x:xs) = f x : map f xs
```


#### The filter function

- the higher-order library function filter selects every element from a list that satisfies a predicate

```hs
filter :: (a -> Bool) -> [a] -> [a]

> filter even [1..10]

[2,4,6,8,10]
```

filter can be defined using a list comprehension

```hs
filter p xs = [x | x <- xs, p x]
```

- or recursion

```hs
filter p [] = []
filter p (x:xs)
    | p x       = x : filter p xs
    | otherwise = filter p xs
```

### Examples

- [7-3-2.lhs](./7-3-2.lhs)


- map (f.g) === (map f) . (map g)


### List Processing, Part 2

#### Lambda functions

example: lambda (&lambda;) expressions (hutton, section 4.5)
- &lambda; x y -> x + y
- &lambda; f x -> f x
- &lambda; f g -> (&lambda; x -> f (g x))

#### Why are lambdas useful?

- lambda expression can be used to give a formal meaning to function defined using **currying**:


```hs
add x y = x + y

means

add lambda x -> (lambda y -> x + y)
```

lambda expression are useful when defining functions that return functions themselves
- lambda expressions can be used to avoid naming functions that are only reference once

```hs
odds n = map f[0..n-1]
    where
      f x = x*2 +1

odds n = map (lambda x -> x*2 + 1)[0..n-1]
```

### Programming Patterns Part 1

#### The Composition Operator

- the library function (.) returns the composition of two functions as a single function

```hs
(.) :: (b -> c) -> (a -> b) -> (a -> c)
f.g = \x -> f(g x)

odd :: Int -> Bool
odd =  not.even
```

#### Examples

- twice f = f.f
- sumsqreven = sum.map(^2).filter even

### Other common patterns

- the library function all decides if every element of a list satisfies a given predicate

```hs
all :: (a->Bool)->[a]->Bool
all p xs = and [p x | x <- xs]

> all even [2,4,6,8,10]
True
```

- the library function **any** decides if at least one element of a list satisfies a predicate

```hs
any :: (a -> Bool) -> [a] -> Bool
any p xs = or[p x | x <- xs]
```


- the function **takeWhile** selects elements from a list while a predicate holds all of the elements

```hs
takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile p [] = []
takeWhile p (x:xs)
  | p x = x : takeWhile p xs
  | otherwise = []


> takeWhile (/='') "abc defd"

"abc"
```

- the function **dropWhile** removes elements from a list while a predicate holds all of the elements

```hs
dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile p [] = []
dropWhile p (x:xs)
  | p x = dropWhile p xs
  | otherwise = x:xs


> dropWhile (== '') "    abc"

"abc"
```

### Examples
- [7-5-3.lhs](./7-5-3.lhs)
- [Sqrt.lhs](./Sqrt.lhs)

### Programming Patterns Part 2

#### Recursion Operators

#### The Foldr function

- a number of funcions on lists can be defined using the following simple pattern on recursion

```hs
f [] = v
f(x:xs)=x <some function> f xs
```

- the higher-order library function **foldr** (fold right) encapsulates this simple pattern f recursion with the function `<some function>` and the value v as arguments

```hs
sum = foldr (+) 0
product = foldr (*) 1
or = foldr (||) False
and = foldr (&&) True
```

foldr itself can be defined using recursion

```hs
foldr :: (a->b->b)->b->[a]->b
foldr f v [] = v
foldr f v (x:xs) = f x (foldr f v xs)
```

- however it is best to think of foldr nonrecursively

### Examples

- [7-6-2.lhs](./7-6-2.lhs)


## Live Session

Higher order functions will be on the final.