#let this = state("toolbox-data-storage", (:))

/**
= Storage Namespace
```typ
#import "preview/toolbox:0.1.0": storage
```

== Set Namespace Command
```typ
#storage.namespace(name)
```
Set the namespace used as storage. Namespaces allows multiple packages/templates
to use `#storage` at the same time, each accessing its own proper space.

name <- string
  Namespace name.
**/
#let namespace(name) = {
  assert.ne(
    name, "namespace",
    message: "Cannot use reserved 'namespace' name"
  )
  
  this.update(curr => {
    curr.insert("namespace", name)
    curr
  })
}


/**
== Add Command
:add: => #storage.<name>(<capt>)

Insert a new entry in the storage.
**/
#let add(
  key, /// <- string
    /// Storage entry name.
  value,
    /// Value to be stored.
  append: false,
    /// Append new value if entry already exists, otherwise replaces it.
) = {
  this.update(curr => {
    if curr == none {curr = (:)}
    
    let ns = curr.at("namespace", default: "std")
    let value = value
    
    if curr.at(ns, default: none) == none {curr.insert(ns, (:))}
    
    if append {
      let val = curr.at(ns).at(key, default: ())
      
      if type(val) == dictionary {
        assert.eq(
          type(value), dictionary,
          message: "Cannot insert " + repr(value) + " in " + repr(val)
        )
        
        for (key, value) in value.pairs() {
          val.insert(key, value)
        }
      }
      else if val == () and type(value) == dictionary {val = value}
      else {
        if type(value) != array {value = (value,)}
        if type(val) != array {val = (val,)}
        
        for item in value {
          val.push(item)
        }
      }
      value = val
    }
    curr.at(ns).insert(str(key), value)
    
    return curr
  })
}


/**
== Remove Command
:remove: => #storage.<name>(<capt>)

Removes an existing entry from storage.

key <- string
  Storage entry name.
**/
#let remove(key) = {
  this.update(curr => {
    if curr == none {curr = (:)}
    
    let ns = curr.at("namespace", default: "std")
    
    let _ = curr.at(ns).remove(str(key), default: none)
    
    return curr
  })
}

/**
== Get Command
:get: => #storage.<name>(<capt>)

Retrieves a value from storage, or the entire database itself.

args.pos() <- arguments
  The first argument is the storage entry and the second one a default value,
  returned if the storage entry is not found. If no argument is set, the whole
  storage database is returned.
**/
#let get(..args) = {
  let key = args.pos().at(0, default: none)
  let default = args.pos().at(1, default: none)
  let ns = this.get().at("namespace", default: "std")
  
  if key != none {
    return this.get()
      .at(ns, default: (:))
      .at(str(key), default: default)
  }
  else {return this.get().at(ns)}
}

/**
== Final Command
:final: => #storage.<name>(<capt>)

The final storage state. Returns the whole storage database.
**/
#let final(..args) = {
  let key = args.pos().at(0, default: none)
  let default = args.pos().at(1, default: none)
  let ns = this.get().at("namespace", default: "std")
  
  if key != none {return this.final().at(ns).at(str(key), default: default)}
  else {return this.final().at(ns)}
}

/**
== Reset Command
:reset: => #storage.<name>(<capt>)

Set a new value for the entire storage database. While it can be of any type, the
other storage commands can only be used if it is a `dictionary` value.

data <- dictionary | any
  New storage database value.
**/
#let reset(data) = {
  this.update(curr => {
    let ns = curr.at("namespace", default: "std")
    
    curr.at(ns) = data
    curr
  })
}