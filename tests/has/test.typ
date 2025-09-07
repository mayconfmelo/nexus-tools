#import "/src/lib.typ": has
#import "assets/test-module.typ"
#set page(width: auto, height: auto)

// Check if content has field
#assert( has.field([A], "text") )
#assert( has.field([A], ("body", "text")) )
#assert( has.field([A], "body") != true )

// Check if dictionary has key
#assert( has.key((foo: 1), "foo") )
#assert( has.key((foo: 1), ("bar", "foo")) )
#assert( has.key((foo: 1), "bar") != true )

// Check if module has key (identifier)
#assert( has.key(test-module, "func") )

// Check if dictionary has value
#assert( has.value((foo: 1), 1) )
#assert( has.value((foo: 1), (0, 1)) )
#assert( has.value((foo: 1), 0) != true )

// Check if module has value (function, value, etc.)
#assert( has.value(test-module, test-module.func) )

// Check if array has item
#assert( has.item((1, 2), 1) )
#assert( has.item((1, 2), (0, 1)) )
#assert( has.item((1, 2), 0) != true )