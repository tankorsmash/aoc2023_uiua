FileName ← "sample2_input_day_1.txt"
RawInput ← &fras FileName

StringJoin ← ⊐/⊂
&p StringJoin {"RawInput, `" FileName "`:"}
&p RawInput

Lines ← ⊜□≠RawInput@\n RawInput

&p "Lines from RawInput:"
&p Lines

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

isTrue = unbox select , [box "False" box "True"] =1

&p isTrue 1

# window 6 unbox First

One = take 1 FullWords
Eight = unbox select 7 FullWords

# &p " first:"
# &p First
# &p length Eight

UnbFirst = unbox First
LenEight = length Eight
take LenEight UnbFirst
WinFirst = windows LenEight UnbFirst

# take 1_1 WinFirst
&p "whether 'eight' is in any of the first line?"
/+ rows (match Eight) WinFirst
# match "eight" "eight"


# PerLine ←  ? ;:   parse ⍜⇌ (⊂↙1), ↙1 ? . ▽ <@a.
# PartTwo ← /+ ≡(PerLine ⊔) Lines
#
# PartTwo
