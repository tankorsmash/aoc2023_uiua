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
	cross(select rise . join join) ..

	&p "reshaping"
	res `1_3

	&p "dedup"
	dedup

	&p "logic"
	rows ( fork(/+|id ))
	&p "done"


	&p "coupling"
	&s take 20 .
	couple rows box dip (rows box)
	trans
	&s take 20 .

	&p "keeping 2020 rows"
	keep rows(=2020 unbox first)  .

	first

	pick 1
	unbox
	/*
)
under now PartTwo rows parse Lines

PartTwoOptimized = (
	&p "crossing"
	cross join . .
	res `1_2

	&p "sorting"
	rows (select rise .)
	select rise .
	&p "dedup"
	dedup
	keep rows (IsUnique .)

	dip trans

	fix
	&p "joining third number"
	rows (rows join )

	&p "going to 2d"
	/join
	&p "sorting again"
	rows (select rise .)
	&p "dedup again"
	dedup

	&p "logic"
	rows ( fork(/+|select rise . ))
	&p "done"


	&p "coupling"
	couple rows box dip (rows box)
	trans

	&p "keeping 2020 rows"
	keep rows(=2020 unbox first )  .

	&p "finding first match"
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

# range 200

# rows parse Lines

# under now PartTwo
# &p $"Seconds taken: _"
# &p $"Part 2 (slow): _"

# under now PartTwoOptimized
# &p $"Seconds taken: _"
# &p $"Part 2 (optimzied): _"
