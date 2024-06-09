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
  + * 8
)

# actual part one
# PartOne RawActual
# /max rows CalcSeatId

# part2
PartOne RawActual
select rise .rows CalcSeatId
fork (len|/min) .
fork (indexof 0 member+range ddi|gdi)
+

