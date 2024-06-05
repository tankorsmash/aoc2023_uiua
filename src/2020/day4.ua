Utils ~ "../utils.ua" ~ Helper ReadActual ReadLines ReadRawActual ReadRawSample ReadSample SplitBy! ToString TrimDump

H ← Helper

RawLines ← ReadActual 2020 4
RawActual ← ReadRawActual 2020 4
RawSample ← ReadRawSample 2020 4

SubSample ← $ ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
            $ byr:1937 iyr:2017 cid:147 hgt:183cm

SampleLines ← SplitBy!□ @\n RawSample

Sample ← ≡▽ ⧻ . SampleLines
Lines ← ≡▽ ⧻ . RawLines

ParseEntry ← (
  ⍜°□ (SplitBy!□ @:)
)

ParseInput ← (
  # ⊜□ +1 ≠ @\n .
  # ≠ 1 ⌕ □"\n\n" .
  # ⊜□

  .
  ⌕ "\n\n"

  ⊜□ +1
  ▽ ≠1 ∵(⧻) .

  ≡(
    °□

    .
    = @\n
    ≠ 1
    ≡(⍜°□ (▽ ⊙°□))
    ▽ ≠0 ≡⧻.
    ◇/⊂

    SplitBy!□ @  # 
    □
  )

  ≡(⍜°□ ≡ParseEntry)
  # rows (box partition != 0 length.)
)

PartOne ← (
  ∘
)

PartTwo ← (
  ∘
)

# answer for part 1 (sample) is : 2
# answer for part 1 (actual) is : 233

# PartTwo Sample
# .
# $"Wrong answer for: `PartTwo Sample`!\nshould be:\n\t336\nbut was:\n\t_"
# assert : =336 :
#
# PartTwo Lines
# .
# $"Wrong answer for: `PartTwo Lines`!\nshould be:\n\t2122848000\nbut was:\n\t_"
# assert : =2122848000 :

# under now PartOne 3 1 Sample
# under now PartOne Sample [1 3]
# under now PartOne Lines

# &p $"Seconds taken: _"
# &p $"Part 1:  _"

# under now PartTwo Sample
# under now PartTwo rows ParseLine Lines
# &p $"Seconds taken: _"
# &p $"Part 2: _"

# RawActual
# RawSample
# SubSample

# ParseInput
# ⊜□ +1 ≠ @\n .

# numbers 0-9
Digits ← ≡(□) ⇡10
# which elements of input are digit strings
IsDigit ← |1 /↥ (=Digits)

# birth year
BYR ← "byr"
# issue year
IYR ← "iyr"
# expiration year
EYR ← "eyr"
# height
HGT ← "hgt"
# hair color
HCL ← "hcl"
# eye color
ECL ← "ecl"
# passport id
PID ← "pid"
# country id
CID ← "cid"

Fields ← ⊏ ⍏ .{BYR IYR EYR HGT HCL ECL PID CID}
# Fields without CID
FieldsWithoutCID ← ⊏ ⍏ .{BYR IYR EYR HGT HCL ECL PID}

ParsePassports ← (
  .
  ⌕ "\n\n"
  # replace first index with 1, so it is kept
  ⍜⊡ ◌ 0 : 1
  ⊜□ \+

  # replace all newlines with spaces
  ∵(⍜°□(⍜▽ ≡⋅∘ =, @\n : @ ))
  # split on spaces
  ∵(⍜°□ (⊜□ ≠@  .))
  # ∵(&s).
)

# a sorted list of the keys of the passport
GetKeys ← (
  ≡(⊢ ⊜(□) ≠ @: . °□)
  ⊏ ⍏ .
)

HasAllKeys ← /↧ ∊ FieldsWithoutCID

ValidateBYR ← (
  .
  /↧ [⊃(°□ /↧ (∵(IsDigit (⬚(¯1) ⋕)))) (/↧ =4 ⧻)]
  # &p.
  ⟨0 ◌|/↧ [⊃(≥ 1920)(≤ 2002)] ⋕⟩
)

ValidateIYR ← (
  .
  /↧ [⊃(°□ /↧ (∵(IsDigit (⬚(¯1) ⋕)))) (/↧ =4 ⧻)]
  # &p.
  ⟨0 ◌|/↧ [⊃(≥ 2010)(≤ 2020)] ⋕⟩
)

ExpectTrue ← ⍤ "Expected true, but got false" =1
ExpectFalse ← ⍤ "Expected false, but got true" =0

# ValidateBYR "2002"

ExpectFalse ValidateBYR "1919"
ExpectTrue ValidateBYR "1920"
ExpectTrue ValidateBYR "2002"
ExpectFalse ValidateBYR "2003"
ExpectFalse ValidateBYR "alll"
ExpectFalse ValidateBYR "_"

ExpectFalse ValidateIYR "1919"
ExpectFalse ValidateIYR "2009"
ExpectTrue ValidateIYR "2010"
ExpectTrue ValidateIYR "2020"
ExpectFalse ValidateIYR "2021"
ExpectFalse ValidateIYR "alll"
ExpectFalse ValidateIYR "_"

# RawActual
# RawSample
# SubSample

PartOne ← (
  ParsePassports
  ≡(HasAllKeys GetKeys °□)
  /+
)

# PartOne RawActual

# keep !="\n"
#
#
#
# rows (
# keep : range length . find @\n . unbox
#
# under pick (@ pop)
# )

&p "@@@@@@@@@@@@@@@ stack below @@@@@@@@@@@@@@@@\n"
