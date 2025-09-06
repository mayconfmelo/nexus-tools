#let null = [#sym.zws#sym.zwnj#sym.zws#sym.zwnj#sym.zws]


#let auto-value(
  origin,
  replace,
) = {
  if origin == auto {return replace}
  else {return origin}
}