/**
= Main
```typ
#import "@preview/toolbox:0.1.0"
```

== Defaults
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
= Content to String
:content2str:
Convert simple text content into string.

data <- content
  Content data.
**/
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