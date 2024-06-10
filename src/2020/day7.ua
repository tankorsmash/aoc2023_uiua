Utils ~ "../utils.ua" ~ Helper ReadActual ReadLines ReadRawActual ReadRawSample ReadSample SplitBy! ToString TrimDump

H ← Helper

RawLines ← ReadActual 2020 7
RawActual ← ReadRawActual 2020 7
RawSample ← ReadRawSample 2020 7

# breaks lines into groups of \n\n
SplitInput ← (
  ⊜□ ≠@\n .
  # rows inv(SplitBy!box "contains")
)

ParseBags ← (
  ≡◇(
    ▽=0 (/↥ [⊃(⦷" bags"|⦷ " bag"|⦷ ".")]) . # strip " bags" and " bag"
    ⊜□=0 ⦷" contain ".                      # split into bag name and contents
    ⍜⊡ ⍚(⊜□ =0 ⦷ ", " .) 1                  # break contents into individual bags
  )
)

PartTwo ← (
  ∘
)

[
box "light red bags contain 1 bright white bag, 2 muted yellow bags." 
□ "shaded blue bags contain 1 bright white bag."
box "muted yellow bags contain no other"
]

# SplitInput RawSample
# # SplitInput RawActual
# PartOne
# # PartTwo
ParseBags


ParseContents = (
	◇≡(
	  ≠□"no other"□.°□
	  ([] |(⍜⊡ (⋕) 0 (SplitBy!□ °□@\s)))
	)
)

JoinString =drop1  /content join  des rows join @\s

# rows (fork  (pick 0 | box pop?shape. ParseContents pick 1))
couple rows (fork  (pick 0 | box pop shape. ParseContents pick 1))
trans

?
rows (underpick inv(join "KEY " ) 0 )
PerSingle = {fork (unbox pick0| (JoinString  drop1))}
PerContent = ([]|rows PerSingle) !=0 pick neg1 shape .
rows (underpick inv(PerContent) 1 )
# rows &p


# rows (keep (!= 0 pick neg1 shape unbox ).unbox  drop 1)
#
# rows (shape rows unbox drop 1)
# ?
# pick 1
# ?
# pick 1



# rows JoinString
# fork (take 1 | rows (box JoinString ?drop 1 ) unbox ) 


# rows (JoinString drop1)



# rows &p


&p "@@@@@@@@@@@@@@@ stack below @@@@@@@@@@@@@@@@\n"
