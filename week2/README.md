# Week 2 Beginning Steps
## Table of Contents
- [Week 1 Introduction](../week1/README.md)
- **&rarr;[Week 2 Beginning Steps](README.md)**
- [Week 3 Programming Paradigms Part 1](../week3/README.md)
- [Week 4 Formal Methods and Programming](../week4/README.md)
- [Week 5 Applying Formal Methods Part 1](../week5/README.md)
- [Week 6 Applying Formal Methods Part 2](../week6/README.md)
- [Week 7 Programming Paradigms Part 2](../week7/README.md)
- [Week 8 Applying Formal Methods Part 3](../week8/README.md)
- [Week 9 Applying Formal Methods Part 4](../week9/README.md)
- [Week 10 Applying Formal Methods Part 5](../week10/README.md)


### Learning Objectives
- Use functions given in standard prelude of the Haskell language to define new functions.
- Study and identify the main features of a Haskell script.
- Explain the goals and basic principles of literate programming and apply the principles to compose literate Haskell scripts.
- Specify and define simple functions in the Haskell language and evaluate these functions using the Glasgow Haskell compiler.
- Detail the evaluation steps of a Haskell expression using a sequence of equations with supporting reasons.
- Describe the main features of a logical language for access control.

### Overview
- functional programming in Haskell
  - examine and use existing functions (from prelude)
  - how haskell functions are being evaluated
  - types
  - literate programming
  - write simple haskell scripts

- Formal methods
  - mathematical logic and formal methods
  - logical languages
  - specify properties rigorously using a logical language
  - well-formed formulas and their meanings

### Function Evaluation and Types

- [2-3-1.lhs](./2-3-1/2-3-1.lhs)
- [H-pp246-252.pdf](./2-3-1/H-pp246-252.pdf)

### Function Evaluation

#### Function Application

In mathematics, function applicatoin is denoted using parentheses and multplicatoin is often denoted using juxtaposition or space

`f(a,b)+ c d`

In haskell a function is denoted using space and multiplication is denoted using *

`f a b + c*d`

Function application is assumed to have higher priority than all other operators

`f a + b`

### Haskell Functions and Types

#### What is a Type?
- a type is a name for a collection of related values; for example in  Haskell the based type `Bool` contains two values `True` or `False`

#### Type Errors

`1 + False`

- cannot evaluate, will not compile

#### Types in Haskell
- if evaluating an expression e would produce a value of type t, then e has type t, written 

`e::t`

- every well-formed expression has a type, which can be automatically calculated at compile time using a process called type inference

- all type errors are found at compile time, which makes programs safer and faster by removing the need for type checks at run tmie
- in GHCi, the :type comman calculates the type of an expression without evaluating it

#### Basic Types
- Bool
- Char
- String
- Int
- Integer
- Float

#### List Types
- a list is a sequence of values of the same type
- we can have lists of lits

#### Tuple Types
- a tuple is a sequence of values of different types

`(False,True)::(Bool,Bool)`
`(False,'a',True)::(Bool,Char,Bool)


#### Function Types
- a function is a mapping from values of one type to values of another type

`not::Bool -> Bool`
`even::Int -> Bool`

#### Lambda Expressions

- functions can be constructed without naming the functions by using lambda expressions

`lambda x -> x+x`
#### Why are Lambdas Useful?

- lambda epressions can be used to gibe a frmal meaning to functions defined using **currying**
- for example

`add x y = x + y`
means
`add lambda x -> (lambda y -> x + y)`

- lambda expressions are also useful when defining functions that return **functions as results**
```
const :: a -> b -> a
const x _ = x
```

is more naturally defined by 

```
const :: a -> (b -> a)
const lambda _ -> x
```

Lambda expressions be used to avoid naming functions that are only evaluated once


#### Sections
```
> (1+) 2
3

