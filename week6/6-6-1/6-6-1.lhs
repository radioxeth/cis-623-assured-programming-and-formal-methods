--------------------------------------------------------------------------------
6-6-1.lhs


Illustrate the implementation of Kripke's models, ACL formulas and 
the evaluations


> import Prelude 
> import Set
> import Test.QuickCheck


-------------------------------------------------------------------------------
Preliminaries:

-- Represent single principals and propostional variables
-- Define Principal expression and ACL formula 

-------------------------------------------------------------------------------

> type PName   = String        -- Represent the name of a simple princlpal  
> type PropVar = Char          -- Represent the name of a propositional var.

> data Prin = Name PName       -- Define a principal expression 
>     | Together Prin Prin     -- ie. the expression Princ & Princ  in ACST                               
>     | Quote Prin Prin        -- ie. the expression Princ | Princ  in ACST
>       deriving (Eq, Show)

> data Form  = Var Char
>            | Not   Form
>            | Or    Form Form
>            | And   Form Form
>            | Imply Form Form
>            | Equiv Form Form
>            | Says  Prin Form  -- Written as (Princ controls Form) in ACST
>            | Contr Prin Form  -- Written as (Princ controls Form) in ACST
>            | For   Prin Prin  -- Written as  P ⇒ Q in ACST
>              deriving Show


-------------------------------------------------------------------------------
Represent a Kripke Model (for Access control formula)
-------------------------------------------------------------------------------

A kripke model M for ACL formula consists of:

1. a list of simple principals       (each member is a simple principal in M)
2. a list of propositional variables (each member is a prop. variable   in M)
3. a list/set of elements each represents a possible world in M
4. a list/set of tuples that represents the interpretation function for M
5. a list/set of tuples that represents the interpretation function that maps 
   each propositional variable to a set of worlds of M. 
6. a list/set of tuples that represents the J function that maps each principal 
   name to a relation on worlds (a subset of W ×W) of M.

We write M = (W, I, J) when the simple principals and propositional variables
in the model M are specified properly.

Example: 

-- Represent all the simple principals in M as a list 

> princLst :: [PName]
> princLst = ["Alice","Bob"]

   -- Represent all the atomic propositions as a list 

> propLst :: [PropVar] 
> propLst = ['q','r','s']

   -- Represent the set W:

> lstW :: [Int]
> lstW = [0,1,2]

> setW :: Set Int
> setW = makeSet lstW

   -- Represent the set I:

> lstI :: [(Char,[Int])]
> lstI = [('q',[0,2]),('r',[1]),('s',[1,2])]

