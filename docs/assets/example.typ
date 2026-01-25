#import "@preview/toolbox:0.1.0"
#set page(width: 15cm, height: auto)

// Visualize code and evaluate result
#show raw.where(lang: "eg"): it => {
  import "@preview/min-manual:0.3.0": example
  set text(font: "libertinus serif")
  example(
    scope: dictionary(toolbox), it.text
  )
}


= Main


== Default

```eg
#let test(description) = {
  set text(
    ..default(
      when: text.fill == luma(0%),
      value: (fill: red), false
    )
  )
  description
}
  
#context test[Custom default.]
  
#set text(fill: blue)
#context test[Default overridden.]

```

```eg
#repr(
  content2str[ *Foo* #emph[Bar] Baz ]
)
```


#pagebreak()


= Storage

```eg
#storage.add("foo", 42)
#storage.add("bar", (a: 1))
#storage.add("bar", (b: 2), append: true)
#storage.add("baz", 1)
#storage.add("baz", 2, append: true)
#storage.add("qux", 3)
#storage.remove("qux")

#context raw(yaml.encode(storage.get()), lang: "yaml")
```


#pagebreak()


= Components

```eg
#comp.url("eg@mail.com", <foo>)[URL]\
#comp.url(<foo>)
```

```eg
#comp.pkg("https://example.com/{name}/slug/")\
#comp.pkg("https://example.com/name", <bar>)\
#comp.pkg(<bar>)
```

```eg
#comp.callout(lorem(6))
#comp.callout(
  title: "Title",
  icon: "bars-3",
  lorem(6)
)
#comp.callout(
  text: white,
  background: blue,
  lorem(6)
)
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

== Date

```eg
#get.date(2025)
```

```eg
#get.date(2025, 9)
```

```eg
#get.date(2025, 9, 5)
```

```eg
#get.date(2025, month: 9, day: 5)
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