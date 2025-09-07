#import "sub/storage.typ"
#import "sub/comp.typ"
#import "sub/get.typ"
#import "sub/has.typ"
#import "sub/its.typ"

#import "sub/main.typ": *

/**#outline()
= Description

Easily implement frequently-used code through multiple projects. This package
was created as a development companion for my other Typst projects: it contains
basic code and structures that often appear in multiple projects and must be
manually rewritten each time — and therefore are hardly equal and homogeneous
among each other, even if they do the exactly same tasks. It do not intends to be
a full heavy-loaded general development toolbox, but a compartimentalization of
my other projects' shared features.

This manual contains a technical reference for the package, for practical
examples of usage refer to the `/tests/` folder content; the
`docs/assets/example.typ` file can also be helpful on basic usage.
**/