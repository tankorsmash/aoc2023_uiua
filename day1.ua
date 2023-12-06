# Half ← ⍉↯:×20-1×2÷:⇡..50
# ↙ 10 Half

FileName = "sample_input_day_1.txt"
# RawInput = &fras "input.txt"
RawInput = &fras FileName

StringJoin = pack/join
&p StringJoin {"RawInput, `" FileName "`:"}
&p RawInput

Lines = part box !=RawInput @\n RawInput

Range = "123456789"
NumericalRange = -@\0 Range


&p "Lines from RawInput:"
&p Lines

&p "\nProgram:"

PerLine = keep <@a.
rows (under unbox PerLine) Lines
# keep <@a . unbox first Lines
# PerLine unbox first Lines

# parse ? unbox first
