#import "sub/storage.typ"
#import "sub/comp.typ"
#import "sub/get.typ"
#import "sub/has.typ"
#import "sub/its.typ"

#import "sub/main.typ": *

/**#outline()
= Description

Easily implement some frequently used code across multiple projects in a unified
way. This package was created as part of the development of my #url(
"https://typst.app/universe/search/?q=author%3A%22Maycon%20F.%20Melo%22")[other
Typst projects]; it contains basic code and structures that frequently appear in
various projects and need to be manually rewritten each time — and therefore are
rarely identical and homogeneous, even if they perform exactly the same tasks.
It is not intended to be a full heavy-loaded development toolset, but rather a
compartmentalization of resources shared among my other projects.

This manual contains a technical reference, for practical examples  refer to the
`/tests/` folder; the `docs/assets/example.typ` and `docs/example.pdf` files can
also be helpful.
**/