> (+2) 1
3
```

#### WHy are sections useful?
```
(1+) -- successor function
(1/) -- reciprocation function
(*2) -- doubling function
(/2) -- halving function
```

### Haskell Scripts


[2-4-2.lhs](./2-4-2.lhs)

#### Literate Programming and Haskell Scripts

- Knuth
  - to treat a program as a piece of literature addressed to human beings rather than to a computer
  - that the program is also viewed as a hypertext document

#### Literate Haskell Script

- in Haskell, a program is either with suffix .hs or .lhs
- scripts with the suffix .lhs can be written in a style that provides native features to support literate programming

### Functional Programs

#### Number to Words, Part 1

- Problem Statement (bird, section 1.4 pp 7-12)
- define  a haskel function that:
  - given a nonnegative number less than one million, it returns a string that represents the number in words.

#### Number to Words, Part 2

- Understanding the problem
  - formulate a list of questions that can help you to better understand the given programming problem: answer them as precisely as you can if possible
  - for example: what are the inputs and their outputs, notations, conditions et

#### Number to Words, Part 3
- devising a plan
  - have you seen it seen the problem in a slightly different form?
  - do you know some utility functions that could be useful
  - could you restate the problem
  - could you imagine a more accessible related problem, a more specific one, a simpler one
  - a more general problem
  - a more special problem
  - could you solve part of the problem

#### Number to Words, Part 4
- carry out your plan
  - when you have a plan of the solution, implement it.
  - check each step carefully
  - can you check if the step has no obvious errors

#### Number to Words Part 5
- examining the solution obtained


### Design and Specification

- to devise a plan for the program can be divided into two sections
  - design
  - specification
- work together
- program design in functional programming
  - program construction emphasized functions and their application
  - design single function using a collection of functions
  - function composition/decomposition

#### Pipeline Structure
- pipeline structure: convert6=combine6*digits6
- (h=convert6, f=digits6; g=combine6)
- h: A->C(write h=g&comp;f)

Convert:: int->string
<br>
x (digits6)::(combine6) name of that integer


#### Design an Specification
- from understanding the problem to devising a solution
  - create and examine input-output examples
  - use simple mathematical notation to specify the problem precisely and concisely
  - test and solve small but representative special cases

### Implementation and Testing

[2-5-3.lhs](./2-5-3.lhs)


### The Design of A Logical Language

#### The Language or Propositional Logic

- syntax
- semantics
- poof theory

--

- we describe the underlying world by well formed formulas
- well-formed formulas are built form propositional symbols and logical symbols
- the meaning of these formulas is specified by the truth tables of the formulas
- the syntax of the language is the rigorous definitions that specify what the well formed formulas are


1. Symbols for atomic propositions: p,q,r,s
2. logical symbols &not; (not) &and; (and) &or; (or) &rarr; (if then)
3. Well-formed formulas (wff). They are constructed via recursion by the following rules

| Rule | Construction Rule                            | Description                                                        |
|------|----------------------------------------------|--------------------------------------------------------------------|
| 1    | p                                            | Every propositional atom is a well-formed formula                  |
| 2    | ¬φ                                           | If φ is a wff, then so is ¬φ                                        |
| 3    | (φ ∧ ψ)                                      | If φ, ψ are wffs, then so is (φ ∧ ψ)                               |
| 4    | (φ ∨ ψ)                                      | If φ, ψ are wffs, then so is (φ ∨ ψ)                               |
| 5    | (φ → ψ)                                      | If φ, ψ are wffs, then so is (φ → ψ)                               |


#### Syntax of Propositional Logic

1. (base case) p q r s
2. (rules) by recursion

#### Bakus Naur Form
1. BNF refers to a compact way to formally specify a logical language
2. BNF for well-form formula in propositional logic

&phi;::=p|(&not;&phi;)|(&phi;&and;&phi;)|(&phi;&or;&phi;)|(&phi;&rarr;&phi;)

- p stands for any atomic proposition
- each occurrence of &phi; to the right so f ::= stands for any already constructed formula
3. BNF notation are used when specifying the grammar for a context free language
 (specifying the syntax of a programming language)

#### Semantics
- suppose that &phi; is a well-formed formula. When do we say that is true?
  - we can construct a truth table for &phi; according to the definition of the logical connectives
  - each row represents a possible world where &phi; is true
- we can also compute the truth value &phi; for each model by using recursion (the construction rule given previously)

#### Proof Theory
- naturdal deduction
  - formulate inference rules as the basis for deduction
    - Hypothesis: H1: &phi;, H2: &phi&rarr;&phi;'
    - Conclusion: C: &phi;'

### Other Logical Languages

- what is first-order logic? Did you use it before?
- express the following property
  - an integer n greater than one is prime if its only positive factores are one and the number itself
  - formally, as prim (n) thatis

  `prime (n) is tru if and only if n satisfy (*)`

  - prime: predicate

- another name: predicate logic
- we often use the language when specifying mathematical (or formal) properties, such as specifying when a positive integer is a prime
- their language can be formulated rigorously (but beyond the scope of our class)
- you often use it informally as in many computer science texts when we specify problems and code it up



- their languages have
  - quantifiers 
    - &forall; (for all)
    - &exist; (there exists)
  - ususal logical symbols, such as &not; &and; &or; &rarr;

#### The Property Prime (n)

&forall; n[(n>1)&rarr;[factor(r,n)\&rarr;((r=1)&or;r=n)]]

- factor is a predicate symbol to represent the property "r is a factor of n"
- we can translate this property as haskell code easily.

```haskell
-- haskell function to determine if n is prime
isPrime :: Integer -> Bool
isPrime n
  | n <= 1 = False
  | otherwise = not (any (\x -> n `mod` x == 0) [2..sqrtN])
  where sqrtN = floor (sqrt (fromIntegral n))
