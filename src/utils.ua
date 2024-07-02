# a separator for printing, taking in a string to print
SeparatorFmt ← (
  ÷ 2 ⧻.         # half width of separator string
  -2 ⌈ ÷2 ⊡1 &ts # half terminal width
  : ⌈ - :

  &pf "{" # print it out
  ⊙: ⊙⊙. "|"
  &pf ▽ :
  "|" &pf
  &pf ▽ :
  &p "}"
)

# a separator for printing
Separator ← (
  SeparatorFmt "SEP"
)

Separator
SeparatorFmt ⍥(⊂ @a) 10 ""
SeparatorFmt ⍥(⊂ @b) 20 ""
SeparatorFmt ⍥(⊂ @c) 30 ""

# turns 0 or 1 into "True" or "False"
# &p IsTrue 1
IsTrue ← °□ ⊏ ⊙{"False" "True"} =1

# a to-string function
ToString ← $"_"

# prints the stack but takes a string too
Helper ← ◌?

# prints the top value and a value to print
Trace ← ⸮ ◌ ⸮

# Joins strings together
StringJoin ← ◇/⊂

# read lines of a file
# then split by newlines and box
ReadLines ← |1 (
  # read file
  ⍣&fras (Helper$"cant read file: _" .)

  ⊜□≠@\n .
)

# ReadActual ← (
#   °⋕
#   ⊐/⊂{"inputs/actuals/day_" flip ".txt"}
#   ReadLines
# )

ReadActual ← (
  °⋕
  $"inputs/_/actuals/day\__.txt"
  ReadLines
)

ReadRawActual ← (
  °⋕
  $"inputs/_/actuals/day\__.txt"
  &fras
)

ReadSample ← (
  °⋕
  $"inputs/_/samples/day\__.txt"
  ReadLines
)

ReadRawSample ← (
  °⋕
  $"inputs/_/samples/day\__.txt"
  &fras
)

SplitBy! ← |2 (
  ⊜^!≠ ⊙.
)

# like ? but tries taking only 10 lines of the list if its an array
TrimDump ← |0.0 dump⍣(≡↙ 10)(⊙◌)
TrimDumpShort ← |0.0 dump⍣(≡↙ 5)(⊙◌)
