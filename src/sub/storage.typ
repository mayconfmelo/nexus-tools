#let this = state("toolbox-data-storage", (:))

#let add(
  key,
  value,
  append: false,
) = {
  this.update(curr => {
    if curr == none {curr = (:)}
    
    let value = value
    
    if append {
      let val = curr.at(key, default: ())
      
      if type(val) == dictionary {
        assert.eq(
          type(value), dictionary,
          message: "Cannot insert " + repr(value) + " in " + repr(val)
        )
        
        for (key, value) in value.pairs() {
          val.insert(key, value)
        }
      }
      else {
        if type(value) != array {value = (value,)}
        if type(val) != array {val = (val,)}
        
        for item in value {
          val.push(item)
        }
      }
      value = val
    }
    curr.insert(str(key), value)
    
    return curr
  })
}

#let remove(key) = {
  this.update(curr => {
    if curr == none {curr = (:)}
    
    let _ = curr.remove(str(key), default: none)
    
    return curr
  })
}


#let get(..args) = {
  let key = args.pos().at(0, default: none)
  let default = args.pos().at(1, default: none)
  
  if key != none {return this.get().at(str(key), default: default)}
  else {return this.get()}
}


#let final() = {return this.final()}


#let reset(data) = {this.update(data)}