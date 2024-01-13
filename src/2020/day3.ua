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

PartOne ← (
	dipdip (. drop 1)
	TrimDump

	* dip(+ )    dd(range length) 

	rows pick

	/+ =@#
)

PartTwo = (
	. drop 1
	*3 +1 range length

	rows pick

	/+ =@#
)

under now PartOne 3 1 Sample  
# under now PartOne Sample [1 3]
# under now PartOne Lines

# &p $"Seconds taken: _"
# &p $"Part 1:  _"

# under now PartTwo Sample
# under now PartTwo rows ParseLine Lines
# &p $"Seconds taken: _"
# &p $"Part 2: _"

&p "@@@@@@@@@@@@@@@ stack below @@@@@@@@@@@@@@@@"
