

#let date(..date) = {
  if type(date.pos().at(0, default: "")) == datetime {return date.pos().at(0)}
  
  let pos = date.pos()
  let named = date.named()
  let named-keys = named.keys()
  
  if named-keys.contains("year") and pos.len() > 0 {
    panic("Duplicated positional and named year defined")
  }
  if named-keys.contains("month") and pos.len() > 1 {
    panic("Duplicated positional and named month defined")
  }
  if named-keys.contains("day") and pos.len() > 2 {
    panic("Duplicated positional and named day defined")
  }
  
  let values = (
    year: named.at("year",
      default: pos.at(0,
        default: datetime.today().year()
      )
    ),
    month: named.at("month",
      default: pos.at(1,
        default: 1
      )
    ),
    day: named.at("day",
      default: pos.at(2,
        default: 1
      )
    ),
  )
  
  datetime(
    year: values.year,
    month: values.month,
    day: values.day
  )
}


#let default(
  when: false,
  value: none,
  original,
) = {
  if when and not original {return value}
  else {arguments()}
}