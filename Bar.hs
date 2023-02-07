module Bar where

isPrime n 
  | n < 2 = False
  | True  = isPrimeLoop 2 n

isPrimeLoop k n
  | k*k > n        = True
  | n `mod` k == 0 = False
  | True           = isPrimeLoop (k+1) n
