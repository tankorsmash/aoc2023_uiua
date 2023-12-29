Utils ← &i "utils.ua"
  ToString ← Utils "ToString"
  Helper ← Utils "Helper"
  ReadLines ← Utils "ReadLines"
  ReadActual ← Utils "ReadActual"

# FileName ← "sample_input_day_1.txt"
# FileName ← "sample2_input_day_1.txt"
FileName ← "input_day_2.txt"

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
    ≡(⇌ SplitBy @ °□)
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

ParsedLines ← ≡( ParseLine) Lines

shape ParsedLines
&p $"shape of lines _"

SampleRow ← pick 51 ParsedLines
SampleBag ← pick1 unbox ⊡1 SampleRow
SampleColor ← ⊢ ⊢ SampleBag

# # # get the limit of green (13)
# GetMatchingColorLimit SampleColor
SampleRow
SampleBag

°□ SampleBag
≡(< : ⋕ °□ ⊢ ⇌ : GetMatchingColorLimitForColor ⊢ .)
# SampleColor
