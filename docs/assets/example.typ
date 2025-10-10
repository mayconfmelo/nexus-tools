#import "@preview/toolbox:0.0.1"
#set page(width: 15cm, height: auto)

// Visualize code and evaluate result
#show raw.where(lang: "eg"): it => {
  import "@preview/min-manual:0.2.1": example
  set text(font: "libertinus serif")
  example(
    scope: dictionary(toolbox), it.text
  )
}


= Main

== Date

```eg
#date(2025)
```

```eg
#date(2025, 9)
```

```eg
#date(2025, 9, 5)
```

```eg
#date(2025, month: 9, day: 5)
```

== Default

```eg
#context [
  #set text(
    ..default(
      when: text.fill == luma(0%),
      value: (fill: red), false
    )
  )
  Default `#text.fill` set to `red`.
]
```


#pagebreak()


= Storage

```eg
#storage.add("string", "foo")
#storage.add("integer", 42)
#storage.add("dictionary", (foo: 1, bar: 2))
#storage.add("array", (1, 2))

#context raw(
  lang: "yaml",
  yaml.encode(storage.get())
)
```


#pagebreak()


= Components

```eg
#comp.url("https://example.com")[URL]
```

```eg
#comp.pkg("https://github.com/{mayconfmelo/toolbox}")
```

```eg
#comp.callout(lorem(6))
```


#pagebreak()


= Get

== Null
```eg
#get.null
```

== Auto value
```eg
#get.auto-val(auto, 42)\
#get.auto-val([AB], 42)
```


#pagebreak()


= Has

== Field
```eg
#has.field([A B], "text")\
#has.field([A B], "body")
```

== Key
```eg
#has.key((foo: 1), "foo")\
#has.key((foo: 1), "bar")
```

== Value
```eg
#has.value((foo: 1), 1)\
#has.value((foo: 1), 2)
```

== Item
```eg
#has.item((0, 1), 1)\
#has.item((0, 1), 2)
```


#pagebreak()


= It's

== None value
```eg
#its.none-val(none)\
#its.none-val(auto)
```

== Null
```eg
#its.null(get.null)\
#its.null("string")
```

== Empty
```eg
#its.empty("")\
#its.empty([ ])
```

== Context value
```eg
#its.context-val(context())\
#its.context-val([content])
```

== Sequence content
```eg
#its.sequence([*A* _B_])\
#its.sequence([A B])
```

== Space content
```eg
#its.space([ ])\
#its.space([])
```

== Function
```eg
#its.func([*A*], (image, strong))\
#its.func([_A_], (image, strong))
```

== Type
```eg
#its.type("string", (array, str))\
#its.type(content, (array, str))
```