--------------------------------------------------------------------------------
4.5.2  Caesar Ciphers: Implementation and Cryptanalysis 

       Walk thru. an implementation of Caesar Cipher (cipher.hs, Hutton ch.5)
       to review the basic operations with strings and lists and the use of 
       list (string) comprehensions.
 
       Give examples (tests) to demonstrate the testing of the given cipher.

--------------------------------------------------------------------------------

> import Data.Char

a.  walk thru. of the file cipher.hs


b. Demonstration

> displayVowels     :: String -> [Int]
> displayVowels str = [i | (c,i) <- zip str [0..] , elem c ("aeiou" ++ "AEIOU") ]


c. Sample Test(s) 


execute for different strings str and integers k in the file cipher.hs

same str k = (encode (-k) (encode (k) str) == str)







