$\frac{P\text{ says }\phi{}\space{}P\text{ conrols }\phi{}}{\phi{}}$

1. P says &phi; :: assumption
2. P controls &phi; :: assumption
3. (P says &phi;) &sup; &phi; :: 2, controls def
4. &phi; :: 1,3 Modus Ponens
5. &phi; :: 1,4 Says

$\frac{P\text{ says }(Q \text{ controls } \phi{})\space{}\space{}P|Q\text{ says }\phi{}}{P\text{ says }\phi{}}$

1. P says (Q controls &phi;) :: assumption
2. P|Q says &phi; :: assumption
3. P says Q says &phi; :: 2,quoting
4. P says ((Q says &phi;) &sup; &phi;) :: 1, controls def
5. P says &phi; :: 3,4 Modus Ponens


(&phi;1 &and; &phi;2) &and; &phi;3

prove

&phi;1 &and; (&phi;2 &and; &phi;3)
<!-- 
1. (&phi;1 &and; &phi;2) &and; &phi;3 :: assumption
2. &phi;1 &and; &phi;3 :: 1, simplification, taut
3. &phi;1 :: 2 simplification, taut -->

1. (&phi;1 &and; &phi;2) &and; &phi;3 :: assumption
2. &phi;1 &and; &phi;3  :: 1, taut (p &and; q) &sup; p
3. &phi;2 &and; &phi;3  :: 1, taut (p &and; q) &sup; q
4. (&phi;1 &and; &phi;2) &and; &phi;3 &sup; &phi;3 :: 1,2,3 taut
5. &phi;2 (&sup; &phi;3 &sup; (&phi;2 &and; &phi;3)) :: 2,3, taut p&sup;(q&sup;(p&and;q))
6. &phi;1 &sup; ((&phi;2 &and; &phi;3) &sup; (&phi;1 &and; (&phi;2 &and; &phi;3))) :: 5,2,3 taut p&sup;(q&sup;(p&and;q))
7. &phi;1 &and; (&phi;2 &and; &phi;3) :: 2,5 tuat