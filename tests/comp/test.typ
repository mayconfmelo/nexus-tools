#import "/src/lib.typ": comp
#set page(width: 15cm, height: auto)

// Standalone URL
#comp.url("https://example.com")

// URL with title
#comp.url("https://example.com", <example>)[URL]

// URL by label
#comp.url(<example>)
(uses label)


#line()


// Automatic package URL
#comp.pkg("https://github.com/mayconfmelo/toolbox")

// Named package URL
#comp.pkg("https://github.com/{mayconfmelo/toolbox}", <toolbox>)

// Package by label
#comp.pkg(<toolbox>)
(uses label)


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