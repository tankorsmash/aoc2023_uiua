~ "../utils.ua" ~ Helper ReadActual ReadLines ReadSample ToString

H ← Helper

# easier to type than ¯1
Neg ← ¯1

Lines ← rows unbox ReadSample 2023 3
# Lines ← ReadActual 2023 3

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

FindSymbols ← - ≡(/⊂◇⊃(∵°□≡IsDigit)(≠@.))

# /content join Lines

# FindSymbols Lines
≡&p Lines

FlatArr ← /◇⊂ Lines
ColsAcross ← ◇⧻ ⊢ Lines


Lines
pick 0_0 Lines

ColsAcross

# ≡(↯ 3_1) ◫ 3 Lines
