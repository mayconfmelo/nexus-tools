#import "/src/sub/main.typ": date
#set page(width: auto, height: auto)

#let dt = datetime.today()
// datetime value returns itself
#assert.eq( date(dt), dt )

#let dt = datetime(year: 2025, month: 1, day: 1)
// Year and defaults
#assert.eq( dt, date(2025) )
#assert.eq( dt, date(year: 2025) )

#let dt = datetime(year: 2025, month: 5, day: 1)
// Year, month, and defaults
#assert.eq( dt, date(2025, 5) )
#assert.eq( dt, date(year: 2025, month: 5) )
#assert.eq( dt, date(2025, month: 5) )

#let dt = datetime(year: 2025, month: 5, day: 19)
// Year, month, and day
#assert.eq( dt, date(2025, 5, 19) )
#assert.eq( dt, date(year: 2025, month: 5, day: 19) )
#assert.eq( dt, date(2025, 5, day: 19) )
#assert.eq( dt, date(2025, month: 5, day: 19) )

// Conflicting years, months, and days
//#date(2025, year: 2024)
//#date(2025, 5, month: 12)
//#date(2025, 5, 19, day: 31)