```

### Access Control Logic: The Language

#### Definition
- what do we need?
we need a language that lets us describe precisely and reason about:
  - principals
  - requests principals make
  - access-control policies
  - statements principals make
  - authorities and their jurisdiction
  - certificates
  - credentials
  - trust assumptions

#### principa names
- principe name refer to simple princiapls PName
- alice
- bob
- the key

#### Logical Formulas

- relevant primitive sets (and meta variables)
  - principal expressions A, B P Q &in; Princ (=PName for now)
  - propositional variables: p q r &in; PropVar

- logical formulas (&phi;&in;Form) given by

&phi;::= p | &not; p | (&phi;1 &and; &phi;2) | (&phi;1 &or; &phi;2) | (&phi;1 &sup; &phi;2) | (&phi;1 &equiv; &phi;2) | (P&Rarr;Q) | (P says &phi; ) | (P controls &phi;)

- sample well formed formulas

  - r ((&not;1&and;r)&sup;s)
  - (Alice says r &or;(p&sup;q))
- not well formed formulas
  - &not; ALice
  - (Alice&Rarr;(p&and;q))
  - (Alice controls Bob)

#### Principal Expressions

- BNF specification
  - princ:: = PName / Princ & Princ / Princ | Princ
- P, Q are principal epxressions
  - P & Q : P in conjunction with Q
  - P | Q : P quotes Q

#### Interpreting Principal Expressions
- P&Q denotes the abstract principal "P in conjunction with Q"
- P|Q denotes the abstract principal "P quoting Q"; for example:
  - president & congress denotes the abstract principal "the President together with Congress"
  - Reporter | Source denotes the abstract principal "the reporter quoting her source"


#### example

- P Macy (a principal); Q: Al ( principal)
- &Phi; the action 'read file foo'
- the following are well-formed access-control statements
  - P says &Phi;: Macy's request to read the file foo
  - P controls &Phi;: Macy's entitlement to read the file file
  - P &Rarr;: Q Macy speaks for Al

#### more examples

Jill says (r&sup;(p&or;q))
> note: a principal expression can be part of a wel-formed access-control statement, but it is not a well-formed access-control statement



- Form ~ (Prince says Form)
- Form ~ (PName says Form)
- Form ~ (Jill says Form)
- Form ~ (Jill says (Form → Form))
- Form ~ (Jill says (PropVar → Form))
- Form ~ (Jill says (r → Form))
- Form ~ (Jill says (r → (Form ∨ Form)))
- Form ~ (Jill says (r → (PropVar ∨ Form)))
- Form ~ (Jill says (r → (p ∨ Form)))
- Form ~ (Jill says (r → (p ∨ PropVar)))
- Form ~ (Jill says (r → (p ∨ q)))

#### non-well-formed statments

| Non-well-formed access-control statement | Reason                                                         |
|------------------------------------------|----------------------------------------------------------------|
| Orly & Mitch                             | A principal expression, not an access-control formula         |
| ¬ Orly                                   | The negation operator must precede an access-control formula  |
| (Orly) ⇒ (p ∧ q)                         | Because (p ∧ q) is not a principal expression, the speaks-for operator ⇒ must appear between two principal expressions |
