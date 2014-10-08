import System.Environment
import System.IO
import Data.List
import Control.Applicative



{-
	Combinations gets all possible combinations of a list of numbers
	http://www.haskell.org/haskellwiki/99_questions/Solutions/26
	"99 Questions/Solutions/26." - HaskellWiki. N.p., n.d. Web. 07 Oct. 2014.
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
	creates a list of tuples containing an int and a 
	list of other ints meant to contain the student and
	the students it has been grouped with
-}
studentstruct ss = [(x,[x]) | x <- ss]  

{-
	Remakes the studentstruct so that it is recreated
	essentially the fix for not being able to pass by reference
-}
fixstruct index student ss = do
	let (fh,_:sh) = splitAt (index - 1) ss
	fh ++ student : sh

{-
	studentstruct !! number gives you currentstudent 
	looking for is the student to check for
	returns true if student has already been grouped with this student
	otherwise will add student to group
	TODO needs to the update grouped already list
-}
checkindividual lookingfor currentstudent 
	|(elem lookingfor $ snd currentstudent )== True = True
	|otherwise = False



{-
	Checks if the total number of students can be split into said group size
-}
checkmod :: Int -> Int -> Bool
checkmod x y 
       | mod x y == 0 = True
       | otherwise = False
 
{-
	capture retrieves a list within another list if the element is in the first list
-}
capture xs ys = length [x | x <- xs,(not (elem x ys))]


--http://www.reddit.com/r/haskell/comments/1vras3/haskell_io_how_to_read_numbers/


main :: IO ()
main = 
     do
	args <- getArgs
	progName <- getProgName
        let students = read(head args) :: Int       --now we can use ints!
        let grpsize = read(head $tail args) :: Int

        if checkmod students grpsize
           then
               listGen (splitList students grpsize) [1..students] grpsize
                 
           else
               do
                 putStrLn $"Cannot pair up " ++ 
		show(students) ++ " students into groups of " 
		++ show(grpsize) ++ " across eight assignments"
   
        


