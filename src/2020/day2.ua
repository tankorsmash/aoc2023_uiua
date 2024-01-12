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


SampleLine = ParseLine "1-3 a: abcde" #actual sample
# SampleLine = ParseLine "1-3 a: abcdaeaa" #modified  sample


Sample ← rows ParseLine ⊜box≠@\n.RawSample

# parse a line like "1-3 a: abcde", means there's between 1 and 3 a's in the password
ValidPassword = (
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


	fork (dip id) (length where = dgi)
	gap (/min join fork (>=pick 0|<=pick 1))
)

PartOne ← (
	/+ rows ValidPassword
)

PartTwo = (

	rows (
		unbox pick 0 . unbox

		dip (pick 1)

		fork (unbox first pick 1 | unbox pic 0)
		:
		rows (= pick  dip unbox dip:  -1 )
		=1 /+
	)
	/+

)


# # under now PartOne Sample
# under now PartOne rows ParseLine Lines
# &p $"Seconds taken: _"
# &p $"Part 1:  _"

# under now PartTwo Sample
under now PartTwo rows ParseLine Lines
&p $"Seconds taken: _"
&p $"Part 2: _"

&p "---------------stack below --------"
