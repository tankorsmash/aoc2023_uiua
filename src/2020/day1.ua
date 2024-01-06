Utils ← &i "../utils.ua"
  ToString ← Utils "ToString"
  Helper ← Utils "Helper"
  H ← Utils "Helper"
  ReadLines ← Utils "ReadLines"
  ReadActual ← Utils "ReadActual"
  ReadSample ← Utils "ReadSample"

Lines ← ReadActual 2020 1

IsUnique ← /↧ =⇡ ⧻ .⊗ .

RawSample ← $ 1721
            $ 979
            $ 366
            $ 299
            $ 675
            $ 1456

Sample ← ⊜⋕≠@\n.RawSample

# PartOne ← (
  # ⊠[⊃(+|∘⊙∘)] .
#   ↯ ¯1_3
  # ▽ ≡(=2020 ⊢) .
#   /× ↘1⊢
# )
# 
# PartOne ≡⋕ Lines
# PartOne Sample

# rows parse Lines
# take 5

Sample

# partition (couple  box /+ dipbox. ) ..
&p "starting"
# rows ( fork(/+|id)) keep where (IsUnique . ) reshape ¯1_3 ⊠( ⊂ ⊂) ..
rows ( fork(/+|id)) select where  rows (IsUnique . )  reshape ¯1_3 ⊠( ⊂ ⊂) ..
&p "done"


rows box
dip rows box 
trans couple
keep rows(=box2020 first)  .

/* unbox pick 1 first

&p $"part two answer is: _"

