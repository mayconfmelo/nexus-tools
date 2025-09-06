#import "/src/lib.typ": storage
#set page(width: auto, height: auto)

// Add values of many types
#storage.add("string", "foo")
#storage.add("integer", 42)
#storage.add("dictionary", (foo: 1, bar: 2))
#storage.add("array", (1, 2))

// Append new values to the existing ones instead of replace them
#storage.add("dictionary", (baz: 3), append: true)
#storage.add("array", 3, append: true)


// Remove value
#storage.add("rm", 0)
#storage.remove("rm")

// Get a value from storage
#context assert.eq( storage.get("integer"), 42 )

// Get entire storage
#context assert.eq( storage.get(), storage.this.get() )

// YAML storage representation
#context raw(lang: "yaml", yaml.encode( storage.get() ))

// Final value of storage
#context assert.eq( storage.final(), storage.this.final() )

// Reset storage
#storage.reset("New storage data")

#context assert.eq( storage.get(), "New storage data" )