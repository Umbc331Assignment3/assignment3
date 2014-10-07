import System.Environment
import System.IO
import Data.List
import System.IO
import Data.List.Split
import MyModules


main :: IO ()
main = 
     do
	args <- getArgs
	progName <- getProgName
        let students = read(head args) :: Int       --now we can use ints!
        let grpsize = read(head $tail args) :: Int

        if checkmod students grpsize
           then putStrLn "do stuff"
                 
           else
               putStrLn "Can not group everyone up in groups that size"
   
        



