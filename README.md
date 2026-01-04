# Developer's Toolbox

<div align="center">

<p class="hidden">
  Easily implement and reuse tools and components across projects.
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
  <a href="https://github.com/mayconfmelo/toolbox/actions/workflows/tests.yml">
    <img alt="Tests" src="https://github.com/mayconfmelo/toolbox/actions/workflows/tests.yml/badge.svg" /></a>
  <a href="https://github.com/mayconfmelo/toolbox/actions/workflows/build.yml">
    <img alt="Build" src="https://github.com/mayconfmelo/toolbox/actions/workflows/build.yml/badge.svg" /></a>
  <a href="https://github.com/mayconfmelo/toolbox/actions/workflows/spellcheck.yml">
    <img alt="Spellcheck" src="https://github.com/mayconfmelo/toolbox/actions/workflows/spellcheck.yml/badge.svg" /></a>
</p>
</div>


## Quick Start

```typ
#import "@preview/toolbox:0.0.1": *
```

## Description

Easily implement some frequently used code across multiple projects in a unified
way. This package was created as part of the development of [my other Typst
projects](https://typst.app/universe/search/?q=author%3A%22Maycon%20F.%20Melo%22);
it contains basic code and structures that frequently appear in various projects
and need to be manually rewritten each time — and therefore are rarely identical
and homogeneous, even if they perform exactly the same tasks. It is not intended
to be a full heavy-loaded development toolset, but rather a compartmentalization
of resources shared among my other projects.


## Feature List

- Defaults that can be overridden by _set_ rules
- General data storage
  - Storage compartmentalization (namespaces)
  - Add, append, and remove data
  - Retrieve individual data or whole namespaces
  - Reset namespaces
- Visual components
  - Paper-friendly links (attached to footnotes)
  - General package URLs
  - Customizable callout box
- Get Typst values
  - Generate datetime using positional and/or named arguments
  - Null value
  - Replacement of auto values
- Attribute checks
  - Content fields
  - Dictionary keys
  - Dictionary values
  - Array items
- Specific tests
  - None values
  - Null values
  - Empty values
  - Context values
  - Content sequences
  - Content spaces
  - Content functions
  - Any value types


### Internal Structure

![YAML structure](https://raw.githubusercontent.com/mayconfmelo/toolbox/refs/heads/main/tests/representation/out/1.png)

This is a YAML representation of the package internal structure and all its
features.