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

# list of boxed int 1 to boxed "one", and boxed string "1" to boxed "one"
WordsToNum ← (
  # numbers 1 to 9
  +1 ⇡ ⧻ FullWords
  # the string "1" to "9" and ints 1 to 9
  ⊃(∵(⊟ □ ToString .))(⍉ ⊟ FullWords)
  # couple them both
  ⊂
)
# WordsToNum

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
IndexLine ← ≡(⍜°□(⊚ ⌕) : Line)
# enumerate each character in the things to match
EnumerateLine ← ≡□ ⇡ ⧻

# lookup the index of each character in the line, then join them together
BuildFinalArray ← (
  ≡(⊡ : AllStrings °□)
  # couple the indices and the strings
  ⍉ ⊟
  # flip arrays so the index is first
  ≡↻ 1
)

BuildFinalArray ⊃(EnumerateLine|IndexLine) AllStrings

# gets the first and last string in a FinalArray we pass in
GetFirstLastStrings ← (
  # find nonempty rows
  ⊏ ⊚ ≡(⧻⊢) .
  # sort result
  ⊏ ⍏ .

  # pick first and last rows
  ⊢ .
  ⊙(⊡ -1 ⧻ .)
  ⊟

  ⍉
  ≡↻ 1
  ⇌

  # # take the index from the rows
  ♭ ⊢
)
GetFirstLastStrings

StringToNum ← (
  # first string in string, number pair
  ≡⊢ WordsToNum
  # index of arg1 inside the list of strings
  :
  ⍜□ ⊗
  # get the unboxed int from the string, number map
  ⊡ : WordsToNum
  °□ ⊢ ⇌
)

# &p WordsToNum

# StringToNum "one"
# StringToNum "nine"
# StringToNum "4"
# StringToNum "four"

?
≡(StringToNum °□)
