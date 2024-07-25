--------------------------------------------------------------------------------
4.8.1  Demonstration

       Demonstrate how to translate the specification of an access control 
       formula into an implementation (a recursive data type) via the Haskell 
       language. 
       
--------------------------------------------------------------------------------

--------------------
acl formulas
--------------------

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
>            | Says  Prin Form  -- Written as (Princ says Form) in ACST
>            | Contr Prin Form  -- Written as (Princ controls Form) in ACST
>            | For   Prin Prin  -- Written as  P ⇒ Q in ACST
>              deriving Show

% > f :: Form -> Form
% > f (Var x) = 
% > f (Not x) =
% > f (Or x y) =
% > f (And x y) =
% > f (Imply x y) =
% > f (Equiv x y) =
% > f (Says p x) =
% > f (Contr p x) =
% > f (For p q) =

------------------------------
Principal Expressions
------------------------------

> alice :: Prin
> alice = Name "Alice"

> bob :: Prin
> bob = Name "Bob"


> couple :: Prin
> couple = Together alice bob


> alicebob :: Prin
> alicebob = Quote alice bob  -- alice quoting the source bob



------------------------------
ACL formulas
------------------------------

ProVar consists of 'p', 'q' and 'r'

> p = (Var 'p')
> q = (Var 'q')
> r = (Var 'r')


> form1 :: Form
> form1 = Says bob p

> form2 :: Form
> form2 = Contr alice q


> form3 :: Form
> form3 = For alice bob


> form4 :: Form                  -- also a propositional formula
> form4 =  (And (Imply p q) r)






