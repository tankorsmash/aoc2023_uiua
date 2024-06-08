Utils ~ "../utils.ua" ~ Helper ReadActual ReadLines ReadRawActual ReadRawSample ReadSample SplitBy! ToString TrimDump

H ← Helper

RawLines ← ReadActual 2020 4
RawActual ← ReadRawActual 2020 4
RawSample ← ReadRawSample 2020 4

SubSample ← $ ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
            $ byr:1937 iyr:2017 cid:147 hgt:183cm

SubSampleTwo ← (
  $ eyr:1972 cid:100
  $ hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926
  $ 
  $ iyr:2019
  $ hcl:#602927 eyr:1967 hgt:170cm
  $ ecl:grn pid:012533040 byr:1946
  $ 
  $ hcl:dab227 iyr:2012
  $ ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277
  $ 
  $ hgt:59cm ecl:zzz
  $ eyr:2038 hcl:74454a iyr:2023
  $ pid:3556412378 byr:2007
  $ 
  $ pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980
  $ hcl:#623a2f
  $ 
  $ eyr:2029 ecl:blu cid:129 byr:1989
  $ iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm
  $ 
  $ hcl:#888785
  $ hgt:164cm byr:2001 iyr:2015 cid:88
  $ pid:545766238 ecl:hzl
  $ eyr:2022
  $ 
  $ iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719
)

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
NumDigits ← ⇡10
StrDigits ← ≡(°⋕) ⇡10
# which elements of input are digit strings
IsNumDigit ← |1 /↥ (=NumDigits)
IsStrDigit ← |1 /↥ (=StrDigits)

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

# takes a string and returns all the pairs of boxes values
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
  ≡(⍜°□ (≡(⊜□ ≠@: . °□)))
  ≡(⍜°□(⊏ ⍏ (≡⊢) .))
  # ∵(&s).
)

HasAllKeys ← /↧ ∊ FieldsWithoutCID

IsFourDigits ← /↧ [⊃(/↧ (≡(⍣(IsNumDigit ⋕)0))|=4 ⧻)]

# four digits; at least 1920 and at most 2002.
ValidateBYR ← (
  .
  IsFourDigits
  ⟨0 ◌|/↧ [⊃(≥ 1920)(≤ 2002)] ⋕⟩
)

# four digits; at least 2010 and at most 2020.
ValidateIYR ← (
  .
  IsFourDigits
  ⟨0 ◌|/↧ [⊃(≥ 2010)(≤ 2020)] ⋕⟩
)

# four digits; at least 2020 and at most 2030.
ValidateEYR ← (
  .
  IsFourDigits
  ⟨0 ◌|/↧ [⊃(≥ 2020)(≤ 2030)] ⋕⟩
)

# number, followed by cm or in; cm: 150-193, in: 59-76
ValidateHGT ← (
  ⊜□ (/(◇⊂) +1 ∵IsStrDigit) .
  # {"123" "cm"}

  # parse number
  ⍜⊡ (⍣⋕(¯9999)) 0
  .
  ⇌
  (⍜⊡ (= □"cm") 0)
  °□ ⊢
  ⟨
    /↧ [⊃(≥ 59)(≤ 75)]
  | /↧ [⊃(≥ 150)(≤ 193)]
  ⟩
  °□⊢
)

# a # followed by exactly six characters 0-9 or a-f.
ValidateHCL ← (
  [⊃(=@# ⊡ 0|=7 ⧻|/↧ ↥ ∩×∩(⊓≥≤)@a,@f,@0,@9 ↘ 1)]

  /↧
)

# exactly one of: amb blu brn gry grn hzl oth.
ValidateECL ← (
  □
  ∊ {"amb" "blu" "brn" "gry" "grn" "hzl" "oth"}
  /↥
)

# a nine-digit number, including leading zeroes.
ValidatePID ← (
  [⊃(=9 ⧻)(⍣⋕ 0)]
  /↧
)

ValidatePassport ← ⟨
  ◇ValidateBYR
  #  | (1pop) # cid is always valid
| ◇ValidateECL
| ◇ValidateEYR
| ◇ValidateHCL
| ◇ValidateHGT
| ◇ValidateIYR
| ◇ValidatePID
⟩ ⇡ ⧻ .

ExpectTrue ← ⍤ $"Expected True (1), but got Falsey: _" (: =1 .)
ExpectFalse ← ⍤ $"Expected False (0), but got Truthy: _" (: =0 .)

ExpectBoth‼! ← (
  (ExpectTrue /↧) (ExpectFalse /↧) : ∩(∵(^! °□)) ^! ^!
)

ExpectBoth‼!ValidateBYR {"1920" "2002"} {"1919" "2003" "alll" "_"}
ExpectBoth‼!ValidateIYR {"2010" "2020"} {"2009" "2021" "alll" "_"}
ExpectBoth‼!ValidateEYR {"2020" "2030"} {"2019" "2031" "alll" "_"}
ExpectBoth‼!ValidateHGT {"150cm" "193cm" "59in"} {"149cm" "194cm" "in" "76" "76in"}
ExpectBoth‼!ValidateHCL {"#123abc" "#aaabbb"} {"#z23abc" "3abc" "z23abc#"}
ExpectBoth‼!ValidateECL {"amb" "grn"} {"" "grnn" "22"}
ExpectBoth‼!ValidatePID {"000000001"} {"0123456789"}

# ParsePassports RawSample

ValidPassportOne ← $"pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980\nhcl:#623a2f"
ValidPassportTwo ← $"eyr:2029 ecl:blu cid:129 byr:1989\niyr:2014 pid:896056539 hcl:#a97842 hgt:165cm"
ValidPassportThree ← $"hcl:#888785\nhgt:164cm byr:2001 iyr:2015 cid:88\npid:545766238 ecl:hzl\neyr:2022"
# ParsePassports  ValidPassportOne
# ParsePassports  ValidPassportTwo
# ParsePassports  ValidPassportThree

InvalidPassportOne ← $"eyr:1972 cid:100\nhcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926"
InvalidPassportTwo ← $"iyr:2019\nhcl:#602927 eyr:1967 hgt:170cm\necl:grn pid:012533040 byr:1946"
InvalidPassportThree ← $"hcl:dab227 iyr:2012\necl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277"
# ParsePassports  InvalidPassportOne
# ParsePassports  InvalidPassportTwo
# ParsePassports  InvalidPassportThree

# keep only valid passports
KeepValidPassports ← (
  .
  ≡◇(HasAllKeys ≡⊡0)
  ▽
)

# Foo = id
# Bar = id
# Baz = id
# {Foo "1937" Bar "147" Baz "gry" "2020" "#fffffd" "183cm" "2017" "860033327"}
# uncouple

# RawActual
# RawSample
# SubSample

PartOne ← (
  ParsePassports
  ≡◇(HasAllKeys ⊡0)
  /+
)

PartTwo ← (
  KeepValidPassports

  ≡◇(
    # remove cid rows, if present
    ▽≡◇(≠□"cid" ⊢) .

    # take only values from kv pairs
    ≡◇(⊡1)

    # len .
    # un {dddddddi}
    # unselect

    /↧ ValidatePassport
  )

  /+
)

# PartOne RawActual
ParsePassports RawActual
PartTwo

&p "@@@@@@@@@@@@@@@ stack below @@@@@@@@@@@@@@@@\n"
