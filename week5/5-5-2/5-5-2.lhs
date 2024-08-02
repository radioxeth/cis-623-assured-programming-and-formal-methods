--------------------------------------------------------------------------------
5.5.2  The Set Data Type

       Illustrate, how to implement selected set operations via recursion
       (implemented in Set.lhs), import the module, and test the results here.

--------------------------------------------------------------------------------

> import Set 

a. beginning examples

> set1 :: Set Int
> set1 = makeSet [1,2,3]

> set2 :: Set Int
> set2 = makeSet [1,2,3,2,1]

> set3 :: Set Int
> set3 = makeSet [1,3,5]

> displayset1 =  showSet show set2
> displayset2 =  showSet show set2
> displayset3 =  showSet show set3


> test1 :: Bool
> test1 = eqSet set1 set2


> test2 :: Bool
> test2  = subSet set3 set1


> result = flatten set3 


b.  implement the disjoint function

> disjoint     :: (Eq a) => Set a -> Set a -> Bool

> disjoint s t = eqSet (inter s t) empty



