#import "/src/lib.typ"
#set page(width: auto, height: auto, margin: 1em)

// Represent internal structure
#let all = (:)
#for item in dictionary(lib) {
  if type(item.at(1)) == module {
    let mod = dictionary(item.at(1))
    let children = ()
    
    for sub-item in mod.keys() {
      children.push(sub-item)
    }
    item.at(1) = children
  }
  
  all.insert(..item)
}
#raw(lang: "yaml", yaml.encode(all))