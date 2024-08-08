# Week 6 Applying Formal Methods Part 2
## Table of Contents
- [Week 1 Introduction](../week1/README.md)
- [Week 2 Beginning Steps](../week2/README.md)
- [Week 3 Programming Paradigms Part 1](../week3/README.md)
- [Week 4 Formal Methods and Programming](../week4/README.md)
- [Week 5 Applying Formal Methods Part 1](../week5/README.md)
- **&rarr;[Week 6 Applying Formal Methods Part 2](README.md)**
- [Week 7 Programming Paradigms Part 2](../week7/README.md)
- [Week 8 Applying Formal Methods Part 3](../week8/README.md)
- [Week 9 Applying Formal Methods Part 4](../week9/README.md)
- [Week 10 Applying Formal Methods Part 5](../week10/README.md)

### Learning Objectives

- Use programming examples to describe the use of formal methods in the specification, testing and verification regarding software development.
- Apply programming and reasoning skills in formal methods to develop the set datatype, represent the access control formula and to solve the model checking problem in access control logic.

### Apply Formal Methods, Part II

- implement and test the Set data type
- represent a Kripke model in haskell programs and implement its evaluation function
- use the evaluation function t0 solve the model checking problem


### The Set Data Type II

- A ∩ B = B ∩ A (commutative law)
- (A ∩ B) ∩ C = A ∩ (B ∩ C) (associative law)
- φ ∩ A = φ, U ∩ A = A (law of φ and U)
- A ∩ A = A (idempotent law)
- A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C) (distributive law)
  - That is, ∩ distributes over ∪.


#### Practice

implement a test in Haskell language to demonstrate that set intersection is commutative.

> condition: (A &cap; B) = (B &cap; A)

|case|A|B|input|output pair|
|--|--|--|--|--|
||||||

- Set data type
  - primarily using recursion
  - primarily using list comprehension


### Using Randomly Generated Instances

- [6-3-2.lhs](./6-3-2/6-3-2.lhs)
- [Set.hs](./6-3-2/Set.hs)

### Preparing Tests

- input-output pairs (block box test)
- a helper function (white box test)
- single operation (eg union intersection etc)
- sequence of operations
- known properties (associativity of intersections)
- properties that are not always true


#### Sequence of operations

- empty Set &rarr;(op1)&rarr; Set1 &rarr;(op2)&rarr; Set2
  - cardinality = 0
  - card = 2
  - card = 4
  - etc

#### Testing Properties
- construct single case or use randomly generated instances
  - single operation
  - A&cup;A=A, A&cap;A=A

- sequence of operations (known to be true)
  - for any set A, card(A&cup;A)=card(A&cap;A)
  - for any set A B C, (A&cup;B)&cap;C=(A&cap;C)&cup;(B&cap;C)

- properties that are not always true
  - for any set A,B, card (A&cup;B)=card(A)
  - for any set A,B,C (A-B)-C=A-(B-C)
- what will our random testing tool respond to in these tests?

- what will our random testing tool respond to in these tests?


### The Evaluation Function Part 1

- representation of Kripke structures

- &Epsilon;m:(W,I,J)&rarr;Form&rarr;true

#### Kripke Models

| Mathematical definition | Haskell definition |
|-------------------------|---------------------|
| - \( \mathcal{M} = (W, I, J) \) | `type WKripke = Set Int` |
| - \( W \): nonempty set | `type IKripke = Set (PropVar, Int)` |
| - \( I : \text{PropVar} \rightarrow \mathcal{P}(W) \) | `type JKripke = Set (PName, (Int, Int))` |
| - \( J : \text{PName} \rightarrow \mathcal{P}(W \times W) \) | `type Kripke = (WKripke, IKripke, JKripke)` |

- Remarks
  - the functions I and J in the definition are not directly translated from the mathematical definition. Both are now a list of tuples.

- [Example 2.8 in the text](/acst_ch2.pdf)

```hs
I1=the set where the underlying list is
> [(q,w0),(q,w2),(r,w1),(s,w1),(s,w2)]

J1=the set where the underlying list is 
> [(Alice,(w0,w0)),...,(Alice,(w2,w2)),(Bob,(w0,w0)),...,(Bob,(w2,w1))]
```

### Evaluation Function: Specification
### Semantics: Definition of $E_M \left[ \cdot \right]$

- $E_M[\neg \varphi]  = W - E_M[\varphi]$
- $E_M[\varphi_1 \land \varphi_2]  = E_M[\varphi_1] \cap E_M[\varphi_2]$
- $E_M[\varphi_1 \lor \varphi_2]  = E_M[\varphi_1] \cup E_M[\varphi_2]$
- $E_M[\varphi_1 \rightarrow \varphi_2]  = (W - E_M[\varphi_1]) \cup E_M[\varphi_2]$
- $E_M[\varphi_1 \leftrightarrow \varphi_2]  = E_M[\varphi_1 \rightarrow \varphi_2] \cap E_M[\varphi_2 \rightarrow \varphi_1]$
- $E_M[P \text{ says } \varphi]  = \{ w \mid J(P)(w) \subseteq E_M[\varphi] \}$
- $E_M[P \text{ controls } \varphi]  = E_M[(P \text{ says } \varphi) \rightarrow \varphi]$
- $E_M[P \Rightarrow Q] = $
  - $W \text{ if } J(Q) \subseteq J(P)$
  - $\emptyset{} \text{ otherwise}$
 

#### Revised Version
- definition 
  - q , q\` are equivent invariant (q), invariant (q\`), and retreive (q)== retrieve (q`)
- QuickCheck property 
  - q `equiv` q\` = invariant (q) && invariant (q\`)
  - && retrieve(q) === retrieve(q`)

### The Evaluation Function, Part 2

- [6-6-1.lhs](./6-6-1/6-6-1.lhs)
- [Set.hs](./6-6-1/Set.hs)

### Preparing Tests

#### Tests

- the implementation function involves several helper functions, and we can prepare tests for these functions
- in the following demonstrating we will focus on the following text examples 2.8, 2.12, and 2.15
- also review the example 2.9 (not included in the demonstration)


### Testing Demonstration

- [6-6-3.lhs](./6-6-3/6-6-3.lhs)
- [6-6-3-after.lhs](./6-6-3/6-6-3-after.lhs)
- [Set.hs](./6-6-3/Set.hs)

### More Programming Examples

- [6-8-1.lhs](./6-8-1.lhs)
- [Set.hs](./Set.hs)


## Live Session