Utils ← &i "../utils.ua"
  ToString ← Utils "ToString"
  Helper ← Utils "Helper"
  H ← Utils "Helper"
  ReadLines ← Utils "ReadLines"
  ReadActual ← Utils "ReadActual"
  ReadSample ← Utils "ReadSample"
  SplitBy! ← Utils "SplitBy!"
  TrimDump ← Utils "TrimDump"


RawLines ← ReadActual 2020 4

RawSample = $ ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
			$ byr:1937 iyr:2017 cid:147 hgt:183cm
			$
			$ iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
			$ hcl:#cfa07d byr:1929
			$
			$ hcl:#ae17e1 iyr:2013
			$ eyr:2024
			$ ecl:brn pid:760753108 byr:1931
			$ hgt:179cm
			$
			$ hcl:#cfa07d eyr:2025 pid:166559648
			$ iyr:2011 ecl:brn hgt:59in

SampleLines = SplitBy! box @\n RawSample

Sample ← rows keep length . SampleLines
Lines = rows keep length . RawLines

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

Example = $ line1 part1
		  $ line2 part1
		  $
		  $ newgroup1
		  $ newgroup2
		  $ newgroup3
		  $ newgroup4
		  $
		  $ third1
		  $ third2
		  $ third3

Example

part box +1 != @\n Example


!= 1 find box"\n\n" .
part box

# rows (under unbox (keep != @\n ?).)

first
unbox

.
= @\n
!= 1

H "outer"

# rows (under unbox (keep dipunbox))

# keep [1 1 1 1 1 1 1 1 1 1 1 ] "line1 part1"



&p "@@@@@@@@@@@@@@@ stack below @@@@@@@@@@@@@@@@\n"
