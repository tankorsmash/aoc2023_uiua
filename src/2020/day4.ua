Utils ← &i "../utils.ua"
  ToString ← Utils "ToString"
  Helper ← Utils "Helper"
  H ← Utils "Helper"
  ReadLines ← Utils "ReadLines"
  ReadActual ← Utils "ReadActual"
  ReadRawActual ← Utils "ReadRawActual"
  ReadSample ← Utils "ReadSample"
  ReadRawSample ← Utils "ReadRawSample"
  SplitBy! ← Utils "SplitBy!"
  TrimDump ← Utils "TrimDump"


RawLines ← ReadActual 2020 4
RawActual = ReadRawActual 2020 4
RawSample = ReadRawSample 2020 4


SampleLines = SplitBy! box @\n RawSample

Sample ← rows keep length . SampleLines
Lines = rows keep length . RawLines


ParseInput = (
	part box +1 != @\n .
	!= 1 find box"\n\n" .
	part box

	rows (
		unbox

		.
		= @\n
		!= 1
		rows (under unbox (keep dipunbox))
		keep !=0 rows length.
		box
	)

	# under unbox id
	H"rows"
)

PartOne ← (
	id
)

PartTwo = (
	id
)

# answer for part 1 (sample) is : 2
# answer for part 1 (actual) is : 233

# PartTwo Sample
# .
# $"Wrong answer for: `PartTwo Sample`!\nshould be:\n\t336\nbut was:\n\t_"
# assert : =336 :
#
# PartTwo Lines
# .
# $"Wrong answer for: `PartTwo Lines`!\nshould be:\n\t2122848000\nbut was:\n\t_"
# assert : =2122848000 :

# under now PartOne 3 1 Sample
# under now PartOne Sample [1 3]
# under now PartOne Lines

# &p $"Seconds taken: _"
# &p $"Part 1:  _"

# under now PartTwo Sample
# under now PartTwo rows ParseLine Lines
# &p $"Seconds taken: _"
# &p $"Part 2: _"

# Example
# RawSample
RawActual


ParseInput

rows &p .





&p "@@@@@@@@@@@@@@@ stack below @@@@@@@@@@@@@@@@\n"
