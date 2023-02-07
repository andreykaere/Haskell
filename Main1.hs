


main = do
  text <- getContents
  let m:n:_ = read <$> words text :: [Int]
  process m n



{-
process m n = loopOuter 0
  where 
    loopOuter i 
      | i < m = loopInner 0 >> loopOuter (i+1)
      | True  = pure ()
    
    loopInner j  
      | j < n = putStr "*" >> loopInner (j+1)
      | True  = putStrLn ""
-}

process m n = 
  let 
    picture = replicate m $ replicate n '*'
    actions = putStrLn <$> picture
  in sequence_ actions

--pic = replicate 4 $ replicate 5 '*'
--pic1 = replicate 4 . replicate 5 $ '*'
