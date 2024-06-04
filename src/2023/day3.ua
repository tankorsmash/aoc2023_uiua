~ "../utils.ua" ~ Helper ReadActual ReadLines ReadSample ToString

H ← Helper

# easier to type than ¯1
Neg ← ¯1

Lines ← ≡°□ ReadSample 2023 3
# Lines ← ReadActual 2023 3

# SampleSubset = ⊏ +1⇡3 Lines
# ≡&p SampleSubset

Letters ← {"a" "b" "1" "2" "y" "9"}
Digits ← ≡(□$"_") ⇡ 10
NonDigits ← 123

# which elements of input are digit strings
IsDigit ← |1 /↥ ⍉ ≡(=Digits)

# pick1 Lines

# rows &p Lines
# ≡(/⊂ ∵°□ IsDigit °□) Lines

FindSymbols ← - ≡(/⊂◇⊃(∵°□≡IsDigit)(≠@.))

# /content join Lines

Symbols ← FindSymbols Lines
≡&p ≡(⊂ @ /◇⊂ ∵⊂ @ )Lines

FlatLines ← /◇⊂ Lines
ColsAcross ← ◇⧻ ⊢ Lines

Enumerate ← ∵⇌ ⍉ ⊟ ⊃(⇡⧻)(∵□)

LookupByIndex ← ⊃(°□ ⊡0|°□ ⊡1) ⊡ : (Enumerate FlatLines)
# takes x and y, LookupIndex x y -> @7, 42 on stack
LookupByCoord ← LookupByIndex + × ColsAcross

HasAdjacentSymbolInDir ← fill0⊡ : /◇⊂ Symbols
HasAdjacentSymbolInAnyDir ← (
  [
    ⊃(
      HasAdjacentSymbolInDir(+ (ColsAcross))
    | HasAdjacentSymbolInDir(+ 1)
    | HasAdjacentSymbolInDir(- 1)
    | HasAdjacentSymbolInDir(- (ColsAcross))
    )  ]
	/max
)
IsNotPeriod ← (≠@.)

# HasAdjacentSymbolInDir 13
HasAdjacentSymbolInAnyDir 3

HasAdjacentSymbolInAnyDir 99

# fill 999 pick 10 range 10


# ↯ (△ Lines) ∵(/max[HasAdjacentSymbolInAnyDir (≠@. ◌ LookupByIndex)]) ⇡ ⧻ FlatLines
# ↯ (△ Lines) ∵(fork(HasAdjacentSymbolInAnyDir)(IsNotPeriod) ) ⇡ ⧻ FlatLines
# ↯ (△ Lines) rows(/min[fork (HasAdjacentSymbolInAnyDir unbox pick 0)(unbox IsNotPeriod pick 1) ] ) Enumerate FlatLines
# ↯ (△ Lines) ∵(Qwe) ⇡ ⧻ FlatLines
# LookupByCoord 4 2

# digits next to a symbol
↯ (△ Lines) rows(/min[fork (HasAdjacentSymbolInAnyDir unbox pick 0)(unbox IsNotPeriod pick 1) ] ) Enumerate FlatLines

# all the numbers in the grid
part box (each (/min [fork IsNotPeriod (unfix unbox IsDigit)]) FlatLines ) FlatLines

# Lines
# pick 0_0 Lines
# 
# ColsAcross

# ≡(↯ 3_1) ◫ 3 Lines
