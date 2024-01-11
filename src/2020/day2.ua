Utils ← &i "../utils.ua"
  ToString ← Utils "ToString"
  Helper ← Utils "Helper"
  H ← Utils "Helper"
  ReadLines ← Utils "ReadLines"
  ReadActual ← Utils "ReadActual"
  ReadSample ← Utils "ReadSample"

Lines ← ReadActual 2020 2

RawSample = $ 1-3 a: abcde
			$ 1-3 b: cdefg
			$ 2-9 c: ccccccccc

SplitBy! = |2.1 (
	part ^1 != dip.
)

ParseLine = (
    unbox
	# rule and password
	# part box !=@:.
	SplitBy! box @:

	# drop leading space in password
	under pick (under unbox (drop1) ) 1

	under pick (
		# split rule into min-max range, and letter
		under unbox (
			SplitBy! box @ #deliberate space
			under pick (
				# split min-max range into min and max
				under unbox (SplitBy! parse @- )
			) 0
		)
	) 0
)


SampleLine = ParseLine "1-3 a: abcde"


Sample ← rows ParseLine ⊜box≠@\n.RawSample

PartOne ← (
	id
)


PartTwo = (
	id
)

SampleLine
&p "--parse single sample line--"
&p .
&p "done"



# length where =@a "abaa"

fork(
	pick 0
	unbox
	fork(
		#character
		pick 1
		unbox
	|
		# range
		unbox pick 0
	)
|
	# password
	pick 1
	unbox
)





# fork (dip gap id) (H "fork" H H)
# fork (dip gap id) (length  where = H"fork") @a 123 "aabcad"
# forkfork (dip id) (dipid) (length  where = H"fork") @a 123 "aabcad"
fork (dip id) (&p $"num matches: _" . length where = dgi) #@f 123 "aabcad"
# {fork (dip gap id) (|2 &p . &p "length:" length  where = )} @a "abcd"

# {fork (dip gap id) join} "ab" "DONT JOIN ME" "cd"

# TODO: count the letters in the password
# TODO: figure out if min and 


# Sample
# &p "--parse entire sample--"
# &p .



# under now PartOne Sample
# under now PartOne rows parse Lines
# &p $"Seconds taken: _"
# &p $"Part 1:  _"

# under now PartTwo Sample
# under now PartTwo rows parse Lines
# &p $"Seconds taken: _"
# &p $"Part 2: _"
