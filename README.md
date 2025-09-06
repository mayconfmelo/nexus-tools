# Developer's Toolbox

<center>

Implement and reutilize tools and components among projects in a easy way

[![Tests](https://github.com/mayconfmelo/toolbox/actions/workflows/tests.yml/badge.svg)](https://github.com/mayconfmelo/toolbox/actions/workflows/tests.yml)
[![Build](https://github.com/mayconfmelo/toolbox/actions/workflows/build.yml/badge.svg)](https://github.com/mayconfmelo/toolbox/actions/workflows/build.yml)
[![Spellcheck](https://github.com/mayconfmelo/toolbox/actions/workflows/spellcheck.yml/badge.svg)](https://github.com/mayconfmelo/toolbox/actions/workflows/spellcheck.yml)

</center>


## Quick Start

```typ
#import "@preview/toolbox:0.1.0": *
```

## Description

Easily implement frequently-used code through multiple projects. This package
was created as a development companion for my other Typst projects: it contains
basic code and structures that often appear in multiple projects and must be
manually rewritten each time — and therefore are hardly equal and homogeneous
among each other, even if they do the exactly same tasks. It do not intends to be
a full heavy-loaded general development toolbox, but a compartimentalization of
my other projects' shared features.


## More Information

- [Official manual](https://raw.githubusercontent.com/mayconfmelo/transl/refs/tags/1.1.0/docs/manual.pdf)
- [Example PDF result](https://raw.githubusercontent.com/mayconfmelo/transl/refs/tags/1.1.0/docs/example.pdf)
- [Example Typst code](https://github.com/mayconfmelo/transl/blob/1.1.0/template/main.typ)
- [Changelog](https://github.com/mayconfmelo/transl/blob/main/changelog.md)
- [Development setup](https://github.com/mayconfmelo/toolbox/blob/main/docs/dev.md)


## Feature List

- `#date()` creates a `datetime` using positional and/or named arguments
- `#default()` substitutes default Typst defaults
- `#storage` module manages a database
  - `this` access and change the database state
  - `add()` inserts a value, replacing or appending existing ones
  - `remove()` delete a value, replacing or appending existing ones
  - `get()` retrieves a value, or the entire database
  - `final()` retrieves the final database state
  - `reset()` substitutes the entire database
- `#comp` module provides visual components
  - `url()` adds a paper-friendly link (with footnote)
  - `pkg()` adds a general code package URL
  - `callout()` adds an customizable callout box
- `#get` expands Typst values
  - `null` is a special content-typed null value
  - `auto-val()` substitutes `auto` values
- `#has` provides attribute checks for different types
  - `field()` checks if a content has a given field
  - `key()` checks if a dictionary has a given key
  - `value()` checks if a dictionary has a given value
  - `item()` checks if a array has a given item value
- `#its` provides specific tests
  - `none-val()` checks if a value `none`
  - `null()` checks if a value is `#get.null`
  - `empty()` checks if a value is a empty
  - `context-val()` checks if a value is a `context()`
  - `sequence()` checks if value function is `sequence`
  - `space()` checks if value function is `space`
  - `func()` checks if value function is one of the given functions
  - `type()` checks if value type is one of the given types