FileName ← "sample2_input_day_1.txt"
RawInput ← &fras FileName

StringJoin ← ⊐/⊂
# &p StringJoin {"RawInput, `" FileName "`:"}
# &p RawInput

Lines ← ⊜□≠RawInput@\n RawInput

# &p "Lines from RawInput:"
# &p Lines

&p "\nProgram:"

# # must be a more elegant way of take1 and rev take 1 without all the stack manipulation
# PerLine ← ;: parse under rev (join take 1),take1.keep<@a.
# PartOne ← /+ rows (PerLine unbox) Lines
# 
# &p "Part One:"
# &p PartOne

FullWords = {
	"one" "two" "three"
	"four" "five" "six"
	"seven" "eight" "nine"
}

First = select 0 Lines

IsTrue = unbox select dip {"False" "True"} =1
# &p IsTrue 1

# window 6 unbox First

One = take 1 FullWords
Eight = unbox select 7 FullWords

# &p " first:"
# &p First
# &p length Eight

UnbFirst = unbox First
LenEight = length Eight
WinFirst = windows LenEight UnbFirst
WinSecond = windows LenEight unbox select 1 Lines


LineContainsString = (
	# IsTrue /+  ? rows (match "two") ?  windows length , ? unbox select 1 Lines
	# IsTrue /+ rows (? dip match "two" ) ? .   windows length , "eightwothree" 
	# IsTrue /+ rows (match  .   ) ?  windows  length , "twoth" 
	IsTrue  /+ ? rows (match   ? dip.   ) ?fix :  windows  length , "ninety"
)

&p "whether the word is in any of the first line?"
LineContainsString "nine"


# match @a @a

# &p LineContainsString
# &p IsTrue /+ rows (match Eight) WinFirst

# &p IsTrue /+ rows (match "two") windows  length "two"  unbox select 1 Lines



# PerLine ←  ? ;:   parse ⍜⇌ (⊂↙1), ↙1 ? . ▽ <@a.
# PartTwo ← /+ ≡(PerLine ⊔) Lines
#
# PartTwo
