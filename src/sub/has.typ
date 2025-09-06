
#let field(data, values) = {
  assert.eq(type(data), content)
  
  if type(values) != array {values = (values,)}
  
  for value in values {
    if data.at(value, default: "") != "" {return true}
  }
  return false
}


#let key(data, values) = {
  assert.eq(type(data), dictionary)
  
  if type(values) != array {values = (values,)}
  
  for value in values {
    if data.keys().contains(value) {return true}
  }
  return false
}

#let value(data, values) = {
  assert.eq(type(data), dictionary)
  
  if type(values) != array {values = (values,)}
  
  for value in values {
    if data.values().contains(value) {return true}
  }
  return false
}


#let item(data, values) = {
  assert.eq(type(data), array)
  
  if type(values) != array {values = (values,)}
  
  for value in values {
    if data.contains(value) {return true}
  }
  return false
}