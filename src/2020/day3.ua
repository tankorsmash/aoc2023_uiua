Utils ← &i "../utils.ua"
  ToString ← Utils "ToString"
  Helper ← Utils "Helper"
  H ← Utils "Helper"
  ReadLines ← Utils "ReadLines"
  ReadActual ← Utils "ReadActual"
  ReadSample ← Utils "ReadSample"

Lines ← ReadActual 2020 3

RawSample = $ ..##.........##.........##.........##.........##.........##.......
			$ #...#...#..#...#...#..#...#...#..#...#...#..#...#...#..#...#...#..
			$ .#....#..#..#....#..#..#....#..#..#....#..#..#....#..#..#....#..#.
			$ ..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#
			$ .#...##..#..#...##..#..#...##..#..#...##..#..#...##..#..#...##..#.
			$ ..#.##.......#.##.......#.##.......#.##.......#.##.......#.##.....
			$ .#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#
			$ .#........#.#........#.#........#.#........#.#........#.#........#
			$ #.##...#...#.##...#...#.##...#...#.##...#...#.##...#...#.##...#...
			$ #...##....##...##....##...##....##...##....##...##....##...##....#
			$ .#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#

SplitBy! = |2.1 (
	part ^1 != dip.
)

ParseLine = (
    id
)


SampleLine = ParseLine "1-3 a: abcde" #actual sample
# SampleLine = ParseLine "1-3 a: abcdaeaa" #modified  sample

Sample ← rows ParseLine SplitBy! id @\n RawSample

PartOne ← (
	id
)

PartTwo = (
	id
)


# under now  id Sample
Sample
# under now PartOne rows ParseLine Lines
# &p $"Seconds taken: _"
# &p $"Part 1:  _"

# under now PartTwo Sample
# under now PartTwo rows ParseLine Lines
# &p $"Seconds taken: _"
# &p $"Part 2: _"

&p "---------------stack below --------"
