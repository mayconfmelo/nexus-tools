#import "/src/sub/main.typ": content2str
#set page(width: auto, height: auto, margin: 0pt)

// Simple text content
#assert.eq( "A", content2str[A] )

// Strip supported sequence contents
#assert.eq( "A B", content2str[*A* B]                    )
#assert.eq( "A B", content2str[*A* _B_]                  )
#assert.eq( "A B", content2str[`A` ```typ B```]          )
#assert.eq( "A B", content2str[#link("X")[A] #link("B")] )
#assert.eq( "A B", content2str[#footnote[A] #quote[B]]   )
#assert.eq( "\n", content2str(linebreak())   )

// Ignore unsupported sequence contents
#assert.eq( "A", content2str[A#parbreak()] )