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


PartTwo = (
	&p "starting"
	⊠(box keep  IsUnique .  select rise . ⊂⊂) ..


	&p "keep non empty boxes"
	keep !=0 rows length . deshape

	&p "dedup"
	dedup select rise . rows unbox

	&p "logic"
	rows ( fork(/+|select rise . ))
	&p "done"


	&p "coupling"
	couple rows box dip (rows box)
	trans

	&p "keeping 2020 rows"
	keep rows(=box2020 first)  .

	first

	pick 1
	unbox
	/*
)

# rows parse Lines
# # take 15
#
# # Sample
#
# under now PartTwo
# &p $"Seconds taken: _"
# &p $"Part 2: _"

cross join . . [10 11 12 13]
res `1_2

rows (select rise .)
select rise .
dedup
keep rows (IsUnique .)


# dip (length .)


# dip repeat box
:

trans
# fix
# rows (des dip . )

# rows (?:)

:

?

fix
rows (rows join )
# ;;
#
# # rows (.rows(H"inner")fixH"outer" :gap(fix.) )
#
#
#
#
#
# # rows (rows join [[1 2] [11 22]]) [3 4]
#
# # fix [[1 2] [11 22]]
# # rows (rows join : ) [3 4]
#
#
# [3 4]
# [[1 2] [11 22]]
# ?
# fix
# rows (rows join )
#
