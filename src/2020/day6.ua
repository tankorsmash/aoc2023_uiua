Utils ~ "../utils.ua" ~ Helper ReadActual ReadLines ReadRawActual ReadRawSample ReadSample SplitBy! ToString TrimDump

H ← Helper

RawLines ← ReadActual 2020 6
RawActual ← ReadRawActual 2020 6
RawSample ← ReadRawSample 2020 6

# breaks lines into groups of \n\n
SplitInput ← (
  .
  ⌕ "\n\n"
  # replace first index with 1, so it is kept
  ⍜⊡ ◌ 0 : 1
  ⊜□ \+
  # replace all newlines with spaces
  ∵(⍜°□(⍜▽ ≡⋅∘ =, @\n : @ ))
  # split on spaces
  ∵(⍜°□ (⊜□ ≠@  .))
)
PartOne = (

	rows inv( /contentjoin rows (/contentjoin ))

	rows inv dedup
	/+ rows contentleng
	# /(contentjoin )
	# dedup
)

Alphabet = +@a range 26

PartTwo = (
	rows content(
		# calc which letters are in each group
		rows /* trans rows content ( (member Alphabet))
	) 
	/+
	/+

)

# SplitInput RawSample
SplitInput RawActual
# PartOne
PartTwo


# rows /* trans rows content ( (member Alphabet)) {"abc" "defa" "ad"}

&p "@@@@@@@@@@@@@@@ stack below @@@@@@@@@@@@@@@@\n"
