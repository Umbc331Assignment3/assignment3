import Data.List
import Control.Applicative



combinations :: Int -> [a] -> [[a]]
combinations 0 _ = [[]]
combinations n xs = [ xs !! i : x | i <- [0..(length xs)-1] 
                                  , x <- combinations (n-1) (drop (i+1) xs)]
firstpos xs = [x | x <- xs, head x == 1 ]
secondpos xs = [x | x <- xs, (head (tail x)) == 2 ]

showall xs = [y | x <- xs, y <-x, y ]

each xs stu = [checkindividual y stu | y <- x,x <-xs]

studentstruct ss = [(x,[x]) | x <- ss]  

fixstruct index student ss = do
	let (fh,_:sh) = splitAt (index - 1) ss
	fh ++ student : sh

checkindividual lookingfor currentstudent 
	|(elem lookingfor $ snd currentstudent )== True = True
	|otherwise = False




 

groupedTogether xs ys = [ y : ys | y <- xs, (not (elem y ys))]

--checkeach xs cur
--	| (length xs) == numbuniquegroups = xs
--	| [ | (a,b,_,_) <- xs, a != b]
--buildassignmnet xs = [x:[] | x <- xs ]

--eliminate xs
--	| (length xs) == numbuniquegroups/8 = xs
--	| 
--capture :: Ord => [a] -> [b] -> Int
capture xs ys = length [x | x <- xs,(not (elem x ys))]


x = combinations 4 [1..10]
--capture x []
