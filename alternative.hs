combinations :: Int -> [a] -> [[a]]
combinations 0 _ = [[]]
combinations n xs = [ xs !! i : x | i <- [0..(length xs)-1] 
                                  , x <- combinations (n-1) (drop (i+1) xs) ]

capture :: Ord => [a] -> [b] -> Int
capture xs ys = length [x | x<-cs, elem x ys]

