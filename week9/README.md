# Week 9 Applying Formal Methods Part 4
## Table of Contents
- [Week 1 Introduction](../week1/README.md)
- [Week 2 Beginning Steps](../week2/README.md)
- [Week 3 Programming Paradigms Part 1](../week3/README.md)
- [Week 4 Formal Methods and Programming](../week4/README.md)
- [Week 5 Applying Formal Methods Part 1](../week5/README.md)
- [Week 6 Applying Formal Methods Part 2](../week6/README.md)
- [Week 7 Programming Paradigms Part 2](../week7/README.md)
- [Week 8 Applying Formal Methods Part 3](../week8/README.md)
- **&rarr;[Week 9 Applying Formal Methods Part 4](README.md)**
- [Week 10 Applying Formal Methods Part 5](../week10/README.md)


### Learning Objectives

- Identify and use domain specific software (e.g., QuickCheck) as a tool for applying formal methods to program development.
- Present case studies (e.g., development of a queue datatype, a propositional theorem prover etc.) to demonstrate the practice of property testing (via randomly generated instances) for software testing and verification.


### Overview

property testing: a case study
- implementation of the queue data type
- QuickCheck


#### Queues

- FIFO
  - a list
  - 2 stacks?

### The Queue Data Type Representation 1

- fifo
  - add (enqueue)
  - remove (dequeue)
  - isEmpty
  - front (return, but not remove)
  - empty (is queue empty)


```hs
type Queue a = [a]

add x q = q ++ [x]
remove (x:q) = q
isEmpty q = null q
front (x:q)=x
empty = []
```

### The Queue Data Type Representation 2

#### An alternate representation

- use two stacks to represent a single queue
  - operations (add) can be more efficient
  - how do you maintain the FIFO property
  - when will elements be moved from one stack to another?

#### rules

two stacks, f and b

- empty queue: both stacks are empty
- dequeue: always return the top element from stack f
- whenever f is empty, we pop element from stack b one by one to stack f until stack b is empty
- enqueue: always push the new element to stack b and check if stack f is empty. 
  - If so, we pop elements from stack b one by one to stack f until stack b is empty.

#### Specification

```hs
type Queuel a = ([a],[a])

addl x (f,b) = 
removel (x:f, b) =
isEmptyl (f,b) = 
frontl (x:f,b) = 
emptyl = ([],[])
```

### Demonstration

- [9-9-3.lhs](./9-3-3/9-3-3.lhs)
- [Queue.hs](./9-3-3/Queue1.hs)

- [9-4-2-Queue1.hs](./9-4-2/9-4-2-Queue1.hs)
- [9-4-2-Queue2.hs](./9-4-2/9-4-2-Queue2.hs)
- [9-4-2-Queue3.hs](./9-4-2/9-4-2-Queue3.hs)
- [9-4-2-Queue4.hs](./9-4-2/9-4-2-Queue4.hs)
- [9-4-2.lhs](./9-4-2/9-4-2.lhs)
- [Queue1.hs](./9-4-2/Queue1.hs)
- [Queue2.hs](./9-4-2/Queue2.hs)

### Algebraic Specification

- any queue can be expressed as an algebraic expression
  - addl x1 (addl ax2 ... (addl xk emptyl)...)

p

## Live Session


invariant checks that f should never be empty (unless b is null) and q exists.

project due friday sept 6 at midnight.