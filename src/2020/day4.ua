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
RawActual ← ReadRawActual 2020 4
RawSample ← ReadRawSample 2020 4

SubSample = $ ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
			$ byr:1937 iyr:2017 cid:147 hgt:183cm
			$ 



SampleLines ← SplitBy!□ @\n RawSample

Sample ← ≡▽ ⧻ . SampleLines
Lines ← ≡▽ ⧻ . RawLines

ParseEntry = (
	under unbox (SplitBy! box @: )
)

ParseInput ← (
  # ⊜□ +1 ≠ @\n .
  # ≠ 1 ⌕ □"\n\n" .
  # ⊜□

	.
	find "\n\n"

	partition box +1
	keep !=1 each ( length) .

  ≡(
    °□

    .
    = @\n
    ≠ 1
    ≡(⍜°□ (▽ ⊙°□))
    ▽ ≠0 ≡⧻.
	unpack /join

	SplitBy! box @ #
    □
  )

  rows (under unbox rows ParseEntry)
  # rows (box partition != 0 length.)
  
)

PartOne ← (
  ∘
)

PartTwo ← (
  ∘
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

# RawActual
RawSample
# SubSample

# ParseInput
# ⊜□ +1 ≠ @\n .

.
find "\n\n"

partition box +1
keep !=1 each ( length) .



rows (
keep : range length . find @\n . unbox

under pick (@ ;)
)



&p "@@@@@@@@@@@@@@@ stack below @@@@@@@@@@@@@@@@\n"
