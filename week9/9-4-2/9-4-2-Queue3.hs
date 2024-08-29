-- Queue code - incorrect algebraic specification (figure 2.6)

module Sp23Queue3 where
import Test.QuickCheck  -- (older version: QuickCheck)

type QueueI a = ([a],[a])
emptyI = ([],[])
addI x (f,b) = flipQ (f,x:b)
isEmptyI (f,b) = null f
frontI (x:f,b) = x
removeI (x:f,b) = flipQ (f,b)

flipQ ([],b) = (reverse b,[])
flipQ q = q

invariant :: QueueI Integer -> Bool
invariant (f,b) = not (null f) || null b

prop_isEmpty q = invariant q ==> isEmptyI q == (q == emptyI)
prop_front_empty x = frontI (addI x emptyI) == x
prop_front_add x q = invariant q && not (isEmptyI q) ==>
                        frontI (addI x q) == frontI q
prop_remove_empty x = removeI (addI x emptyI) == emptyI
prop_remove_add x q = invariant q && not (isEmptyI q) ==>
                        removeI (addI x q) == addI x (removeI q)
