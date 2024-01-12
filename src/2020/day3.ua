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


PartOne ← (
	. drop 1
	*3 +1 range length

	rows pick

	/+ =@#
)

PartTwo = (
	id
)


# row repeat length .  [ "a1z" "b2y" "c3x" ]
# row keep  length .  [ "a1z" "b2y" "c3x" "d4w" ]




# under now PartOne Sample
under now PartOne Lines
&p $"Seconds taken: _"
&p $"Part 1:  _"

# under now PartTwo Sample
# under now PartTwo rows ParseLine Lines
# &p $"Seconds taken: _"
# &p $"Part 2: _"

&p "---------------stack below --------"
