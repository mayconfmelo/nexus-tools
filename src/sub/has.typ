/**
= Has Namespace
```typ
#import "@preview/toolbox: 0.1.0": has
```

== Field Command
:field: => #has.<name>(<capt>)

Check if content has a given field.
 
data <- string
  The content itself.

values <- string | array of strings
  One or more field names.
**/
#let field(data, values) = {
  assert.eq(type(data), content)
  
  if type(values) != array {values = (values,)}
  
  for value in values {
    if data.at(value, default: "") != "" {return true}
  }
  return false
}


/**
== Key Command
:key: => #has.<name>(<capt>)

Check if dictionary or module has a given key.

data <- string
  The dictionary or module itself.

values <- string | array of strings
  One or more key names.
**/
#let key(data, values) = {
  assert(type(data) == dictionary or type(data) == module)
  
  if type(data) == module {data = dictionary(data)}
  if type(values) != array {values = (values,)}
  
  for value in values {
    if data.keys().contains(value) {return true}
  }
  return false
}

/**
== Value Command
:key: => #has.<name>(<capt>)

Check if dictionary or module has a given value.

data <- string
  The dictionary ir module itself.

values <- string | array
  One or more values.
**/
#let value(data, values) = {
  assert(type(data) == dictionary or type(data) == module)
  
  if type(data) == module {data = dictionary(data)}
  if type(values) != array {values = (values,)}
  
  for value in values {
    if data.values().contains(value) {return true}
  }
  return false
}


/**
== Item Command
:key: => #has.<name>(<capt>)

Check if array has a given item.

data <- string
  The array itself.

values <- string | array of strings
  One or more field names.
**/
#let item(data, values) = {
  assert.eq(type(data), array)
  
  if type(values) != array {values = (values,)}
  
  for value in values {
    if data.contains(value) {return true}
  }
  return false
}