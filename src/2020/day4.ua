Utils ← &i "../utils.ua"
  ToString ← Utils "ToString"
  Helper ← Utils "Helper"
  H ← Utils "Helper"
  ReadLines ← Utils "ReadLines"
  ReadActual ← Utils "ReadActual"
  ReadRawActual ← Utils "ReadRawActual"
  ReadSample ← Utils "ReadSample"
  ReadRawSample ← Utils "ReadRawSample"
  SplitBy! ← Utils "SplitBy!"
  TrimDump ← Utils "TrimDump"

RawLines ← ReadActual 2020 4
RawActual ← ReadRawActual 2020 4
RawSample ← ReadRawSample 2020 4

SampleLines ← SplitBy!□ @\n RawSample

Sample ← ≡▽ ⧻ . SampleLines
Lines ← ≡▽ ⧻ . RawLines

ParseInput ← (
  ⊜□ +1 ≠ @\n .
  ≠ 1 ⌕ □"\n\n" .
  ⊜□

  ≡(
    °□

    .
    = @\n
    ≠ 1
    ≡(⍜°□ (▽ ⊙°□))
    ▽ ≠0 ≡⧻.
    □
  )

  # under unbox id
  H"rows"
)

PartOne ← (
  ∘
)

PartTwo ← (
  ∘
)

# answer for part 1 (sample) is : 2
# answer for part 1 (actual) is : 233

# PartTwo Sample
# .
# $"Wrong answer for: `PartTwo Sample`!\nshould be:\n\t336\nbut was:\n\t_"
# assert : =336 :
# 
# PartTwo Lines
# .
# $"Wrong answer for: `PartTwo Lines`!\nshould be:\n\t2122848000\nbut was:\n\t_"
# assert : =2122848000 :

# under now PartOne 3 1 Sample
# under now PartOne Sample [1 3]
# under now PartOne Lines

# &p $"Seconds taken: _"
# &p $"Part 1:  _"

# under now PartTwo Sample
# under now PartTwo rows ParseLine Lines
# &p $"Seconds taken: _"
# &p $"Part 2: _"

# Example
RawSample
# RawActual

ParseInput

&p "@@@@@@@@@@@@@@@ stack below @@@@@@@@@@@@@@@@\n"
