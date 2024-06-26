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

# AOne = ( [ repeat . ] )
# AZero =|1.1 ({} pop )
# F = ( box(AZero | dip pop AOne ) .  -1  unbox uncouple  )
# # F =|2 (box gap id )
# Z = (rows F  unbox get  )
# B =|3.1 rows content Z

DuplicateValues ← (
  . -1 °□ °⊟
  ⟨
    {} ◌
  | ⊙◌ [⍥.]
  ⟩
)

PartTwoIter ← (
  H"iter start"

  ⍜(⊙¤)(
    ⬚Sent ≡(
      ⊃(
        °□ get °□ H"HGER"
        # H"before DuplicateValues"

        ≡(□ DuplicateValues)
        /◇⊂
        # H"after"
        # | H"pos right" ⊙id H"pre right"
        | ⊙∘
      )

      ⊙⊙(□)
      # H"post fork"
      # ?
    )
    # H "post rows"
  )
  # H"end (pre join)"
  # S

  # &p . &pf "result:\n"

  ⊃(
    ⋅⊙∘
  | (⊂ ♭)
  ) # join the iteration result with the accumulator
  #             and return the top two elements on the stack

  H"EEENNNNDD (post join)"
  # S
)

PartTwo ← (
  ParseBags
  ConvertToMap

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

&p "end"

&p "@@@@@@@@@@@@@@@ stack below @@@@@@@@@@@@@@@@\n"
