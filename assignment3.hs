import System.Environment
import System.IO
import Data.List


main = do
	args <- getArgs
	progName <- getProgName
	putStrLn head args
	putStrLn "Me dickin"
	putStrLn "Arguments"
	mapM putStrLn args
	putStrLn "Program name is:"
	putStrLn progName
