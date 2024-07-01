Utils ~ "./utils.ua" ~ Helper ReadActual ReadLines ReadRawActual ReadRawSample ReadSample SplitBy! ToString Trace TrimDump

Utils~Separator

H ← Helper
T ← Trace
S ← ◌ &sc &p "\n~~~ Waiting for input! ~~~"

Input ← °json &fras "files/input.json"
Output ← °json &fras "files/output.json"

Patterns ← (
  °json $ [["season", "(s?([0-9]{1,2}))[ex]"], ["episode", "([ex]([0-9]{2})(?:[^0-9]|$))"], ["year", "([\\\\[\\\\(]?((?:19[0-9]|20[01])[0-9])[\\\\]\\\\)]?)"], ["resolution", "([0-9]{3,4}p)"], ["quality", "((?:PPV\\\\.)?[HP]DTV|(?:HD)?CAM|B[DR]Rip|(?:HD-?)?TS|(?:PPV )?WEB-?DL(?: DVDRip)?|HDRip|DVDRip|DVDRIP|CamRip|W[EB]BRip|BluRay|DvDScr|hdtv|telesync)"], ["codec", "(xvid|[hx]\\\\.?26[45])"], ["audio", "(MP3|DD5\\\\.?1|Dual[\\\\- ]Audio|LiNE|DTS|AAC[.-]LC|AAC(?:\\\\.?2\\\\.0)?|AC3(?:\\\\.5\\\\.1)?)"], ["group", "(- ?([^-]+(?:-={[^-]+-?$)?))$"], ["region", "R[0-9]"], ["extended", "(EXTENDED(:?.CUT)?)"], ["hardcoded", "HC"], ["proper", "PROPER"], ["repack", "REPACK"], ["container", "(MKV|AVI|MP4)"], ["widescreen", "WS"], ["website", "^(\\\\[ ?([^\\\\]]+?) ?\\\\])"], ["language", "(rus\\\\.eng|ita\\\\.eng)"], ["sbs", "(?:Half-)?SBS"], ["unrated", "UNRATED"], ["size", "(\\\\d+(?:\\\\.\\\\d+)?(?:GB|MB))"], ["3d", "3D"]]

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
  &p $"pattern: _" .
)

GetPattern "season"

⊢ Input
¯ ⌵
&p $"input: _ " .

regex :

# &s

# rota 1
# pick neg2
# unbox
# rows box

# {"3d" "3D"}

# unbox
# des

# rows (conte first)

&p "------ RESULT ------------"
