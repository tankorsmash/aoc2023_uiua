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

SplitInput RawSample
# # SplitInput RawActual
# PartOne
# # PartTwo
# "light red bags contain 1 bright white bag, 2 muted yellow bags."

PartOne

# pick 4
# pick 1
# unbox
# first
# unbox
# under pick inv (part box not mask ".".) 1

&p "@@@@@@@@@@@@@@@ stack below @@@@@@@@@@@@@@@@\n"
