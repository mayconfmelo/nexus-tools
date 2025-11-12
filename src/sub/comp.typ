/**
= Components
```typ
#import "@preview/toolbox: 0.1.0": comp
```

== Paper-friendly URLs
```typ
#comp.url(target, id, text)
```

Creates a paper-friendly link, attached to a footnote containing the URL itself
to ensure readability when printed.

target <- string | label <required>
  URL used as link and footnote, or  or label referencing a previous `#url` command.

id <- label
  Optional label for further reference.
  
text <- string | content
  Text shown as link (fallback to the URL).
**/
#let url(target, ..args) = {
  h(0pt)
  
  assert(args.pos().len() <= 2, message: "#url(target, id, name) only")
  assert(args.named() == (:), message: "#url(target, id, name) only")
  
  let note = if type(target) == str {link(target)} else {target}
  let text = args.pos().last(default: target)
  let id = args.pos().first(default: none)
  let hash
  
  // Store text under hash label
  if type(id) == label {
    import "@preview/digestify:0.1.0": md5, bytes-to-hex
    
    hash = bytes-to-hex( md5(bytes(repr(id))) )
    
    [ #metadata(text)#label(hash) ]
  }
  else {id = none}
  
  // Retrieve hash label to obtain text
  if type(text) == label {
    import "@preview/digestify:0.1.0": md5, bytes-to-hex
    
    hash = bytes-to-hex( md5(bytes(repr(target))) )
    text = context query(label(hash)).first().value
  }

  link(target, emph(text))
  
  [ #footnote(note)#id ]
}


/**
== Package URLs
```typ
#comp.pkg(target, id)
```
Generates paper-friendly links to packages from its URL. 
The package name is inferred from the last path from the URL slug (like `/path`)
or set using curly brackets (like `/{path}/path`).

target <- string | label
  Package URL, or label referencing a previous `#pkg` command.
  
id <- label
  Optional label for further reference.
**/
#let pkg(target, ..args) = {
  assert(args.pos().len() <= 1, message: "#pkg(target, id) only")
  assert(args.named() == (:), message: "#pkg(target, id) only")
  
  let id = args.pos().at(0, default: none)
  let target = target
  let text
  
  if type(target) == label {text = target}
  else {
    assert.eq(type(target), str, message: "pkg(url) must be string")
    
    // Extract text from target
    text = target.match(regex("\{.*?\}|/[^/]*/?$"))
    text = if text != none {text.text.trim(regex("[/{}]"))} else {target}
    target = target.replace(regex("[{}]"), "")
  }
  
  url(target, id, text)
}


/**
== Callout
:callout: => #comp.<name>(<capt>)

Creates a highly customizable callout box.
**/
#let callout(
  icon: "information-circle", /// <- string
    /// Icon name, as set by #url("https://heroicons.com/")[Heroicons]. |
  title: none, /// <- string | content | none
    /// Set title, if any. |
  text: (:), /// <- color | dictionary
    /// Text (`#text`) options; the special `text.title` set title options. |
  background: (:), /// <- color | dictionary
    /// Background style (`#block`) options. |
  body, /// <- content | string
    /// The callout content. |
) = {
  import "@preview/heroic:0.1.0": hi
  import "assets/orig.typ"
  
  if type(text) == color {text = (fill: text)}
  if type(background) == color {background = (fill: background)}
  
  let title-styling = text.remove("title", default: (:))
  
  assert.eq(
    type(text), dictionary,
    message: "#callout(text) must be dictionary"
  )
  assert.eq(
    type(title-styling), dictionary,
    message: "#callout(text.title) must be dictionary"
  )
  assert.eq(
    type(background), dictionary,
    message: "#callout(background) must be dictionary"
  )
  
  set orig.text(..text)
  
  title = hi(icon, solid: false) + " " + if title != none {title + linebreak()}
  title = orig.text(title, ..title-styling)
  
  pad(
    x: 1em,
    block(
      strong(title) + body,
      fill: gray.lighten(85%),
      width: 100%,
      outset: (x: 0.45em),
      inset: (y: 0.45em),
      ..background,
    )
  )
}
