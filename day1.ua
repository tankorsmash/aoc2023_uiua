# a separator for printing
Separator ← ▽ 60 "-"
# turns 0 or 1 into "True" or "False"
IsTrue ← °□ ⊏ ⊙{"False" "True"} =1
# &p IsTrue 1

# a to-string function
ToString ← $"_"

# prints the stack but takes a string too
Helper  = |1.0;?


# FileName ← "sample_input_day_1.txt"
# FileName ← "sample2_input_day_1.txt"
FileName ← "input_day_1.txt"
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
# Line = "onetwothreefourfivesixseveneightnine"
# &pf "`Line`: "
# &p Line

AllStrings ← ♭ ⍉ ⊟ FullWords +1 ∵(□ToString) ⇡ 9
# &p AllStrings
# &p "`AllStrings`: "
# &p AllStrings

# index of matched string, with each character it lines up with
IndexLine ← ≡(⍜°□(⊚ ⌕) ⊙∘)
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
  ⇌
)

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

UnjoinDuplicateIndices ← (
  &p "!!! UnjoinDuplicateIndices !!!\n"
  ≡(
    ⧻⊢ ..
	# Helper "how many in duplicates"

	dipdip first
	# Helper "keep just the indices in one stack"

    ⊡1 :
	# Helper "the element to copy"
    ▽ :
	# Helper "the element duplicated"
	dip unbox
	# Helper "unboxed"
	:
    # ↻1⍉
	couple
	# rows (rotate1)
	trans
	# rows rotate1
	Helper "paired"
	# des
	box
	# ; :

  )


  # des
  # res ¯1_2

  Helper "after res"
)

PartTwoPerLine ← (
  ¤
  BuildFinalArray ⊃(EnumerateLine|IndexLine) AllStrings
  # keep only the non empty strings
  ▽ ≡(⧻ ⊢) .
  # &p "before"
  # &p .
  UnjoinDuplicateIndices
  # &p "after"
  # &p .
  # reshape 2_2_¯1

  # each deshape
  # fill 0 each unbox
  # reshape ¯1_2

  Helper "after"
  GetFirstLastStrings
  Helper "first and last"
  ≡(StringToNum °□)
  ♭ ∵ToString
  ⋕
  &p .
)

PartTwo ← (
  ∵(PartTwoPerLine °□)
  /+
)

# UnjoinDuplicateIndices [{ [1 1] "a" } { {} "b" } { 31 "c" } { 44 "d" } { 50 "e" }]

# PartTwo Lines
# PartTwo □ "eighthree"
# PartTwo □ "364twoqvqr4"
# PartTwo □ "33364twoqvqr444"
PartTwo □ "4445333"
# &p

# rows (deshape repeat . length uncouple ) fix { 1_2 "e" }
# rows (deshape repeat . length ? uncouple ? ) fix { 1_2 "e" }
# drop ? div2 len.deshape repeat , ? length . ? uncouple ?  { 1_2 "e" }
# drop ? 1 ? first {[ 1 2 ]}

# UnjoinDuplicateIndices [{{} "c" }{{0_0} "a"} {{1_2} "e"} {{3_4} "d"}]

# .
# rows (length first)
# keep .
