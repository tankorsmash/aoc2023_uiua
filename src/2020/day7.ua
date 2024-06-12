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

ParseContents ← (
  ◇≡(
    ≠□"no other"□.°□
    ⟨[]|(⍜⊡ (⋕) 0 (SplitBy!□ °□@\s))⟩
  )
)

JoinString ← ↘1 /◇⊂ ♭ ≡⊂ @\s

PerSingle ← {⊃(°□ ⊡0|(JoinString ↘1))}
PerContent ← ⟨[[]]|≡PerSingle⟩ ≠0 ⊡ ¯1 △ .
ConvertToMap ← (
  ⊟ ≡(⊃(⊡ 0|□ ◌ △. ParseContents ⊡ 1))
  ⍉

  ≡(⍜⊡ ⍚(⌵) 0)
  ≡(⍜⊡ ⍚(PerContent) 1)
  # rows &p
  ⍉
  °⊟
  map
)

Sent ← ¯ 1

# returns the contents and its count to its holder.
SwapMap ← (
  °map
  ⊟
  ⍉
  ⬚Sent ≡(
    ⊃(°□ ⊡1|⊡0)
    ≡(⊙◌ ⊂ ,)
  )
  /⊂

  ▽ ≡(/↧≠ □Sent).
)

# remove counts from the swapped map
RemoveCounts = ≡(▽ ⍜⊡◌1 =. :0 .)

ShinyGoldBag ← "shiny gold"

# [□ "light red bags contain 1 bright white bag, 2 muted yellow bags."
#  □ "shaded blue bags contain 1 bright white bag."
#  □ "muted yellow bags contain no other"]

SplitInput RawSample
# SplitInput RawActual

# PartOne
# # PartTwo

ParseBags
ConvertToMap

SwapMap


RemoveCounts

# drop 4
# take 5 #temp

?
.


keep ≡(=□ShinyGoldBag pick1) .

rows (abs pic1)

FindContainingBags = (
	# dipfix
	rows(!=0 length unbox . box keep member dip. neg abs  )

	keep
	# rows (box keep !=0 contentlength .)
)
dedup des rows (rows content(negabs first) FindContainingBags )  dipfix

&p "@@@@@@@@@@@@@@@ stack below @@@@@@@@@@@@@@@@\n"
