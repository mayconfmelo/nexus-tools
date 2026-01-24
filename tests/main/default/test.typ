#import "/src/sub/main.typ": default
#set page(width: auto, height: auto, margin: 0pt) 

#set outline(indent: 5em) // overrides custom default (lines 46-50)

#context {
  set par(
    // Set #par.justify as true when default
    ..default(
      when: par.justify == false,
      value: (justify: true),
      false
    )
  )
  set text(
    // Set #text.size as 11pt when default
    ..default(
      when: text.size == 11pt,
      value: (size: 23pt),
      false
    ),
    // Set #text.weight as regular when default
    ..default(
      when: text.weight == "regular",
      value: (weight: "bold"),
      true // disabled
    ),
  )
  set rect(
    // Set #rect.fill as red when default; otherwise set as #rect.fill
    fill: default(
      when: rect.fill == none,
      value: red,
      otherwise: rect.fill,
      false
    )
  )
  
  context assert.eq(par.justify, true)
  context assert.eq(text.size, 23pt)
  context assert.eq(text.weight, "regular")
  context assert.eq(rect.fill, red)
  
  set outline(
    // Overriden: Set #outline.indent as 12pt when default
    ..default(
      when: outline.indent == auto,  // false (line 4)
      value: (outline: 12pt),
      false
    ),
  )
  
  context assert.eq(outline.indent, 5em)
}