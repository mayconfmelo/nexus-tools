# Developer's Toolbox

<div align="center">

<p class="hidden">
Implement and reutilize tools and components among projects in a easy way
</p>

<p class="hidden">
  <a href="https://typst.app/universe/package/toolbox">
    <img src="https://img.shields.io/badge/dynamic/xml?url=https%3A%2F%2Ftypst.app%2Funiverse%2Fpackage%2Ftoolbox&query=%2Fhtml%2Fbody%2Fdiv%2Fmain%2Fdiv%5B2%5D%2Faside%2Fsection%5B2%5D%2Fdl%2Fdd%5B3%5D&logo=typst&label=Universe&color=%23239DAE&labelColor=%23353c44" /></a>
  <a href="https://github.com/mayconfmelo/toolbox/tree/dev/">
    <img src="https://img.shields.io/badge/dynamic/toml?url=https%3A%2F%2Fraw.githubusercontent.com%2Fmayconfmelo%2Ftoolbox%2Frefs%2Fheads%2Fdev%2Ftypst.toml&query=%24.package.version&logo=github&label=Development&logoColor=%2397978e&color=%23239DAE&labelColor=%23353c44" /></a>
</p>

[![Manual](https://img.shields.io/badge/Manual-%23353c44)](https://raw.githubusercontent.com/mayconfmelo/toolbox/refs/tags/0.0.1/docs/manual.pdf)
[![Example PDF](https://img.shields.io/badge/Example-PDF-%23777?labelColor=%23353c44)](https://raw.githubusercontent.com/mayconfmelo/toolbox/refs/tags/0.0.1/docs/example.pdf)
[![Example SRC](https://img.shields.io/badge/Example-SRC-%23777?labelColor=%23353c44)](https://github.com/mayconfmelo/toolbox/blob/0.0.1/docs/assets/example.typ)
[![Changelog](https://img.shields.io/badge/Changelog-%23353c44)](https://github.com/mayconfmelo/toolbox/blob/main/docs/changelog.md)
[![Contribute](https://img.shields.io/badge/Contribute-%23353c44)](https://github.com/mayconfmelo/toolbox/blob/main/docs/contributing.md)


<p class="hidden">

[![Tests](https://github.com/mayconfmelo/toolbox/actions/workflows/tests.yml/badge.svg)](https://github.com/mayconfmelo/toolbox/actions/workflows/tests.yml)
[![Build](https://github.com/mayconfmelo/toolbox/actions/workflows/build.yml/badge.svg)](https://github.com/mayconfmelo/toolbox/actions/workflows/build.yml)
[![Spellcheck](https://github.com/mayconfmelo/toolbox/actions/workflows/spellcheck.yml/badge.svg)](https://github.com/mayconfmelo/toolbox/actions/workflows/spellcheck.yml)

</p>
</div>


## Quick Start

```typ
#import "@preview/toolbox:0.0.1": *
```

## Description

Easily implement frequently-used code through multiple projects. This package
was created as a development companion for my other Typst projects: it contains
basic code and structures that often appear in multiple projects and must be
manually rewritten each time — and therefore are hardly equal and homogeneous
among each other, even if they do the exactly same tasks. It do not intends to be
a full heavy-loaded general development toolbox, but a compartimentalization of
my other projects' shared features.


## Feature List

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


### Internal Structure

![YAML structure](tests/representation/out/1.png)

This is a YAML representation of the package internal structure and all its
features.