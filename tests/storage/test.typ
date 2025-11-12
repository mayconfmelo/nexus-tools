#import "/src/lib.typ": storage
#set page(width: auto, height: auto, margin: 1em)

// Set namespace used as storage
#storage.namespace("storage-test")
#context assert.eq( storage.this.get().namespace, "storage-test")

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
#context assert.eq( storage.get(), storage.this.get().at("storage-test") )

// YAML storage representation
#context raw(
  lang: "yaml",
  yaml.encode( storage.get())
)

// Final value of storage
#context assert.eq( storage.final(), storage.this.final().at("storage-test") )

// Reset storage
#storage.reset("New storage data")

#context assert.eq( storage.get(), "New storage data" )