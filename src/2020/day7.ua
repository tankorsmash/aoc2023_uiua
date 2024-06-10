Utils ~ "../utils.ua" ~ Helper ReadActual ReadLines ReadRawActual ReadRawSample ReadSample SplitBy! ToString TrimDump

H ← Helper

RawLines ← ReadActual 2020 7
RawActual ← ReadRawActual 2020 7
RawSample ← ReadRawSample 2020 7

# breaks lines into groups of \n\n
SplitInput ← (
  ⊜□ ≠@\n .
  # rows inv(SplitBy!box "contains")
)

PartOne ← (
  ≡◇(
    ▽=0 (/↥ [⊃(⦷" bags"|⦷ " bag"|⦷ ".")]) . # strip " bags" and " bag"
    ⊜□=0 ⦷" contain ".                      # split into bag name and contents
    ⍜⊡ ⍚(⊜□ =0 ⦷ ", " .) 1                  # break contents into individual bags
  )
)

PartTwo ← (
  ∘
)

[
box "light red bags contain 1 bright white bag, 2 muted yellow bags." 
□ "light red bags contain 1 bright white bag."
box "light red bags contain no other"
]

# SplitInput RawSample
# # SplitInput RawActual
# PartOne
# # PartTwo
PartOne


ParseContents = (
	⊡ 1
	◇≡(
	  ≠□"no other"□.°□
	  ⍥(⍜⊡ (⋕) 0 (SplitBy!□ °□@\s))
	)
)

rows (boxParseContents)

&p "@@@@@@@@@@@@@@@ stack below @@@@@@@@@@@@@@@@\n"