> setI :: Set (Char,[Int])
> setI = makeSet [('q',[0,2]),('r',[1]),('s',[1,2])]


   -- Represent the set J (type Set (Char, [Int]):

> lstJ :: [(PName,[(Int,Int)])]
> lstJ =  [("Alice",[(0,0),(1,1),(2,2)]),
>          ("Bob",[(0,0),(0,1),(1,2),(2,1)])
>          ]        


> setJ :: Set (PName,[(Int,Int)])
> setJ = makeSet [("Al",[(0,0),(1,1),(2,2)]),
>                 ("Bob",[(0,0),(0,1),(1,2),(2,1)])
>                ]

-- Represent the model M:

> modelLstM :: ([Int], [(Char,[Int])], [(PName,[(Int,Int)])])
> modelLstM = (lstW, lstI, lstJ)

> modelM :: (Set Int, Set (Char,[Int]), Set (PName,[(Int,Int)]))
> modelM = (setW, setI, setJ)


--------------------------------------------------------------------------------
Example:  Write a function uniqueI 
--------------------------------------------------------------------------------

Write a function:

uniqueLst :: (Eq a, b) => [(a, b)] -> Bool

such that given an input list s (of type [(a,b]), uniqueI s will 
return True if  there exists an unique tuple (x,y) in the input 
list s. Otherwise, it returns False.



> uniqueLst    :: (Eq a, Eq b) => [(a, b)] -> Bool
> uniqueLst ts = and [ uniqueE (a,b) ts | (a,b) <- ts]  

> uniqueE :: (Eq a, Eq b) => (a,b) -> [(a, b)] -> Bool
> uniqueE (x,y) ts = ( sum [ 1 | (x1,y1) <- ts , x1 == x, y1 == y] == 1)

 
--------------------------------------------------------------------------------

Implement the evaluation for ACL formula with kripke's structure
--------------------------------------------------------------------------------

> type WKripke = Set Int
> type IKripke = Set (Char,Int)
> type JKripke = Set (String,(Int,Int))

em             :: (WKripke, IKripke, JKripke) -> Form -> WKripke
em (w, i, j) (Var c)  =      -- Write the function I
em (w, i, j) (Not f)  =      -- Use set diff (Set.hs)               
em (w, i, j) (Or f g) =      -- Use set union (Set.hs)               
em (w, i, j) (And f g) =     -- Use set inter (Set.hs)   
em (w, i, j) (Imply f g) =   -- Use set diff and set union (Set.hs) 
em (w, i, j) (Equiv f g) =   -- Use set inter (Set.hs) and em recursively    
em (w, i, j) (Says  p f) =   -- What are the helpers we can use here ?
em (w, i, j) (Contr p f) =   -- Use em recursively 
em (w, i, j) (For p1 p2) =   -- What are the helpers we can use here ?




> em             :: (WKripke, IKripke, JKripke) -> Form -> WKripke
> em (w, i, j) (Var c)  = ifunction i c 
> em (w, i, j) (Not f)  = diff w (em (w, i, j) f)                 
> em (w, i, j) (Or f g) = union (em (w, i, j) f) (em (w, i, j) g) 
> em (w, i, j) (And f g) = inter (em (w, i, j) f) (em (w, i, j) g) 
> em (w, i, j) (Imply f g) = union (diff w (em (w, i, j) f)) (em (w, i, j) g)  
> em (w, i, j) (Equiv f g) = inter (em (w, i, j) (Imply f g)) (em (w, i, j) (Imply g f))  
> em (w, i, j) (Says  p f) = 
>     makeSet [ n | n <- flatten w, (subSet (jhelper (jfunction j p) n) ((em (w, i, j) f)))] 
> em (w, i, j) (Contr p f) = em (w, i, j) (Imply (Says p f) f) 
> em (w, i, j) (For p1 p2) = if (subSet (jfunction j p2) (jfunction j p1)) 
>                            then w else empty


list of helpers identified :  


> jhelper :: Set (Int, Int) -> Int -> Set Int
> jhelper r n = makeSet [ y | (x,y) <- flatten r, x == n]

> ifunction :: IKripke -> Char -> WKripke
> ifunction i c = makeSet [ k | (ch,k) <- flatten i, c == ch]

> compose       :: Set (Int, Int) -> Set (Int, Int) -> Set (Int,Int)
> compose r1 r2 = makeSet [ (x,z) | (x,y1) <- (flatten r1), (y2,z) <- (flatten r2), y1 == y2]

> jfunction       :: JKripke -> Prin -> Set (Int , Int)
> jfunction j (Name pr)        = makeSet [ (m,n) | (s, (m,n)) <- flatten j, s == pr]
> jfunction j (Together p1 p2) = union (jfunction j p1) (jfunction j p2)
> jfunction j (Quote p1 p2)    = compose (jfunction j p1) (jfunction j p2)



--------------------------------------------------------------------------------

Verification of em functions based on known examples
--------------------------------------------------------------------------------

We will denote the kripke structure in Example 2.8 as 

> m28 ::  (WKripke, IKripke, JKripke)
> m28 = (w28 , i28, j28)

> w28 :: WKripke 
> w28 = makeSet [0,1,2]

> i28 :: IKripke
> i28 =  makeSet [('q',0),('q',2),('r',1),('s',1),('s',2)]

> j28 :: JKripke
> j28 = makeSet [("Alice",(0,0)), ("Alice",(1,1)), ("Alice",(2,2)),
>              ("Bob",(0,0)), ("Bob",(0,1)), ("Bob",(1,2)), ("Bob",(2,1))
>              ]


represents 

Bob says (q ⊃ (r ∧ s))  (Example 2.16, ACST page 33) 

as a Formula

> f28 :: Form
> f28 = (Says (Name "Bob") f28p)

> f28p :: Form
> f28p = (Imply (Var 'q') (And (Var 'r') (Var 's')))

Recall:

type WKripke = Set Int


> translate28   :: Set Int -> Set String
> translate28 w =  makeSet [ n (x) | x <- flatten w ]

> n   :: Int -> String
> n k
>     | k == 0    = "w0"
>     | k == 1    = "w1"
>     | k == 2    = "w2"
>     | otherwise = "" 
