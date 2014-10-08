type StudentStruct =  [(Integer,[Int])]
{-
	Takes list of total students [1..howevermany]
	Outputs a list of tuples first element being the student ID number
	Second being a list
	for storing the students already been grouped with
-}
--studentstruct :: Int => [Int] -> StudentStruct
studentstruct :: [Integer] -> StudentStruct
studentstruct ss = [(x,[x]) | x <- ss]



{-
	Short and stupid function to allow inplace element manipulation
	for a list Not the most elegant but it does what it needs
	Index value starts at 1 not zero so studentId value 1 will give you 
	the first student
-}
--fixstruct :: Integer -> a -> [a] -> [a]
fixstruct index student ss = do
	let (fh,_:sh) = splitAt (index - 1) ss
	fh ++ student : sh 
					
{-
	s = the student to add
	curstu = the tuple  where first element is the student id
	and the second element is the list of already grouped students
-}
--addstudent :: a -> (t, [a]) -> (t, [a])
addstudent s curstu = head [ (y, s: x) | let x = snd curstu , let y = fst curstu]


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

---------------------------------------------------------------------------------

--outputlist :: Integer -> [[Integer]]
outputlist numgroup =  map (drop 1) (map (:[]) [1..(numgroup)])

addoutputlist groupindex stuId outlist = do
	let x = stuId :(outlist !! groupindex)
	let (fh,_:sh) = splitAt (groupindex - 1) outlist
	fh ++ x : sh 
	

--checkisinoutputlist :: StudentStruct -> Int -> [Int] -> Bool
checkisinoutputlist ss curstu ol 
	|(elem curstu ol) = True
    |otherwise = False

---------------------------------------------------------------------------------

--checkoutputlist ss curstu ol

{-
	TODO: Or these guys together
	One True will make this student not able to add to this group
-}
checkgrouplist gl studenttuple =[ checkindividual x studenttuple |  x <- gl ]
						
{-
	Updates the current list of already grouped 
	used for generating groups for assignment
	n = the student id to remove
	l = the list of students not yet grouped
-}
updateNotGroupedList :: Eq a => a -> [a] -> [a]
updateNotGroupedList n l = filter (not . (==n)) l 
---------------------------------------------------------------------------------

fillgroup ol grpsize = (if (length ol) == grpsize
						then 




--TODO make output True for true conidtion
--Checks if the total number of students can be split into said group size
checkmod :: (Integral a, Show a) => a -> a -> IO ()
checkmod x y = ( if mod x y == 0 
	then putStrLn "True" 
	else putStrLn $"Cannot pair up " ++ 
	(show x) ++ " students into groups of " 
	++ show(y) ++ " across eight assignments")
addAction
  :: Monad m =>
     [(t, [Int])] -> (t, [Int]) -> Int -> [Int] -> a -> m a

addAction ss studTup stuId notgroupedlist= do
	let newnotgroupedlist = updateNotGroupedList stuId notgroupedlist
	let tempTup = addstudent stuId studTup
	let newSS = fixstruct stuId tempTup ss
	return


--addAction x (2,[2]) 1 y	



