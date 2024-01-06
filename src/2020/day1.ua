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

&p "starting"
⊠(box keep  IsUnique . select rise . ⊂⊂) ..

&p "dedup"

dedup select rise . rows unbox keep !=0 rows length . deshape

&p "logic"
dip (select rise .) rows ( fork(/+|select rise . )) 
&p "done"


couple rows box dip (rows box)
trans

keep rows(=box2020 first)  .
first

pick 1
unbox
/*


# eventual answer for part 2
&p $"Part 2: _"


