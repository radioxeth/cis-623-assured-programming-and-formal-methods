# Week 4 Formal Methods and Programming
## Table of Contents
- [Week 1 Introduction](../week1/README.md)
- [Week 2 Beginning Steps](../week2/README.md)
- [Week 3 Programming Paradigms Part 1](../week3/README.md)
- **&rarr;[Week 4 Formal Methods and Programming](README.md)**
- [Week 5 Applying Formal Methods Part 1](../week5/README.md)
- [Week 6 Applying Formal Methods Part 2](../week6/README.md)
- [Week 7 Programming Paradigms Part 2](../week7/README.md)
- [Week 8 Applying Formal Methods Part 3](../week8/README.md)
- [Week 9 Applying Formal Methods Part 4](../week9/README.md)
- [Week 10 Applying Formal Methods Part 5](../week10/README.md)

### Learning Objectives
- Rename existing data types using the type keyword.
- Declare new types using the newtype declarations or the data mechanism (including recursive types) in Haskell.
- Write functions that manipulate data defined by using the data mechanisms.
- Explain what a type class is in Haskell language using existing type classes as examples.
- Show how to declare a data type to be a member of a type class.
- Define principal expressions and access control formula using the data mechanism in Haskell.
- Define Kripke structures and state the model checking problem with respect to the given access control logic
- Define the evaluation function for access control formula and carry out calculations to solve the model checking problem.
- Define the Set data type and implement the set operations by recursion and by list comprehension.


### Programming Verification and Testing

Motivations
- develop rigorous methods to verify the correctness of computer systems: software, hardware, or a combination
- systems can either be safety critical, commercially critical, or mission critical
- verification methods can establish whether a description of a system satisfies a specification

### Formal Verification
Techniques typically include:

- a description language for modelling systems
- a specification language for describing the properties to be verified
- a verification method to test if the description of a system property satisfies a specification

Approaches to verification
- proof-based or model-based
- automatic or semi-automatic
- intended domain of application (eg software or hardware, sequential or concurrent, etc)
- stage in program development: pre-development or post-development

### Program Verification and Testing

[4-3-2.lhs](./4-3-2.lhs)


### Case Study: Sorting

- Insertion Sort
- Merge Sort
- Quick Sort


[4-4-2.lhs](./4-4-2.lhs)

#### Insertion Sort

- should work for any list where the elements ar eordered (a member of thetype calss Ord)
  - implement the insert operation as a function insert
  - implement insertion sort as a function Isort
- use recursion in both cases

#### The Functions Insert and Isort

| Steps                       | The function `insert`                          | The function `isort`                        |
|-----------------------------|-----------------------------------------------|--------------------------------------------|
| Define the type.            | `Int -> [Int] -> [Int]`                       | `[Int] -> [Int]`                           |
| Enumerate the cases.        | `insert x []`<br>`Insert x (y:ys)`            | `isort []`<br>`isort (x:xs)`               |
| Define the simple cases.    | `insert x [] = []`                            | `isort [] = []`                            |
| Define the other cases.     | `insert x (y:ys)`<br>`  \| x <= y = x : y : ys`<br>`  \| otherwise = y : insert x ys` | `isort (x:xs) = insert x (isort xs)` |
| Generalize and simplify.    | `Ord a => a -> [a] -> [a]`                    | `Ord a => [a] -> [a]`                      |


#### Merge Sort

#### Sorted Function

property: given any input list (elements are ordered), each of the sorting functions will always return a sorted list.

1. pairs
```hs
pairs :: [a] -> [(a,a)]`
pairs xs = zip xs (tail xs)
```

2. sorted
```hs
sorted :: Ord a => [a] -> Bool
sorted xs = and [x <= y | (x,y) <- pairs xs]
```

After sorting the list, the number of elements remain unchanged

### Case Study: Caesar Ciphers

- encryption from plain text to cipher text

#### Caesar Cipher
- shift function:
```
shift 2 "ABCD"
-> AB"CDEF"
```

| Utility functions                 | Encoding and decoding methods                                | Frequency analysis                                                                                             |
|-----------------------------------|--------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|
| **Data.Char:**                    | Note the use of string comprehensions                        | Analyze from a large volume of text to obtain approximate percentage frequencies of the 26 letters.           |
| `ord`                             | `let2int`                                                    | Given an encoded string, but not the shift factor that was used to encode it, determine the shift factor in   |
| `chr`                             | `int2let`                                                    | order that we can decode the string. Use the position of the minimum chi-square value as the guess for the shift factor.     |
| `isLower`                         |                                                              |                                                                                                 |
| **Prelude:**                      | `shift`                                                      |                                                                                                               |
| `fromInteger`                     | `Encode`                                                     |                                                                                                               |
| `drop`                            |                                                              |                                                                                                               |
| `take`                            |                                                              |                                                                                                               |
| `length`                          |                                                              |                                                                                                               |
| `sum`                             |                                                              |                                                                                                               |

### Caesar Ciphers: Implementation and Cryptanalysis

[4-5-2.lhs](./4-5-2/4-5-2.lhs)
[cipher.hs](./4-5-2/cipher.hs)


### Data Declarations in Haskell

#### Introduction

- type declarations can be used to make other types easier to read; for example, given
```hs
type Pos = (Int,Int)
```

- we can define

```hs
origin :: Pos
origin :: (0,0)

