#import "/src/lib.typ": comp
#set page(width: 15cm, height: auto)

// standalone URL
#comp.url("https://example.com")

// URL with title
#comp.url("https://example.com")[URL]


// automatic pkg URL
#comp.pkg("https://github.com/mayconfmelo/toolbox")

// named pkg URL
#comp.pkg("https://github.com/{mayconfmelo/toolbox}")


// callout box with custom color fill
#comp.callout(lorem(30), fill: black.lighten(50%), fill-text: white)

// callout box
#comp.callout(lorem(30))

// callout box with title
#comp.callout(lorem(30), title: "Title")

// callout box with title and custom icon (https://heroicons.com/)
#comp.callout(lorem(30), title: "Title", icon: "exclamation-triangle")

#v(2cm)