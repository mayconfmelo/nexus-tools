/**
= Main Namespace
```typ
#import "@preview/toolbox:0.1.0"
```

== Date Command
:date:

Create a `datetime` date from named and/or positional arguments, combined or not.
Panics if two values are set for the same thing, like `data.pos().at(0)` and also
`data.named().year`.

..date <- arguments <required>
  `(year, month, day)`\
  Date data, like year, month, and day. Fallback to the current year, month 1,
  and day 1 when not set.
**/
#let date(..date) = {
  if type(date.pos().at(0, default: "")) == datetime {return date.pos().at(0)}
  
  let pos = date.pos()
  let named = date.named()
  let named-keys = named.keys()
  
  if named-keys.contains("year") and pos.len() > 0 {
    panic("Duplicated positional and named year defined")
  }
  if named-keys.contains("month") and pos.len() > 1 {
    panic("Duplicated positional and named month defined")
  }
  if named-keys.contains("day") and pos.len() > 2 {
    panic("Duplicated positional and named day defined")
  }
  
  let values = (
    year: named.at("year",
      default: pos.at(0,
        default: datetime.today().year()
      )
    ),
    month: named.at("month",
      default: pos.at(1,
        default: 1
      )
    ),
    day: named.at("day",
      default: pos.at(2,
        default: 1
      )
    ),
  )
  
  datetime(
    year: values.year,
    month: values.month,
    day: values.day
  )
}


/**
== Default Command
:default:

Substitute the original defaults for custom ones, allowing to set new defaults
that can be easily changed using `set` rules.
**/
#let default(
  when: false, /// <- boolean
    /** Test whether the original default is currently being used. Allow to set
    custom defaults when it returns `true`. |**/
  value: none, /// <- dictionary | any
    /// Custom default to be returned. Generally a dictionary with option name and value. |
  original, /// <- boolean
    /// Use original defaults instead of the custom ones. |
) = {
  if when and not original {return value}
  else {arguments()}
}