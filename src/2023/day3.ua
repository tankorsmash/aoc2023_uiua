Utils ← &i "../utils.ua"
  ToString ← Utils "ToString"
  Helper ← Utils "Helper"
  H ← Utils "Helper"
  ReadLines ← Utils "ReadLines"
  ReadActual ← Utils "ReadActual"
  ReadSample ← Utils "ReadSample"

# easier to type than ¯1
Neg = ¯1

Lines ← ReadSample 3
# Lines ← ReadActual 3

# SampleSubset = ⊏ +1⇡3 Lines
# ≡&p SampleSubset

Letters ← {"a" "b" "1" "2" "y" "9"}
Digits ← ≡(□$"_") ⇡ 10
NonDigits ← 123

# which elements of input are digit strings
IsDigit ← |1 /↥ ⍉ ≡(=Digits)

# pick1 Lines

# rows &p Lines
# ≡(/⊂ ∵°□ IsDigit °□) Lines

FindSymbols ← - ≡(⊃(/⊂ ∵°□ /⊂ ≡IsDigit °□|°□ ≠@.))

FindSymbols Lines


rows (reshape 3_1)  windows 3 Lines
