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



Sample ← ⊜⋕≠@\n.RawSample

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
