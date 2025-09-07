/**
= Get Namespace
```typ
#import "@preview/toolbox: 0.1.0": get
```

== Null Value
```typ
#get.null
```
A null value that matches only itself. Useful as substitute for `none` default
values, as it is truly unique and not naturally returned by anything in Typst.
**/
#let null() = [#sym.zws#sym.zwnj#sym.zws#sym.zwnj#sym.zws]

/**
== Auto Value Changer Command
:auto-val: => #get.<name>(<capt>)

Resolve an `auto` value by replacing it by a custom one only when it is `auto`;
otherwise the value is not changed.
**/
#let auto-val(
  origin, /// <- auto | any
    /// Value to check if it is `auto`. |
  replace, /// <- any
    /// Value to replace the origin. Ignored when it is not `auto`.
) = {
  if origin == auto {return replace}
  else {return origin}
}