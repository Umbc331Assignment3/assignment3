import System.Environment
import System.IO
import Data.List
import Control.Applicative



{-
	Combinations gets all possible combinations of a list of numbers
-}
combinations :: Int -> [a] -> [[a]]
combinations 0 _ = [[]]
combinations n xs = [ xs !! i : x | i <- [0..(length xs)-1] 
                                  , x <- combinations (n-1) (drop (i+1) xs)]
          
{-
	firstpos gets the first list if the item is 1
-}                                 
firstpos xs = [x | x <- xs, head x == 1 ]

{-
	scondpos gets the first list with first item 2
-}  
secondpos xs = [x | x <- xs, (head (tail x)) == 2 ]

{-
	Print all the lists within combinations by taking them out of the list
-}
showall xs = [y | x <- xs, y <-x, y ]

{-
	
-}
each xs stu = [checkindividual y stu | y <- x,x <-xs]


{-
	creates a list of tuples containing an int and a 
	list of other ints meant to contain the student and
	the students it has been grouped with
-}
studentstruct ss = [(x,[x]) | x <- ss]  

{-
	
-}
fixstruct index student ss = do
	let (fh,_:sh) = splitAt (index - 1) ss
	fh ++ student : sh

{-
	
-}
checkindividual lookingfor currentstudent 
	|(elem lookingfor $ snd currentstudent )== True = True
	|otherwise = False




 

groupedTogether xs ys = [ y : ys | y <- xs, (not (elem y ys))]


capture xs ys = length [x | x <- xs,(not (elem x ys))]


x = combinations 4 [1..10]

--http://www.reddit.com/r/haskell/comments/1vras3/haskell_io_how_to_read_numbers/


main :: IO ()
main = 
     do
	args <- getArgs
	progName <- getProgName
        let students = read(head args) :: Int       --now we can use ints!
        let grpsize = read(head $tail args) :: Int
	putStrLn "The number of students are:"
        putStrLn students
        putStrLn "The group size is: "
        putStrLn grpsize
	putStrLn "Program name is:"
	putStrLn progName
        



