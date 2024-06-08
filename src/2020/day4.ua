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
StrDigits ← ≡(□°⋕) ⇡10
# which elements of input are digit strings
IsDigit ← |1 /↥ (=Digits)
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
  rows(⍜°□(⊏ ⍏ (≡⊢) .))
  # ∵(&s).
)

# a sorted list of the keys of the passport
GetKeys ← (
  # ≡(pick0 ⊜(□) ≠ @: . °□)
  ≡(⊡0)
  ⊏ ⍏ .
)
GetValues ← (
  ≡(⊡1)
  ⊏ ⍏ .
)

HasAllKeys ← /↧ ∊ FieldsWithoutCID

IsFourDigits ← /↧ [⊃(°□ /↧ (∵(IsDigit (⬚(¯1) ⋕)))) (/↧ =4 ⧻)]

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


ValidatePassport = (
 content ValidateBYR
#  | (1pop) # cid is always valid
 | content ValidateECL
 | content ValidateEYR
 | content ValidateHCL
 | content ValidateHGT
 | content ValidateIYR
 | content ValidatePID
 ) range length .

ExpectTrue ← ⍤ $"Expected True (1), but got Falsey: _" (: =1 .)
ExpectFalse ← ⍤ $"Expected False (0), but got Truthy: _" (: =0 .)

ExpectBoth‼! ← (
  (ExpectTrue /↧) (ExpectFalse /↧) : ∩(∵(^! °□)) ^! ^!
)

ExpectBoth‼!ValidateBYR {"1920" "2002"} {"1919" "2003" "alll" "_"}
ExpectBoth‼!ValidateIYR {"2010" "2020"} {"2009" "2021" "alll" "_"}
ExpectBoth‼!ValidateEYR {"2020" "2030"} {"2019" "2031" "alll" "_"}
ExpectBoth‼!ValidateHGT {"150cm" "193cm" "59in"} {"149cm" "194cm" "in" "76" "76in"}
# ExpectBoth‼!ValidateHCL {"#123abc" "#aaabbb"} {"#z23abc" "3abc" "z23abc#"}
ExpectBoth‼!ValidateECL {"amb" "grn"} {"" "grnn" "22"}
ExpectBoth‼!ValidatePID {"000000001"} {"0123456789"}

# ParsePassports RawSample
ValidPassportOne ←$"pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980\nhcl:#623a2f" 
ValidPassportTwo ←$"eyr:2029 ecl:blu cid:129 byr:1989\niyr:2014 pid:896056539 hcl:#a97842 hgt:165cm"
# ParsePassports  ValidPassportOne
# ParsePassports  ValidPassportTwo

InvalidPassportOne ←$"eyr:1972 cid:100\nhcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926"
InvalidPassportTwo ←$"iyr:2019\nhcl:#602927 eyr:1967 hgt:170cm\necl:grn pid:012533040 byr:1946"
# ParsePassports  InvalidPassportOne
# ParsePassports  InvalidPassportTwo

# keep only valid passports
KeepValidPassports = (.
	≡◇(HasAllKeys GetKeys)
	keep
)


PartTwo =(
	ParsePassports RawActual
	KeepValidPassports

	rows (
		unbox

		# remove cid rows, if present
		rows (box keep (!=box"cid" first ) . )
		keep rows (!= 0 len un box ) .

		# take only values
		rows (pick1 unbox)

		# len .
		# un {dddddddi}
		# unselect

		/min ValidatePassport
		)

	/+

)

PartTwo


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
  ≡◇(HasAllKeys GetKeys)
  /+
)

# PartOne RawActual

&p "@@@@@@@@@@@@@@@ stack below @@@@@@@@@@@@@@@@\n"
