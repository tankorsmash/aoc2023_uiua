Utils ~ "../utils.ua" ~ Helper ReadActual ReadLines ReadRawActual ReadRawSample ReadSample SplitBy! ToString TrimDump

Utils~Separator

H ← Helper
S ← ◌ &sc

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
    {" bags" " bag" "."} # strip out these three strings
    ▽ ⍜(⊙¤) (=0 (/↥ ≡(⦷ °□)) ⊙.)
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

FindContainingBags ← |2 (
  # for each row in the bags,
  # check if its in the keys we're looking for
  ▽ ≡(≠0 ⧻ ⟜□ ▽∊ ⊙. ¯⌵)
)

IterateOnce ← ⊸(
  ⊙¤
  ≡(□ ≡◇(¯⌵ ⊢) FindContainingBags)
  ▽ ≠0 ≡◇⧻. # remove empty boxes
  ◴♭/◇⊂     # join all the matched keys together
)

&p "starting"

Iter ← (
  IterateOnce

  # &pf "found keys: "
  # &p.

  ⊃(⊙∘|⊂ ⊙⋅∘) # join the iteration result with the accumulator
  #             and return the top two elements on the stack
)

Cond ← (≠0 ⧻ °□)
PartOne ← (
  ParseBags
  ConvertToMap
  UnjoinMap
  # RemoveCounts

  # drop 4
  # take 5 #temp

  {} # accumulator
  :
  {⌵ ShinyGoldBag} # value to find
  ⍢Iter (≠0 ⧻)

  ◴◌◌
  ⧻
)

PartTwo ← (
  ParseBags
  ConvertToMap
  UnjoinMap
  # RemoveCounts

  # drop 4
  # take 5 #temp

  {} # accumulator
  :
  {⌵ ShinyGoldBag} # value to find
  ⍢Iter ◇(≠0 ⧻)

  ◴◌◌
  ⧻
)

# [□ "light red bags contain 1 bright white bag, 2 muted yellow bags."
#  □ "shaded blue bags contain 1 bright white bag."
#  □ "muted yellow bags contain no other"]

# SplitInput RawSample
SplitInput RawActual

PartOne

# °□ ◇⊢

# mask " bags"

# {" bags" " bag" "."}

&p "end"

&p "@@@@@@@@@@@@@@@ stack below @@@@@@@@@@@@@@@@\n"
