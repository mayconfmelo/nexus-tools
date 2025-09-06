#import "/src/lib.typ": get
#set page(width: auto, height: auto)

// auto value turns into 42
#assert.eq( get.auto-value(auto, 42), 42 )

// non-auto value stays the same
#assert.eq( get.auto-value("foo", 42), "foo" )

// null value tests
#assert.eq(get.null, get.null)
#assert.ne(get.null, context())
#assert.ne(get.null, "")
#assert.ne(get.null, [])
#assert.ne(get.null, ())
#assert.ne(get.null, (:))

// null value has a content type
#assert.eq(type(get.null), content)