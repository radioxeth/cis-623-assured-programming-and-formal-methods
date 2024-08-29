9-4-2

-- Queue code - incorrect version

module Queue1 where
import Test.QuickCheck  -- (older version: import QuickCheck)

type Queue a = [a]
empty = []
add x q = q ++ [x]
isEmpty q = null q
front (x:q) = x
remove (x:q) = q

type QueueI a = ([a],[a])
emptyI = ([],[])
addI x (f,b) = (f,x:b)
isEmptyI (f,b) = null f
frontI (x:f,b) = x
removeI (x:f,b) = flipQ (f,b)
   where
         flipQ ([],b) = (reverse b,[])
         flipQ q = q

retrieve :: QueueI Integer -> [Integer]
retrieve (f,b) = f ++ reverse b

prop_empty = retrieve emptyI == empty
prop_add x q = retrieve (addI x q) == add x (retrieve q)
prop_isEmpty q = isEmptyI q == isEmpty (retrieve q)
prop_front q = frontI q == front (retrieve q)
prop_remove q = retrieve (removeI q) == remove (retrieve q)
