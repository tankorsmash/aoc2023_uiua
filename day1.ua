Utils ← &i "utils.ua"
  ToString ← Utils "ToString"
  Helper ← Utils "Helper"
  ReadLines ← Utils "ReadLines"
  ReadActual = Utils "ReadActual"

# FileName ← "sample_input_day_1.txt"
# FileName ← "sample2_input_day_1.txt"
FileName ← "input_day_1.txt"

Lines ← ReadActual 1

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

AllStrings ← ♭ ⍉ ⊟ FullWords +1 ∵(□ToString) ⇡ 9

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

UnjoinDuplicateIndices ← |1 (
  ≡(
    # take the first element of the list and the second,
    #  and get length of first element
    ⊃(⧻⊢|⊡1|°□⊢)
    # duplicate the character for each index and pair them
    ⊟ ▽

    # instead of a column, make it a row iwth the index first
    ≡↻1⍉
    □
  )

  ⊐/⊂
)

OrigUnjoinDuplicateIndices ← |1 (
  &p .
  ≡(
    ..
    ⧻⊢
    # Helper "how many in duplicates"

    ⊙⊙⊢
    # Helper "keep just the indices in one stack"

    ⊡1 :
    # Helper "the element to copy"

    ▽ :
    # Helper "the element duplicated"
    ⊙°□
    # Helper "unboxed"
    :
    ⊟
    ⍉
    # Helper "paired"
    □
  )
  ⊐/⊂
  &p .
)

PartTwoPerLine ← |1 (
  ¤
  BuildFinalArray ⊃(EnumerateLine|IndexLine) AllStrings

  # duplicate rows per number of indices
  ▽ ≠0 ≡(⧻⊢) .

  # &p "before"
  # &p .

  UnjoinDuplicateIndices

  # &p "after"
  # &p .

  # Helper "asd"
  # Helper "after"

  GetFirstLastStrings
  # Helper "first and last"

  ≡(StringToNum °□)
  ♭ ∵ToString
  ⋕
)

PartTwo ← (
  # &pf "input string is: "
  # &p .
  ∵(PartTwoPerLine °□)
  /+

  &pf "result is: "
  &s .
)

# UnjoinDuplicateIndices [{ [1 1] "a" } { {} "b" } { 31 "c" } { 44 "d" } { 50 "e" }]

# PartTwo Lines
# example lines to test
# PartTwo □ "eighthree"
# PartTwo □ "364twoqvqr4"
# PartTwo □ "33364twoqvqr444"
# PartTwo □ "4445333"

Data ← [[□[4 5 6] □"3"]
        [□[1 2] □"4"]
        [□[3] □"5"]]

UnjoinDuplicateIndices Data

# DataTwo ← [□[1 2] □3]
# 
# # # version 1
# # DataTwo
# # ..
# # ⧻⊢
# # ⊙⊙⊢
# # ⊡1 :
# #
# # # version 2
# # fork (pick 1|⧻ ⊢|⊢) DataTwo
# 
