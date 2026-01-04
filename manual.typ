#import "@preview/min-manual:0.3.0": manual, arg, univ, url

#show: manual.with(
  title: "Developer's Toolbox",
  description: "",
  authors: "Maycon F. Melo <@mayconfmelo>",
  package: "toolbox:0.1.0",
  license: "MIT",
  logo: image("docs/assets/manual-logo.png"),
  from-comments:
    read("src/lib.typ") +
    read("src/sub/main.typ") +
    read("src/sub/storage.typ") +
    read("src/sub/comp.typ") +
    read("src/sub/get.typ") +
    read("src/sub/has.typ") + 
    read("src/sub/its.typ")
)


= Copyright

Copyright #sym.copyright #datetime.today().year() Maycon F. Melo. \
This manual is licensed under MIT. \
The manual source code is free software: you are free to change and redistribute
it.  There is NO WARRANTY, to the extent permitted by law.

The logo was obtained from #link("https://flaticon.com")[Flaticon] website.

The Fluent support is a fork of a #univ("linguify") feature, and all the overall
project concept is heavily inspired in this great package.