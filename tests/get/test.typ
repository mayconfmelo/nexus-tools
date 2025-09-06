#import "/src/lib.typ": get
#set page(width: auto, height: auto)

// auto value turns into 42
#assert.eq( get.auto-val(auto, 42), 42 )

// non-auto value stays the same
#assert.eq( get.auto-val("foo", 42), "foo" )

// null value tests
#assert.eq(get.null, get.null)
#assert.ne(get.null, context())
#assert.ne(get.null, "")
#assert.ne(get.null, [])
#assert.ne(get.null, ())
#assert.ne(get.null, (:))

// null value has a content type
#assert.eq(type(get.null), content)