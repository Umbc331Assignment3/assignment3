{-
	Takes list of total students [1..howevermany]
	Outputs a list of tuples first element being the student ID number
	Second being a list
	for storing the students already been grouped with
-}
--studentstruct :: Int => [Int] -> StudentStruct
studentstruct :: [t] -> [(t, [t])]
studentstruct ss = [(x,[x]) | x <- ss]

type StudentStruct = [(Int,[Int])]

{-
	Short and stupid function to allow inplace element manipulation
	for a list Not the most elegant but it does what it needs
	Index value starts at 1 not zero so studentId value 1 will give you 
	the first student
-}
fixstruct :: Int -> a -> [a] -> [a]
fixstruct index student ss = do
	let (fh,_:sh) = splitAt (index - 1) ss
	fh ++ student : sh 
					
{-
	s = the student to add
	curstu = the tuple  where first element is the student id
	and the second element is the list of already grouped students
-}
addstudent :: a -> (t, [a]) -> (t, [a])
addstudent s curstu = head [ (y, s:g x) | let x = snd curstu , let y = fst curstu]

outputlist :: Int -> [[Int]]
outputlist numgroup =  map (drop 1) (map (:[]) [1..(numgroup)])


						
{-
	Updates the current list of already grouped 
	used for generating groups for assignment
	n = the student id to remove
	l = the list of students not yet grouped
-}
updategroupedlist :: Eq a => a -> [a] -> [a]
updategroupedlist n l = filter (not . (==n)) l 

{-
	studentstruct !! number gives you currentstudent 
	looking for is the student to check for
	returns true if student has already been grouped with this student
	otherwise will add student to group
	TODO needs to the update grouped already list
-}
checkindividual :: Eq a => a -> (t, [a]) -> Either (t, [a]) Bool
checkindividual lookingfor currentstudent = 
	case elem lookingfor $ snd currentstudent of
		True -> Right True
		False -> Left $ addstudent lookingfor currentstudent

{-
altcheckind lookingfor currentstudent = 
	(if elem lookingfor $ snd currentstudent
		then do {
				return
				}
		else
			do { 
				addstudent lookingfor currentstudent
				}
-}

--TODO make output True for true conidtion
--Checks if the total number of students can be split into said group size
checkmod :: (Integral a, Show a) => a -> a -> IO ()
checkmod x y = ( if mod x y == 0 
	then putStrLn "True" 
	else putStrLn $"Cannot pair up " ++ 
	(show x) ++ " students into groups of " 
	++ show(y) ++ " across eight assignments")
{-
	should iterate entire list of students
	call checkindividual lfor = student to look for
	x is just the size of list
-}
checkall :: Eq a => [(t, [a])] -> a -> [Either (t, [a]) Bool]
checkall students lfor = [ checkindividual lfor (students !! index )| index <- [1..((length students )-1)]]

{-
	Keep running till current group size is filled
	lookingfor
-}
--groupstudent lookingfor currentstudent gl= do
--										addstudent lookingfor currentstudent
--										updategroupedlist lookingfor gl



--groupassignment ss y = do
							--let notgrouped = [1..(length ss)]					
							--						



program x y = do
	let ss = studentstruct [1..x]
	checkmod x y --last statement must be expression in so haskell doesnt bitch
	--groupassignment ss y			






