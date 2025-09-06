

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


#let callout(
  icon: "information-circle",
  title: none,
  fill: gray.lighten(85%),
  fill-text: auto,
  body,
) = {
  import "@preview/heroic:0.1.0": hi
  
  title = hi(icon, solid: false) + " " + if title != none {title + linebreak()}
  fill-text = if fill-text == auto {()} else {(fill: fill-text)}
  
  set text(..fill-text)
  
  pad(
    x: 1em,
    block(
      strong(title) + body,
      fill: fill,
      outset: (x: 1em * 0.45),
      inset: (y: 1em * 0.45),
    )
  )
}