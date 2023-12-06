FileName ← "sample_input_day_1.txt"
RawInput ← &fras FileName

StringJoin ← ⊐/⊂
&p StringJoin {"RawInput, `" FileName "`:"}
&p RawInput

Lines ← ⊜□≠RawInput@\nRawInput

&p "Lines from RawInput:"
&p Lines

&p "\nProgram:"

# must be a more elegant way of take1 and rev take 1 without all the stack manipulation
PerLine ← ;: parse under rev (join take 1),take1.keep<@a.
PartOne ← /+ rows (PerLine unbox) Lines

&p "Part One:"
&p PartOne
