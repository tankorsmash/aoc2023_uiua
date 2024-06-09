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

# PartOne RawSample

"FBFBBFF"
=@B             # [0 1 0 1 1 0 0]
⇌ ∵((ⁿ) : 2) ⇡7 # [64 32 16 8 4 2 1 ]
/+ ≡(⟨0|∘⟩) :   # 44
