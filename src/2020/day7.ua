Utils ~ "../utils.ua" ~ Helper ReadActual ReadLines ReadRawActual ReadRawSample ReadSample SplitBy! ToString Trace TrimDump

Utils~Separator

H ← Helper
T ← Trace
S ← ◌ &sc &p "\n~~~ Waiting for input! ~~~"

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
    .
    {" bags" " bag" "."} # strip out these three strings
    ▽ ⍜(⊙¤)(=0 (/↥ ≡◇⦷))
    ⊜□=0 ⦷" contain ".     # split into bag name and contents
    ⍜⊡ ⍚(⊜□ =0 ⦷ ", " .) 1 # break contents into individual bags
  )
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

# Sentinal value
Sent ← ¯ 123456789

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

PartOneIterateOnce ← ⊸(
  ⊙¤
  ≡(□ ≡◇(¯⌵ ⊢) FindContainingBags)
  ▽ ≠0 ≡◇⧻. # remove empty boxes
  ◴♭/◇⊂     # join all the matched keys together
)

&p "starting"

PartOneIter ← (
  PartOneIterateOnce

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
  ⍢PartOneIter (≠0 ⧻)

  ◴◌◌
  ⧻
)

PartTwoIter ← (
  H"iter start"
  # S

  # (⊙(¤))
  (
    # ⊙⊙¤

    ⊙(¤.) # fix the map
    # H"DDD"
    ⊃(
      ≡(
        °□ get # get the values and unbox

        ≡(□ (⟨[]|[⍥.]⟩ . °□ -1 °⊟)) # duplicate the values
        /◇⊂
      )
    | ∘
    )
  )
  ♭ # since we get a 2d vec of boxed values, flatten it

  # H "mid"
  # S

  # move accumulator to bottom of stack
  ⊃(⊙⋅∘|⊂ ⋅⊙⋅(°□))

  # dip (unbox unfix )

  H"end (post join)"
  S

  Utils~Separator
)

PartTwo ← (
  ParseBags
  ConvertToMap

  # drop 4
  # take 5 #temp

  ⍜°map ≡(¯ ⌵) # lowercase the keys
  # UnjoinMap
  # RemoveCounts

  # drop 4
  # take 5 #temp

  {} # accumulator
  :
  {ShinyGoldBag} # value to find
  ⍢PartTwoIter ◇(≠0 ⧻)

  # ◴◌◌
  # ⧻
)

# [□ "light red bags contain 1 bright white bag, 2 muted yellow bags."
#  □ "shaded blue bags contain 1 bright white bag."
#  □ "muted yellow bags contain no other"]

RawSampleTwo ← $ shiny gold bags contain 2 dark red bags.
               $ dark red bags contain 2 dark orange bags.
               $ dark orange bags contain 2 dark yellow bags.
               $ dark yellow bags contain 2 dark green bags.
               $ dark green bags contain 2 dark blue bags.
               $ dark blue bags contain 2 dark violet bags.
               $ dark violet bags contain no other bags.

SplitInput RawSample
# SplitInput RawSampleTwo
# SplitInput RawActual
PartTwo

# SplitInput RawSample
# ParseBags
# ConvertToMap

# fix
# unfix

&p "end"

&p "@@@@@@@@@@@@@@@ stack below @@@@@@@@@@@@@@@@\n"
