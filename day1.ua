# a separator for printing
Separator ← ▽ 60 "-"
# turns 0 or 1 into "True" or "False"
IsTrue ← °□ ⊏ ⊙{"False" "True"} =1
# &p IsTrue 1

# a to-string function
ToString ← $"_"

FileName ← "sample2_input_day_1.txt"
# raw input data
RawInput ← &fras FileName

# Joins strings together
StringJoin ← ⊐/⊂
# &p StringJoin {"RawInput, `" FileName "`:"}

# input split by newlines
Lines ← ⊜□≠RawInput@\n RawInput


# full english words
FullWords ← {
  "one" "two" "three"
  "four" "five" "six"
  "seven" "eight" "nine"}

# first line
First ← ⊏ 0 Lines

# boxed string 'one' in a list
One ← ↙ 1 FullWords
# unboxed string 'eight'
Eight ← °□ ⊏ 7 FullWords

# Single line in the input
Line ← °□ ⊏ 3 Lines
&pf "`Line`: "
&p Line

AllStrings ← ⊂ FullWords ∵(□ToString) ⇡ 9

# index of matched string, with each character it lines up with
IndexLine ← ≡(⍜°□(⊚ ⌕)⊙Line)
# enumerate each character in the things to match
EnumerateLine ← ≡□ ⇡ ⧻
# lookup the index of each character in the line
RetrieveString ← ≡(⊡ : AllStrings °□)

⊃(EnumerateLine|IndexLine) AllStrings
RetrieveString
# join previous two arrays together
⊟
⍉

# flip arrays so the index is first
≡↻ 1
