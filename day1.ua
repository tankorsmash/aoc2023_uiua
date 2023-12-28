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

# &p "Lines from RawInput:"
# &p Lines

# # must be a more elegant way of take1 and rev take 1 without all the stack manipulation
# PerLine ← ;: parse under rev (join take 1),take1.keep<@a.
# PartOne ← /+ rows (PerLine unbox) Lines
# 
# &p "Part One:"
# &p PartOne

# full english words
FullWords ← {
  "one" "two" "three"
  "four" "five" "six"
  "seven" "eight" "nine"}

# first line
First ← ⊏ 0 Lines

# window 6 unbox First

# boxed string 'one' in a list
One ← ↙ 1 FullWords
# unboxed string 'eight'
Eight ← °□ ⊏ 7 FullWords

# &p " first:"
# &p First
# &p length Eight

UnbFirst ← °□ First
LenEight ← ⧻ Eight
WinFirst ← ◫ LenEight UnbFirst
WinSecond ← ◫ LenEight °□ ⊏ 1 Lines

# # takes a word and returns whether its in a specific line
# LineContainsString ← (
#   # get the windows of the length of the word passed in
#   ◫ ⧻ ,
#   ¤ :
#   /+ ≡(≍ ⊙.)
# 
#   # clean up the stack at the end, since there's an array left
#   ;:
# )

# &p IsTrue LineContainsString "four"

# lookup a single line in input lines list

# Single line in the input
Line ← °□ ⊏ 3 Lines
&pf "`Line`: "
&p Line

AllStrings ← ⊂ FullWords ∵(□ToString) ⇡ 9

# index of matched string, with each character it lines up with
≡(⍜°□(⊚ ⌕)⊙Line) AllStrings
# enumerate each character in the things to match
≡□ ⇡ ⧻ AllStrings
# lookup the index of each character in the line
≡(⊡ °□ : AllStrings)
⊟
⍉

# flip arrays so the index is first
≡↻ 1

Left ← ≡(□ +1 ⇡) +1 ⇡ 9
# Left

LongestRow ← /↥ ≡⧻ Left
# LongestRow

# ∵ToString ⇡ LongestRow

# Right = rows (reverse) Left
# # &p "left columns"
# # &p Left
# #
# # &p "right columns"
# # &p Right

# # &p "left sum"
# # &p /+ rows (parse /join rows ToString unbox) Left
# # &p "right sum"
# # &p /+ rows (parse /join rows ToString unbox) Right
