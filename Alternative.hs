module Alternative where
import Data.List
import Control.Applicative


{-
	Alternative.hs 
	Written by: Michael Schwarz Stuart Woodbury Neh Patel and Matthew Henry
     
        see Assignment3.hs

-}


{-returns a double list of all size n combinations of list xs-}
combinations :: Int -> [a] -> [[a]]
combinations 0 _ = [[]]
combinations n xs = [ xs !! i : x | i <- [0..(length xs)-1] 
                                  , x <- combinations (n-1) (drop (i+1) xs)]

{-captures all groups with no two groups having students grouped more than once-}
reOccurances:: (Ord a) => [a] -> [a] -> Int
reOccurances xs ys
        | length xs == 0 = 0
        | length ys == 0 = 0
        | otherwise = length [x|x <- xs, elem x ys]

{-returns a list of all unique groupings
 TODO fix type error-}
getUnique :: [[Int]] -> [[Int]]
getUnique xs
          | length xs == 0 = [[]]
          | otherwise = do
            let x = head xs
            let y = tail xs
            return x : [z | z <- y, (reOccurances x z ) < 2] : [[]]

{-
	Checks if the total number of students can be split into said group size
-}
checkmod :: Int -> Int -> Bool
checkmod x y 
       | mod x y == 0 = True
       | otherwise = False
