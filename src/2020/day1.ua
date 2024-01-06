Utils ← &i "../utils.ua"
  ToString ← Utils "ToString"
  Helper ← Utils "Helper"
  H ← Utils "Helper"
  ReadLines ← Utils "ReadLines"
  ReadActual ← Utils "ReadActual"
  ReadSample ← Utils "ReadSample"

Lines ← ReadActual 2020 1

IsUnique ← /↧ = ⇡⧻ .⊗ .

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

rows parse Lines
# take 15

# Sample
# [ 3 2 4 1 ]




# partition (couple  box /+ dipbox. ) ..
&p "starting"
# rows ( fork(/+|id)) keep where (IsUnique . ) reshape ¯1_3 ⊠( ⊂ ⊂) ..
# rows ( fork(/+|id)) select where  rows (IsUnique . )  reshape ¯1_3 ⊠( ⊂ ⊂) ..
⊠(box keep  IsUnique . select rise . ⊂⊂) ..

&p "dedup"

dedup select rise . rows unbox keep !=0 rows length . deshape

# ?
# &p "dedup"
# dedup
# &p "crossed"
# reshape ¯1_3
# &p "reshaped"
# # select where rows (IsUnique  ) .
# &p "selected"
&p "logic"
dip (select rise .) rows ( fork(/+|select rise . )) 
&p "done"


couple rows box dip (rows box)
trans

keep rows(=box2020 first)  .
first


# eventual answer for part 2
/* [401 661 958]
&p


