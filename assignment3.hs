{-
	Assignment3 
	Written by: Michael Schwarz Stuart Woodbury Neh Patel and Matthew Henry

        see Alternative.hs
-}
import System.Environment
import System.IO
import Data.List
import Control.Applicative
import Data.List.Split
import Alternative        --all the functions are in Alternative

main :: IO ()
main = 
     do
	args <- getArgs      --supposedly reads two arguments. error if user doesn't                           
        let students = read(head args) :: Int      
            grpsize = read(head $tail args) :: Int

        if checkmod students grpsize
           then
               do
               let a = combinations (students `div` grpsize) [1..students]
                   b = getUnique a
               if (length b) < 8 * (students `div` grpsize)
                  then putStrLn "it is impossible to group all the students in maximum group sizes for every assignment"
                  else
                 
           else
               do
                 putStrLn "Cannot pair up that many students in groups of that size all at once"
   
        


