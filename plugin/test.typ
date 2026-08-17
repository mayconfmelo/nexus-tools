#let plugin = plugin("target/wasm32-unknown-unknown/release/plugin.wasm")

#let date-difference(start, end) = {
  cbor(
    plugin.date_difference(
      bytes(start),
      bytes(end),
    )
  )
}

#let diff = date-difference(
  "2020-5-1",
  "2026-8-1",
)

#diff.years years\
#diff.months months\
#diff.days days\
