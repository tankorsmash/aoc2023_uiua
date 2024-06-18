Utils ~ "../utils.ua" ~ Helper ReadActual ReadLines ReadRawActual ReadRawSample ReadSample SplitBy! ToString TrimDump 

Utils~Separator

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

    ⊜□=0 ⦷" contain ".     # split into bag name and contents
    ⍜⊡ ⍚(⊜□ =0 ⦷ ", " .) 1 # break contents into individual bags
  )
)

PartTwo ← (
  ∘
)

ParseContents ← (
  ◇≡(
    ≠□"no other" □ . °□
    ⟨
      []
    | (⍜⊡ (⋕) 0 (SplitBy!□ @\s))
    ⟩
  )
)

JoinString ← ↘1 /◇⊂ ♭ ≡⊂ @\s

PerSingle ← [⊃(⊡0|□(JoinString ↘1))]
PerContent ← ⟨[[]]|≡PerSingle⟩ ≠0 ⊡ ¯1 △ .
ConvertToMap ← (
  ≡(
    ⊃(
      ⊡ 0
    | □ ParseContents ⊡1
    )
  )

  ⊟
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
UnjoinMap ← (
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
RemoveCounts ← ≡(▽ ⍜⊡◌1 =. :0 .)

ShinyGoldBag ← "shiny gold"

# [□ "light red bags contain 1 bright white bag, 2 muted yellow bags."
#  □ "shaded blue bags contain 1 bright white bag."
#  □ "muted yellow bags contain no other"]

SplitInput RawSample
# SplitInput RawActual

# drop 1
# ↙ 3

# PartOne
# # PartTwo

ParseBags
ConvertToMap
UnjoinMap
# RemoveCounts

# drop 4
# take 5 #temp

FindContainingBags ← |2 (
  # for each row in the bags,
  # check if its in the keys we're looking for
  ▽ ≡(≠0 ⧻ ⟜□ ▽∊ ⊙. ¯⌵)
)

IterateOnce ← by(◴♭ ≡(≡◇(¯⌵ ⊢) FindContainingBags) ⊙¤)

# by(◴♭ ≡(≡◇(¯⌵ ⊢) FindContainingBags) ⊙¤)
# ◴♭ ≡(≡◇(¯⌵ ⊢) FindContainingBags) ⊙¤

# # starting value
# ⌵ {ShinyGoldBag}
# IterateOnce
# &p .
# IterateOnce
# &p .
# IterateOnce
# &p .

&p "starting"

Iter ← (
  # H"iter"
  # IterateOnce

  IterateOnce
  # IterateOnce

  H "iter"

  &pf "found keys: "
  &p.

  H "pre fork iter"
  fork(di|join dgi)
  H "end iter"
  &p "end iter, waiting for input"



)

# Cond ← (!=0 leng pick1)
Cond ← (!=0 len)

{}
:
{⌵ ShinyGoldBag}
⍢ Iter Cond H"going in" 



# pop
#
# Iter = (
# 		&p "iter start"
# 		dip dip id
# 		dip id
# 		id
# 		?
# 		+1
#
# 		dip (join 999)
#
# 		&p "iter end"
# 		&sl 1
# )
# Cond = (
# 	# length id
# 	?
# 	fork(gggi, ddi)
# 	H"A"
# )
#
# do Iter Cond 123 [123 ] 0

&p "end"

&p "@@@@@@@@@@@@@@@ stack below @@@@@@@@@@@@@@@@\n"
