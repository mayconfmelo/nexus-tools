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

Allows to substitute the original defaults for custom ones, allowing to set new
defaults that can be easily changed using `set` rules — for example, change
default font from _Libertinus Serif_ to _Comic Sans_.#footnote[Sorry, designers.]
**/
#let default(
  when: false, /// <- boolean
    /// Test whether the original default is currently being used. |
  value: (:), /// <- dictionary | any
    /// Custom default, set when the original default is being used. |
  otherwise: (:), /// <- dictionary | any
    /// Alternative value, set when the original default is not being used. |
  original, /// <- boolean
    /// Use original defaults instead of the custom ones. |
) = {
  /**
  This command is commonly used inside `set` rules, and might require `#context`
  to access some defaults data for `#default(when)` test.
  **/
  if when and not original {return value}
  else {return otherwise}
}


/**
= Content to String Command
:content2str:
Convert simple text content into string.

data <- content
  Content data.
**/
// TODO: try to convert sequences
#let content2str(data) = {
  if type(data) != content {data = [#data]}
  
  if data.at("text", default: none) != none {return data.text}
  else {
    let data = data.at("children", default: (data.at("body", default: data),))
    let output = ""
    
    for elem in data {
      elem = elem.at("text", default: elem.at("body", default: elem))
      
      if type(elem) != str {
        if elem.at("text", default: none) != none {
          output += elem.text
          continue
        }
        
        if elem.at("children", default: none) != none {elem = content2str(elem)}
        else if elem.func() == linebreak {elem = "\n"}
        else if elem == [ ] {elem = " "}
      }
      
      if type(elem) == str {output += elem}
    }
    
    assert.ne(output, "", message: repr(data) + " can't be converted to string")
    
    return output
  }
}