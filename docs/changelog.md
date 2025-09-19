# 0.0.0

## 0.1.0

- `#date()` creates a `datetime` using positional and/or named arguments
- `#default()` substitutes default Typst defaults
- `#storage` manages a database to store anything
  - `namespace()` sets a separated space used as storage
  - `add()` inserts a value, replacing or appending existing ones
  - `remove()` delete a value
  - `get()` retrieves a value or the entire database
  - `final()` retrieves the final database state
  - `reset()` substitutes the entire database
- `#comp` provides visual components
  - `url()` adds a paper-friendly link (with footnote)
  - `pkg()` adds a general code package URL
  - `callout()` adds an customizable callout box
- `#get` expands Typst values
  - `null` is a alternative to `none` default values
  - `auto-val()` substitutes `auto` values
- `#has` provides attribute checks for different types
  - `field()` checks if a content has a given field
  - `key()` checks if a dictionary has a given key
  - `value()` checks if a dictionary has a given value
  - `item()` checks if a array has a given item value
- `#its` provides specific tests
  - `none-val()` checks if a value is `none`
  - `null()` checks if a value is `#get.null`
  - `empty()` checks if a value is empty
  - `context-val()` checks if a value is a opaque `context()`
  - `sequence()` checks if content function type is `sequence`
  - `space()` checks if content function type is `space`
  - `func()` checks if content function type is one of the given ones
  - `type()` checks if value type is one of the given ones
