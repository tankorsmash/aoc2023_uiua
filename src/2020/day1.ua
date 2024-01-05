Utils ← &i "../utils.ua"
  ToString ← Utils "ToString"
  Helper ← Utils "Helper"
  H ← Utils "Helper"
  ReadLines ← Utils "ReadLines"
  ReadActual ← Utils "ReadActual"
  ReadSample ← Utils "ReadSample"

Lines ← ReadActual 2020 1

RawSample ← $ 1721
         $ 979
         $ 366
         $ 299
         $ 675
         $ 1456

Sample = ⊜⋕≠@\n.RawSample
PartOne ← (
  ⊠[⊃(+|∘⊙∘)] .
  ↯ ¯1_3
  ▽ ≡(=2020 ⊢) .
  /× ↘1⊢
)

PartOne ≡⋕ Lines
PartOne Sample
