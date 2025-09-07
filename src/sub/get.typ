#let null() = [#sym.zws#sym.zwnj#sym.zws#sym.zwnj#sym.zws]


#let auto-val(
  origin,
  replace,
) = {
  if origin == auto {return replace}
  else {return origin}
}