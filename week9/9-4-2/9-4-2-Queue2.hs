-- Queue code - corrected version (figures 2.4 and 2.5)

module Sp23Queue2 where
import Test.QuickCheck  -- (older version: import QuickCheck)

type Queue a = [a]
empty = []
add x q = q ++ [x]
isEmpty q = null q
front (x:q) = x
remove (x:q) = q

type QueueI a = ([a],[a])
emptyI = ([],[])
addI x (f,b) = flipQ (f,x:b)
isEmptyI (f,b) = null f
frontI (x:f,b) = x
removeI (x:f,b) = flipQ (f,b)

flipQ ([],b) = (reverse b,[])
flipQ q = q

retrieve :: QueueI Integer -> [Integer]
retrieve (f,b) = f ++ reverse b

invariant :: QueueI Integer -> Bool
invariant (f,b) = not (null f) || null b

prop_empty = retrieve emptyI == empty
prop_add x q = invariant q ==> retrieve (addI x q) == add x (retrieve q)
prop_isEmpty q = invariant q ==> isEmptyI q == isEmpty (retrieve q)
prop_front q = invariant q && not (isEmptyI q) ==> 
                        frontI q == front (retrieve q)
prop_remove q = invariant q && not (isEmptyI q) ==>
                        retrieve (removeI q) == remove (retrieve q)

prop_inv_empty = invariant emptyI
prop_inv_add x q = invariant q ==> invariant (addI x q)
prop_inv_remove q = invariant q && not (isEmptyI q) ==> invariant (removeI q)
