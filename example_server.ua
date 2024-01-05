# A simple, parallel HTTP server good enough to serve Uiua's website

# Bind TCP listener
Listener ← &tcpl "0.0.0.0:3322"
&p $ Server started

# Mime types
GetExt ← |1 °□⊢⇌ ⊜□ ≠@. .
°⊟⍉[{"js" "text/javascript"}
    {"wasm" "application/wasm"}]

ExtMimeExt ←
ExtMimeMime ←
ExtMime ← |1 °□⊏:⊂ExtMimeMime □⊂"text/": ⊗:ExtMimeExt□.

# Make response: status mime bytes
Response ← (|3
  ⊙⊙(⧻.)
  ⊂ utf $ HTTP/1.1 _
        $ Content-Type: _
        $ Content-Length: _
        $ 
        $ 
)

# Handlers
NotFound ← (
  utf"Http 404 page !!!"
  Response "404 Not Found" "text/plain"
)
ServerError ← Response "500 Internal Server Error" "text/plain"
HandlePageLoadError ← ⋅(
  /↥⌕"The system cannot find the file specified".
  (NotFound;|ServerError)
)
Page ← |1 ⍣(
  ExtMime GetExt : &frab.
  Response "200 OK"
)HandlePageLoadError
Home ← |0 Page "./index.html"
About ← |0 Page "./about.html"

Respond ← ;spawn(
  # Extract path from request
  °□⊡1 ⊜□≠@ . &ru "\r\n\r\n".
  &p "Request:"
  &p.

  # Route to handler
  {"/" "/about"}.
  (Home|About|Page) ⊗ □ :

  &p "Response:"
  &pf⧻.
  &p " bytes"

  # Send response
  ⊃⋅&cl&w
)

⍥(⍣Respond⋅&p &tcpa Listener)∞
