Utils ← &i "../utils.ua"
  ToString ← Utils "ToString"
  Helper ← Utils "Helper"
  H ← Utils "Helper"
  ReadLines ← Utils "ReadLines"
  ReadActual ← Utils "ReadActual"
  ReadSample ← Utils "ReadSample"

SplitBy! = |2.1 (
	part ^1 != dip.
)


RawLines ← ReadActual 2020 3

RawSample = $ ..##.......
			$ #...#...#..
			$ .#....#..#.
			$ ..#.#...#.#
			$ .#...##..#.
			$ ..#.##.....
			$ .#.#.#....#
			$ .#........#
			$ #.##...#...
			$ #...##....#
			$ .#..#...#.#

SampleLines = SplitBy! id @\n RawSample

# ParseLine = |2.1 (
#     row keep
# )


Sample ← rows keep length . SampleLines
Lines = rows keep length . rows unbox RawLines


# TrimDump = |0.0 dump try(rows take 10)(dip;)
TrimDump = |0.0 dump try(rows take 10)(dip;)

HardCodedPartTwo ← (
	# drop 1
	keep =0 mod2 range length .
	# TrimDump

	range length .

	rows pick

	=@#

	/+
)

PartOne ← (
	dipdip (. drop 1)

	* dip(+ )    dd(range length) 

	rows pick

	/+ =@#
)

PartTwo = (
	.
	# rows (PartOne uncouple) [ 1_1 3_1 5_1 7_1 1_2 ] fix
	rows (PartOne uncouple) [ 1_1 3_1 5_1 7_1 ] fix

	# PartOne 1 1
	HardCodedPartTwo :

	join :

	/*

	# assert $"`PartOne 1 2 Sample` should be 2" =2 .

	# fork (PartOne 1 1| PartOne 3 1| )
)

# keep (mod1 . range 10

PartTwo Sample
.
$"Wrong answer for: `PartTwo Sample`!\nshould be:\n\t336\nbut was:\n\t_"
assert : =336 :

PartTwo Lines
.
$"Wrong answer for: `PartTwo Lines`!\nshould be:\n\t2122848000\nbut was:\n\t_"
assert : =2122848000 :

# under now PartOne 3 1 Sample  
# under now PartOne Sample [1 3]
# under now PartOne Lines

# &p $"Seconds taken: _"
# &p $"Part 1:  _"

# under now PartTwo Sample
# under now PartTwo rows ParseLine Lines
# &p $"Seconds taken: _"
# &p $"Part 2: _"

&p "@@@@@@@@@@@@@@@ stack below @@@@@@@@@@@@@@@@"
