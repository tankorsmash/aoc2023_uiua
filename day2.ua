Utils ← &i "utils.ua"
  ToString ← Utils "ToString"
  Helper ← Utils "Helper"
  ReadLines ← Utils "ReadLines"
  ReadActual = Utils "ReadActual"

# FileName ← "sample_input_day_1.txt"
# FileName ← "sample2_input_day_1.txt"
FileName ← "input_day_2.txt"

# Lines ← ReadLines FileName
Lines ← ReadActual 2

SplitBy ← |2 (
  ⊜□≠,
)

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
    ≡(SplitBy @ °□)
  )
)

ParseLine ← (
  °□
  SplitBy @:
  ParseGameCount ⊢.
  &p "Game Count: "
  &p .
  :
  ↘ 1

  ⊢
  °□
  SplitBy @;
  ≡ParseBag
  &p "Bags: "
  ∵&p .
)

MaxRed = 12
MaxGreen = 13
MaxBlue = 14

ParseLine ⊢ Lines

