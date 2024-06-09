Utils ~ "../utils.ua" ~ Helper ReadActual ReadLines ReadRawActual ReadRawSample ReadSample SplitBy! ToString TrimDump

H ← Helper

RawLines ← ReadActual 2020 5
RawActual ← ReadRawActual 2020 5
RawSample ← ReadRawSample 2020 5

MaxSeats ← 128

PartOne ← (
  ⊜□ ≠@\n .
  ≡(⊜□ +1 ∵(/↥ ∊ "FB") . °□)
)

ParseFB ← (
  # unbox
  # # "FBFBBFF"
  =@B             # [0 1 0 1 1 0 0]
  ⇌ ∵((ⁿ) : 2) ⇡7 # [64 32 16 8 4 2 1 ]
  /+ ≡(⟨0|∘⟩) :   # 44
)

ParseLR ← (
  =@R
  ⇌ ∵((ⁿ) : 2) ⇡3
  /+ ≡(⟨0|∘⟩) :
)

CalcSeatId ← (
  ⊃(
    ParseFB °□ ⊡ 0
  | ParseLR °□ ⊡ 1
  )
  + × 8
)

# actual part one
# PartOne RawActual
# /max rows CalcSeatId

# part2
PartOne RawActual # all the seats, split into FB and LR pairs
⊏ ⍏ .≡CalcSeatId # calc the seat ids (rows * 8 + cols), then sort them
⊃(⧻|/↧) . # calc the number of seat ids and find the lowest seat id
⊃(⊗ 0 ∊+⇡ ⊙⊙∘|⋅⊙) # build the range of seat ids starting at the lowest seat id
                  # then find the first seat id that is not in the list of seat ids
				  # (which is what  `member 0` does)
				  # also pull the length out of the stack in the second fork there
+ # add the lowest seat id to get the missing seat id to the missing index to
  # get the result
