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

ParseBags ← (
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
□ "shaded blue bags contain 1 bright white bag."
box "muted yellow bags contain no other"
]

# SplitInput RawSample
# # SplitInput RawActual
# PartOne
# # PartTwo
ParseBags


ParseContents = (
	◇≡(
	  ≠□"no other"□.°□
	  ⍥(⍜⊡ (⋕) 0 (SplitBy!□ °□@\s))
	)
)

rows (couple fork  (pick 0 | boxParseContents pick 1))

first
pick 1
unbox
rows (drop1 /content join des rows join @\s ? drop 1)


&p "@@@@@@@@@@@@@@@ stack below @@@@@@@@@@@@@@@@\n"
