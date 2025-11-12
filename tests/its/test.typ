#import "/src/lib.typ": its
#import "/src/lib.typ": get
#set page(width: auto, height: auto, margin: 0pt)

// Check none value
#assert( its.none-val(none) )
#assert( its.none-val([]) != true )

// Check null value
#assert( its.null(get.null) )
#assert( its.null("") != true )

// Check empty value
#assert( its.empty("") )
#assert( its.empty([]) )
#assert( its.empty(()) )
#assert( its.empty((:)) )

// Check context value
#assert( its.context-val(context()) )
#assert( its.context-val([]) != true )

// Check content sequence value
#assert( its.sequence([*A* _B_]) )
#assert( its.sequence([ ]) != true )

// Check content space value
#assert( its.space([ ]) )
#assert( its.space([A]) != true )

// Check value function
#assert( its.func([*A*], strong) )
#assert( its.func([*A*], (image, strong, emph)) )
#assert( its.func([*A*], image) != true )

// Check value type
#assert( its.type("", str) )
#assert( its.type("", (content, str, array)) )
#assert( its.type("", content) != true )
