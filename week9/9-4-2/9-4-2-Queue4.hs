-- Queue code - corrected algebraic specification

module Sp23Queue4 where
import Test.QuickCheck -- QuickCheck (older version)

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

q `equiv` q' = invariant q && invariant q' && retrieve q == retrieve q'

prop_isEmpty q = invariant q ==> isEmptyI q == (q `equiv` emptyI)

prop_front_empty :: Integer -> Bool
prop_front_empty x = frontI (addI x emptyI) == x

prop_front_add x q = invariant q && not (isEmptyI q) ==>
                        frontI (addI x q) == frontI q
prop_remove_empty x = removeI (addI x emptyI) `equiv` emptyI
prop_remove_add x q = invariant q && not (isEmptyI q) ==>
                        removeI (addI x q) `equiv` addI x (removeI q)

equivQ q = do k <- choose (0,0 `max` (n-1))
              return (take (n-k) els, reverse (drop (n-k) els))
   where
         els = retrieve q
         n = length els

equivQ :: QueueI Integer -> Gen (QueueI Integer)
prop_equivQ q = invariant q ==> forAll (equivQ q) $ \q' -> q `equiv` q'

prop_add_equiv q x = invariant q ==> 
                   forAll (equivQ q) $ \q' -> addI x q `equiv` addI x q'
