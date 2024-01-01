Utils ← &i "utils.ua"
  ToString ← Utils "ToString"
  Helper ← Utils "Helper"
  H ← Utils "Helper"
  ReadLines ← Utils "ReadLines"
  ReadActual ← Utils "ReadActual"
  ReadSample ← Utils "ReadSample"

Lines ← ReadSample 3
# Lines ← ReadActual 3

# SampleSubset = ⊏ +1⇡3 Lines
# ≡&p SampleSubset

Letters ← {"a" "b" "1" "2" "y" "9"}
Digits ← ≡(□$"_") ⇡ 10

#which elements of input are digit strings
IsDigit ← |1 /↥ ⍉ ≡(=Digits)

IsDigit Letters

unpack/join keep : Letters

# fork(=@1|=@2) Letters
