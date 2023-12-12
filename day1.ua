FileName ← "sample2_input_day_1.txt"
RawInput ← &fras FileName

StringJoin ← ⊐/⊂
# &p StringJoin {"RawInput, `" FileName "`:"}
# &p RawInput

Lines ← ⊜□≠RawInput@\n RawInput

# &p "Lines from RawInput:"
# &p Lines

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


# takes a word and returns whether its in a specific line
LineContainsString = (
	# get the windows of the length of the word passed in
	windows length ,
	fix :
	/+ rows (match  dip . )

	#clean up the stack at the end, since there's an array left
	;:
)

&p "whether the word is in any of the first line?"
# &p IsTrue LineContainsString "four"

# lookup a single line in input lines list
# "one"
Line = unbox select 3 Lines
&pf "`Line`: "
&p Line



# Line = unbox select 3 Lines
# index of matched string, with each character it lines up with
rows ( box find    un box  , Line ) FullWords
rows box range length FullWords
couple
trans

