#let none-val(data) = {return data == none}


#let null(data) = {
  import "get.typ": null
  
  return data == null
}


#let empty(data) = {return ("", [], (), (:)).contains(data)}


#let context-val(data) = { return data.func() == [#context()].func() }


#let sequence(data) = { return data.func() == [*A* _B_].func() }

#let space(data) = { return data.func() == [ ].func() }


#let func(data, values) = {
  if type(values) != array {values = (values,)}
  
  for value in values {
    if data.func() == value {return true}
  }
  return false
}

#let type-orig = type
#let type(data, values) = {
  if type-orig(values) != array {values = (values,)}
  
  for value in values {
    if type-orig(data) == value {return true}
  }
  return false
}