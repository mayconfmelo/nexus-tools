/**
= Components Namespace
```typ
#import "@preview/toolbox: 0.1.0": comp
```

== URL Command
:url: => #comp.<name>(<capt>)

Creates a paper-friendly link, attached to a footnote containing the URL itself
to ensure readability when printed.

url <- string | label <required>
  URL set as link and shown in footnote.

data.pos() <- arguments
  The last argument is used as the link name (fallback to the URL itself) and
  the second-last one is a label set for future referencing.
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
== Package URL Command
```typ
#comp.pkg(url)
```
Generates paper-friendly links to packages from its URL. 
The package name is inferred from the last path from the URL slug (like `/path`)
or set using curly brackets (like `/{path}/path`).

url <- string
  Package URL.
**/
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

/**
== Callout Command
:callout: => #comp.<name>(<capt>)

Creates a customizable callout box.
**/
#let callout(
  icon: "information-circle", /// <- string
    /// Icon name, as set by #url("https://heroicons.com/")[Heroicons]. |
  title: none, /// <- string | content | none
    /// Set title, if any. |
  fill: gray.lighten(85%), /// <- color
    /// Set background color. |
  fill-text: auto, /// <- color
    /// Set text color. |
  body, /// <- content | string
    /// The callout content.
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