left :: Pos -> Pos
left (x,y) = (x-1,y)
```

- like functoin definitions: type declarations can also have parameters
```hs
type Pair a = (a,a)
```
we can define
```hs
mult :: Pair Int -> Int
mult (m,n) = m*n

copy :: a -> Pair a
copy x = (x,x)
```

- type declarations can be nested
- they **cannot** be recursive


### Data and Type Declarations in Haskell
[4-6-3.lhs](./4-6-3.lhs)

#### Data Declarations
- a completely new type can be defined by specifying its values using a data declaration

```hs
data Bool = False | True
```

Note:
- the two values False and True are called constructors for the type Bool
- type and constructor names must always begin with an uppercase letter
- data declarations are similar to context-free grammars.
  - The former specifies the values of a type. the latter the sentences of a language

- values of new types can be used in the same ways as those of bult in types
```hs
data Answer = Yes | No | Unknown
```

- we can define
```hs
answers :: [Answers]
answers = [Yes, No, Unknown]

flip :: Answer -> Answer
flip Yes = No
flip No = Yes
flip Unknown = Unknown
```

- the constructors in a data declaration can also have parameters

```hs
data Shape = Circle Float
             | Rect Float Float
```

we can define
```hs
square :: Float -> Shape
square  n = Rect n n

area :: Shape -> Float
area (Circle r) = pi * r ^2
area (Rect x y) = x * y 
```

Note:
- shape has value of the form Circle r, where r is a float and Rect x,y where x and y are floats
- Circle and Rect can be viewed as functions that construct values of type Shape
- data declarations can alos have parameters

```hs
data Maybe a = Nothing | Just a

-- we can define

safediv :: Int -> Int -> Maybe Int
safediv _ 0 = Nothing
safediv m n = Just (m `div` n)

safehead :: [a] -> Maybe a
safehead [] = Nothing
safehead xs = Just (head xs)
```

#### Recursive Types
- new types can be declared in terms of themselves - **recursive** data types

```hs
data Nat = Zero | Succ Nat
```

- `Nat` is a new type, with constructors `Zero :: Nat` and `Succ :: Nat -> Nat`


- we can think of values of type Nat as natural numbers, where Zero represents 0 and Succ represents the successor function 1+

```hs
Succ (Succ (Succ Zero))
--
1+(1+(1+0))=3

```

- with recursion it is easy to define functions that convert between values of type Nat and Int

```hs
> nat2int      :: Nat -> Int
> nat2int Zero     = 0
> nat2int (Succ n) = 1 + nat2int n

> int2nat   :: Int -> Nat
> int2nat 0 = Zero
> int2nat n = Succ (int2nat (n-1))
```

- two natural numbers can be added by converting them to integers, adding, and then converting back
```hs
> add1     :: Nat -> Nat -> Nat
> add1 m n = int2nat (nat2int m + nat2int n)
```

- however, using recursion the function add can be defined without the need for conversions

```hs
> add2        :: Nat -> Nat -> Nat
> add2 Zero n     = n
> add2 (Succ m) n = Succ (add2 m n)
```


#### Type Classes

- a *type class* is a collection of types that support certain overloaded operations called methods
- haskell provides several basic classes that are built into the language, the most used are:
- `Num, Eq, Ord, Show, Read, Integral`

#### Overloaded functions
- polymorphic function is called overloaded if its type contains one or more class constraints

```hs
(+) :: Num a => a -> a -> a

-- for any type a (+) takes two types of Num and returns Num
```
- `Num` numeric types
- `Eq` equality types
- `Ord` ordered types

#### Type classes
- a new class can be declared using a mechanism
- the declaration states that, for a type a to be an instance of the class, it mus support a list of operators of the specified types
- when new types are declared, it is usually appropriate to make the minto instance of a few built-in classes in the form of the deriving mechanism (see the example of type Bool in Section 8.5 for details)


### Access Control Formulas: Specification
- prinicipal expressoions and access control formulas

#### Principal Expressions

> Princ ::= PName/Princ & Princ/Princ|Princ

```hs
data Prin = Name String
            | Together Prin Prin
            | Quote Prin Prin
            deriving (Show, Eq)
```

Access-Control Formulas

> Form:=PropVar /&not;Form/(Form&or;Form)/(Form&and;Form)/(Form&sup;Form)/(Form&equiv;> Form)/(Princ&rArr;Princ)/(Princ says Form)/(Princ controls Form)

Where
> Princ ::= PName / Princ & Princ / Princ | Princ

```hs
data Form = Var Char
          | Not Form
          | Or Form Form
          | And Form Form
          | Imply Form Form
          | Equiv Form Form
          | Says Prin Form
          | Cont Prin Form
          | For Prin Prin
          deriving (Show)

data Prin = Name String
          | Together Prin Prin
          | Quote Prin Prin
          deriving (Show, Eq)
```

### Access Control Formulas: Implementation

[4-8-1.lhs](./4-8-1.lhs)

## Live 
https://hackage.haskell.org/
