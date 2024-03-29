Utils ← &i "../utils.ua"
  ToString ← Utils "ToString"
  Helper ← Utils "Helper"
  H ← Utils "Helper"
  ReadLines ← Utils "ReadLines"
  ReadActual ← Utils "ReadActual"
  ReadSample ← Utils "ReadSample"

# Lines ← ReadLines FileName
Lines ← ReadActual 2

SplitBy ← |2 (
  ⊜□≠,
)

MaxRed ← 12
MaxGreen ← 13
MaxBlue ← 14

Limits ← [{"green" MaxGreen}
          {"red" MaxRed}
          {"blue" MaxBlue}]

ParseGameCount ← (
  °□
  SplitBy @ # space
  # get second element (boxed string of game count)
  ↘ 1
  # flatten,parse and take just the number
  ⊢ ⋕ ♭
)

ParseBag ← (
  ⍜°□ (
    °□ SplitBy @,
    ≡(⇌ ⍜(⊏0) ⋕ SplitBy @ °□)
  )
)

# return game count and the bags in a pair of arrays
ParseLine ← (
  °□
  SplitBy @:
  ParseGameCount ⊢.
  # &p "Game Count: "
  # &p .
  □
  :
  ↘ 1

  ⊢
  °□
  SplitBy @;
  ≡ParseBag
  # &p "Bags: "
  # ∵&p .
  □
  ⊟
  ↻1
)

# get which limit matches the color
GetMatchingLimitRowForColor ← |1 (
  # ⊢ ▽ ≡⊢ ⌕ ..Limits
  # ⊢ ▽ ≡⊢ ⌕ .Limits "green" ;
  ⊢ ▽ : Limits ⌕ : ⊢ ⍉ Limits
)

# GetMatchingLimitRow □ "blue"

GetMatchingColorLimitForColor ← (
  °□ ⊡1 GetMatchingLimitRowForColor
)

IsValidBag ← (
  °□
  /↧ ≡(≤ : ⋕ °□ ⊢ ⇌ : GetMatchingColorLimitForColor ⊢ .)
)

IsValidRow ← (
  /↧ ≡IsValidBag °□ ⊡1
)

ParsedLines ← ≡(ParseLine) Lines
ParsedSamples ← ≡(ParseLine) ReadSample 2

SampleRow ← ⊡ 50 ParsedLines
SampleBags ← °□ ⊡1 SampleRow
SampleBag ← ⊡1 SampleBags
SampleColor ← ⊢ ⊢ SampleBag

# # # get the limit of green (13)
# GetMatchingColorLimit SampleColor
# SampleRow
#
# Sa pleColor

PartOne ← (
  ≡IsValidRow .
  ≡⊢ ▽
  /+
)
# PartOne ParsedLines

FilterByColor ← |3 ⍜°□ (▽ ⊙°□ ≡/↥ =□ ⊙°□)

PartTwo ← (
  ≡(
    # take the bags for the row
    °□ ⊡1
    # get the colors of each bag
    ⍉ ≡(≡FilterByColor {"red" "green" "blue"}).
    # get the minimum of each color
    ≡(/↥ ≡(°□ ⬚0 ⊡ 0_1 °□))
    # multiply together
    /×
  )

  # sum up all the multiplications
  /+
)
PartTwo ParsedLines
