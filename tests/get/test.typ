#import "/src/lib.typ": get
#set page(width: auto, height: auto, margin: 0pt)


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

// null value has a function type
#assert.eq(type(get.null), function)


#let dt = datetime.today()
// datetime value returns itself
#assert.eq( get.date(dt), dt )

#let dt = datetime(year: 2025, month: 1, day: 1)
// Year and defaults
#assert.eq( dt, get.date(2025)       )
#assert.eq( dt, get.date(year: 2025) )

#let dt = datetime(year: 2025, month: 5, day: 1)
// Year, month, and defaults
#assert.eq( dt, get.date(2025, 5)              )
#assert.eq( dt, get.date(year: 2025, month: 5) )
#assert.eq( dt, get.date(2025, month: 5)       )

#let dt = datetime(year: 2025, month: 5, day: 19)
// Year, month, and day
#assert.eq( dt, get.date(2025, 5, 19)                   )
#assert.eq( dt, get.date(year: 2025, month: 5, day: 19) )
#assert.eq( dt, get.date(2025, 5, day: 19)              )
#assert.eq( dt, get.date(2025, month: 5, day: 19)       )


// Conflicting years, months, and days
//#get.date(2025, year: 2024)
//#get.date(2025, 5, month: 12)
//#get.date(2025, 5, 19, day: 31)