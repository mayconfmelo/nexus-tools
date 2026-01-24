#import "/src/sub/main.typ": content2str
#set page(width: auto, height: auto, margin: 0pt)

// Convert contents
#assert.eq( "A", content2str[A]                          )
#assert.eq( "A B", content2str[*A* B]                    )
#assert.eq( "A B", content2str[*A* _B_]                  )
#assert.eq( "A B", content2str[$A$ $B$]                  )
#assert.eq( "A B", content2str[`A` ```typ B```]          )
#assert.eq( "A B", content2str[#link("X")[A] #link("B")] )
#assert.eq( "A B", content2str[#footnote[A] #quote[B]]   )
#assert.eq( "\n", content2str(linebreak())               )
#assert.eq( "\n\n", content2str(parbreak())              )

// Ignore non-textual elements
#assert.eq( "A", content2str[#v(1em)A#pagebreak()] )
#assert.eq( "A", content2str[A#rect()]             )