module Bar1 where

data Date = Date Year Month Day
  deriving(Show)

data Year = Year Int
  deriving(Show)

data Month = January   | February | March    | April 
           | May       | June     | July     | August 
           | September | October  | November | December
  deriving(Show)

data Day = Day Int
  deriving(Show)


data Week = Monday   | Tuesday | Wednesday
          | Thursday | Friday  | Saturday
          | Sunday

data Time = Time Hour Minute Second

data Hour   = Hour Int
data Minute = Minute Int 
data Second = Second Int 

