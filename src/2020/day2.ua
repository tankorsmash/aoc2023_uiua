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


ParseLine = (
    unbox
	# rule and password
	part box !=@:.

	# drop leading space in password
	under (pick) (under unbox (drop1) ) 1

	under pick (
		# split rule into min-max range, and letter
		under unbox (
			part box !=@ .
			under pick (
				# split min-max range into min and max
				under unbox (part parse !=@- .)
			) 0
		)
	) 0
)


SampleLine = ParseLine "1-3 a: abcde"
SampleLine
&p "--parse single sample line--"
&p .


Sample ← rows ParseLine ⊜box≠@\n.RawSample
Sample
&p "--parse entire sample--"
&p .

PartOne ← (
	id
)


PartTwo = (
	id
)


# under now PartOne Sample
# under now PartOne rows parse Lines
# &p $"Seconds taken: _"
# &p $"Part 1:  _"

# under now PartTwo Sample
# under now PartTwo rows parse Lines
# &p $"Seconds taken: _"
# &p $"Part 2: _"
