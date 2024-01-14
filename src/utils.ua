# a separator for printing
Separator ← ▽ 60 "-"

# turns 0 or 1 into "True" or "False"
# &p IsTrue 1
IsTrue ← °□ ⊏ ⊙{"False" "True"} =1

# a to-string function
ToString ← $"_"

# prints the stack but takes a string too
Helper ← |1.0 ;?

# Joins strings together
StringJoin ← ⊐/⊂

# read lines of a file
# then split by newlines and box
ReadLines ← |1 (
  # read file
  ⍣&fras (Helper)

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


ReadSample ← (
  °⋕
  ⊐/⊂{"inputs/samples/day_" ⊙⊙;, ".txt"}
  ReadLines
)

SplitBy! = |2.1 (
	part ^1 != dip.
)

