#import "/src/sub/main.typ": default
#set page(width: auto, height: auto)

#context {
  // Optional dictionary to manage #default arguments
  let defs = (
    justify: (
      when: par.justify == false,
      value: (justify: true)
    ),
    size: (
      when: text.size == 11pt,
      value: (size: 23pt)
    )
  )
  
  // Use original defaults
  let original = true
  
  set par(..default(..defs.justify, original))
  set text(..default(..defs.size, original))
  
  context assert.eq(text.size, 11pt)
  context assert.eq(par.justify, false)
  
  
  // Substitute original defaults
  let original = false
  
  set par(..default(..defs.justify, original))
  set text(..default(..defs.size, original))
  
  context assert.eq(text.size, defs.size.value.size)
  context assert.eq(par.justify, defs.justify.value.justify)
}