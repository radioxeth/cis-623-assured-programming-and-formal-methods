--------------------------------------------------------------------------------
9.3.3  Demonstration 

       Illustrate the two representation of queues

       1. via a list    (type: Queue a)
       2. via 2 stacks  (type: QueueI a)
 
--------------------------------------------------------------------------------

> module Queue933 where

Representation 1.

An executable specification a Queue
Describe how a queue should behave but inefficient

> type Queue a = [a]
> empty = []
> add x q = q ++ [x]
> isEmpty q = null q
> front (x:q) = x
> remove (x:q) = q


-- Seek an alternative.
-- Implement a Queue via two lists 

Representation 2. 


> type QueueI a = ([a],[a])
> emptyI = ([],[])
> addI x (f,b) = (f,x:b)
> isEmptyI (f,b) = null f
> frontI (x:f,b) = x
> removeI (x:f,b) = flipQ (f,b)
>     where
>     flipQ ([],b) = (reverse b,[])
>     flipQ q = q

-- retrieve show, when a is of type Integer 
-- the list that represents the queue
-- It can be used to compare the two datatype
-- Queue an QueueI

> retrieve :: QueueI Integer -> [Integer]
> retrieve (f,b) = f ++ reverse b