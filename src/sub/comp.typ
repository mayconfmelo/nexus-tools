/**
= Command Arguments
:arg:
Defines and explains possible arguments/parameters (see `/tests/commands/arg/`).
**/
#let arg(
  title, /// <- string <required>
    /** `"name <- type | type -> type <required>"` \
    Title data: A mandatory name identifier, followed by optional ASCII arrows
    indicating input/output types, and a final `<required>` to define required
    arguments. |**/
  body
) = context {
  assert.ne(body, [], message: "#arg(body) should not be empty: " + title)
  
  // TODO: Allow other "required" texts — useful for other languages
  let required = title.contains("<required>")
  let output = false
  let display = ""
  let types = ()
  let title = title
  let body = body
  let ignored = (none, "", "nothing")
  let parts
  let name
  let width
  
  // Remove any <required> from title, if any
  title = title.replace("<required>", "")
  
  if title.contains("<-") {display = "i"}
  if title.contains("->") {display = display + "o"}
  
  parts = title.split(regex("<-|->"))
  name = parts.at(0).trim() + " "
  width = if display == "o" {" " + sym.arrow.r + " "} else {""}
  width = measure(name + width).width + 2pt
  
  if name == "" {panic("Argument name required: " + title)}
  
  //Set types, if any
  for part in parts.slice(1) {
    part = part.replace(regex("\s*\|\s*"), "|").trim()
    part = if part == "nothing" {(none,)} else {part.split("|")}
    
    types.push(part)
  }
  if types.len() > 2 {panic("There should be only one of each '<-' and '->' in " + title)}

  // Show name as raw
  if name.contains(regex("`.*`")) {name = eval(name, mode: "markup")}
  else if type(name) == str {name = raw(name)}
  
  title = (strong(name) + " ",)
  if display.contains("i") {
    for type in types.at(0) {
      if not ignored.contains(type) {
        title.push(
          box(
            fill: luma(225),
            inset: (x: 3pt, y: 0pt),
            outset: (y: 3pt),
            type
          ) + " "
        )
      }
    }
  }
  if display.contains("o") {
    let n = if display.contains("i") {1} else {0}
    
    if not ignored.contains(types.at(n).at(0)) {title.push(sym.arrow.r + " ")}
    
    for type in types.at(n) {
      if not ignored.contains(type) {
        title.push(
          box(
            fill: luma(230),
            inset: (x: 3pt, y: 0pt),
            outset: (y: 3pt),
            type
          ) + " "
        )
      }
    }
  }
  if required { title.push( box(width: 1fr, align(right)[(_required_)]) ) }
  
  if body != [] {body = pad(left: 1em, body)}
  
  block(
    breakable: false,
    fill: luma(245),
    width: 100%,
    outset: 5pt,
    [
      #par(hanging-indent: width, title.join())
      #context v(-par.leading * 0.5)
      #body
    ]
  )
}


/**
= Command URL
```typ
#url(url, id, text)
```

Creates a paper-friendly link, attached to a footnote containing the URL itself
for readability when printed.

url <- string | label <required>
  URL set to link and shown in footnote.

id <- label
  Label set to the footnote for future reference.

text <- string | content
  Text to be shown in-place as the link itself.
**/
#let url(url, ..data) = {
  h(0pt)
  
  assert(
    data.pos().len() <= 2,
    message: "Received " + str(data.pos().len() + 1) + " arguments (expected 3)"
  )
  
  let note = if type(url) == str {link(url)} else {url}
  let text = data.pos().at(-1, default: url)
  let id = data.pos().at(-2, default: [])

  link(url, emph(text))
  [#footnote(note)#id]
}


/**
== Commands for Package URLs
```typ
#pkg(url)
#univ(name)
#pip(name)
#crate(name)
#npm(name)
#gh(slug)
```
Generates paper-friendly links to packages from different sources/platforms using
only essential data like its name (see `/tests/commands/links/`).

url <- string
  Package URL (used by `#pkg`). The package name is extracted if enclosed in `{}`
  or fallback to the last `/slug` of the URL.

name <- string
  Package name as it is in the source repository/platform (used by `#pip`, 
  `#univ`, and `#crate`).

slug <- string
  A `user/name` path, as it appears in GitHub repository paths (used by `#gh`).
**/
// TODO: Enable labels in #univ, #pip, #crate, #gh
#let pkg(..data) = context {
  let data = data.pos()
  let out = ()
  let target = data.remove(0)
  let text = target
  
  // #pkg
  if data == () {
    if type(target) == label {panic("#pkg(text, label) required")}
    
    text = target.match(regex("\{.*?\}|/[^/]*?$")).text.trim(regex("[/{}]"))
    target = target.replace( regex("\{(.*?)\}"), m => {m.captures.at(0)} )
  }
  else {
    text = data.last().trim(regex(".*?/"))
    
    for m in target.matches(regex("\{.*?\}")) {
      target = target.replace(m.text, data.remove(0))
    }
  }
  
  out.push(target)
  out.push(text)
  
  //[#out]
  url(..out)
}
