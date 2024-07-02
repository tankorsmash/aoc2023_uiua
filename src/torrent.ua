Utils ~ "./utils.ua" ~ Helper ReadActual ReadLines ReadRawActual ReadRawSample ReadSample SplitBy! ToString Trace TrimDump

Utils~SeparatorFmt "START"

H ← Helper
T ← Trace
S ← ◌ &sc &p "\n~~~ Waiting for input! ~~~"

Input ← °json &fras "files/input.json"
Output ← °json &fras "files/output.json"

LoadedPatterns ← °json &fras "./files/ptn_torrent_patterns.json"

# pattern types with special handling required
# 'integer' if needs to be parsed
# 'boolean' if its existence means true
Types ← (
  {{"season" "integer"}
   {"episode" "integer"}
   {"year" "integer"}
   {"extended" "boolean"}
   {"hardcoded" "boolean"}
   {"proper" "boolean"}
   {"repack" "boolean"}
   {"widescreen" "boolean"}
   {"unrated" "boolean"}
   {"3d" "boolean"}}

  ≡°□
  ↻ 1
  ≡°⊟
  map
)

BooleanTypes ← (
  °map Types
  ⊙(= □"boolean".)
  ⊃(▽ (:⊙∘))(▽ ⋅∘)
)
IntegerTypes ← (
  °map Types
  ⊙(= □"integer".)
  ⊃(▽ (:⊙∘))(▽ ⋅∘)
)

Patterns ← (
  LoadedPatterns

  # flatten 'tuples' of same length pairs
  ≡(⍥⍚(≡□)=2 ⧻ △ °□ .)

  # reshape into pairs
  ↯ [∞ 1]
  ⊃(♭ ≡⍚(⊢ ⊢)|♭ ≡⍚⊡1)
  map
)

# returns a pattern from the pattern map
GetPattern ← |1 (
  Patterns
  :
  get □
  # &p $"pattern: _" .
)

# whether the pattern returns a pair or a single result.
# if `IsComplex` returns true, then the parser needs to
# track the 'raw' (first) and 'clean' (second) parts of the
# tuple
IsComplex ← |1 (= 2 ⧻ ↘1)

MatchingPatterns ← |2 (
  ⊃(
    ⊙≡°□
  | ≡(□ /⊂ ⬚[]regex (¯ ⌵ GetPattern °□ :)) # temp 'try' hack because apparent bug in 0.12 of uiua for https://github.com/uiua-lang/uiua/issues/521
  )
  ◌ # remove the input string

  .
  ≡(◇⧻ ♭)
  ▽ ≠0

  ↯ [∞ 1]
  :
  ≠0 ≡◇⧻ .
  ⊃(▽⊙⋅∘)(▽)

  ♭ ⊙≡(⍣⋕∘ ⊡¯1 °□)
  map

  ⊙◌ BooleanTypes
  ∧(
    # convert the 'boolean' types to 'true', since they exist
    ⊃(has|⊙∘)
    ⟨◌∘|insert : True⟩
  )
)

# &p "possible keys:"
# # rows &p .
# &p ""

# {"aaa" "bbb" "ccc"}
# {"extended" 2 3}
# map
# #
# # repeat (insert 1 @z) (has (box1)) .
# # ?
# # S
#
# # has box1
#
# S?

≡(¯ ⌵) Input

# ▽ ≡(/↥ ⌕ "hercules.2014" ¯ ⌵ °□) .
# take 5

≡(
  ⊙◌ °map Patterns
  :
  # &p $"input: _ " .
  ⊃(⊙◌|□ MatchingPatterns)
  ⊟
)

≡(&p$"'_':\n_"°⊟)

Utils~SeparatorFmt "STACK"
