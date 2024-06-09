Utils ~ "../utils.ua" ~ Helper ReadActual ReadLines ReadRawActual ReadRawSample ReadSample SplitBy! ToString TrimDump

H ← Helper

RawLines ← ReadActual 2020 7
RawActual ← ReadRawActual 2020 7
RawSample ← ReadRawSample 2020 7

# breaks lines into groups of \n\n
SplitInput ← (
  part box !=@\n .
  # rows inv(SplitBy!box "contains")
)
PartOne = (
id
)


PartTwo = (
	id

)

SplitInput RawSample
# # SplitInput RawActual
# PartOne
# # PartTwo
# "light red bags contain 1 bright white bag, 2 muted yellow bags."

rows (
	unbox
	keep =0 mask " bags" .
	keep =0 mask " bag" .
	part box not mask " contain ".
	?
	# under pick(inv part box un box!=@, .) 1
	under pick (box part box not (max fork (mask ", "| mask ".").) unbox) 1
)
# under pick inv (part box not mask ".".) 1

# rows /* trans rows content ( (member Alphabet)) {"abc" "defa" "ad"}

&p "@@@@@@@@@@@@@@@ stack below @@@@@@@@@@@@@@@@\n"
