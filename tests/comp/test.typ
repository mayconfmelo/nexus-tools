#import "/src/lib.typ": comp
#set page(width: 15cm, height: auto, margin: 1em)

// Standalone URL
#comp.url("https://example.com")

// URL with text
#comp.url("https://example.com")[URL with text]

// URL with label
#comp.url("https://example.com", <example>)[URL with label]

// URL by label
#comp.url(<example>)
(retrieved)


#line()


// Package URL with automatic text
#comp.pkg("https://github.com/mayconfmelo/nexus-tools")

// Package URL with text between {}
#comp.pkg("https://github.com/{mayconfmelo/nexus-tools}")

// Package URL with label
#comp.pkg("https://github.com/mayconfmelo", <author>)

// Package URL by label
#comp.pkg(<author>)
(retrieved)


#line()


// callout box
#comp.callout(lorem(28))

// callout box with title
#comp.callout(lorem(28), title: "Title")

// callout box with title and custom icon (https://heroicons.com/)
#comp.callout(lorem(28), title: "Title", icon: "exclamation-triangle")

// callout box with custom color fill
#comp.callout(lorem(28), background: black.lighten(50%), text: white)

// callout box with customized in GitHub-ish style
#comp.callout(
  lorem(28),
  title: "Note",
  text: ( title: (fill: blue) ),
  background: (
    fill: none,
    stroke: (left: 3pt + blue),
    outset: (left: 1em, bottom: 0.45em),
    inset: (left: 0pt),
  ),
)

#v(1cm)