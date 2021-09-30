let add = (a, b) => a + b
let result = add(2, 3)
let result2 = add(2)(3)

// Fonction curry
let add2 = add(2)
let result3 = add2(3)

let substract = (a, b, c) => a - b - c

// Pipe first
let result4 = (2->substract(3))(-1)
// Pipe last
let result5 = (2 |> substract(3))(1)

Js.log2(result4, result5)

module PokeElement = {
  // Variant type
  type element = Fire | Water | Earth
  @react.component
  let make = (~element) => {
    switch element {
    | Fire => "Fire"
    | Water => "Water"
    | Earth => "Earth"
    }->React.string // Pipe first
  }
}

// Variant polymorphique
type size = [#XS | #M | #L]

// Shadow type
module NameString: {
  type t
  let toString: t => string
  let make: string => t
} = {
  type t =
    | GoodName(string)
    | BadName(string)

  let toString = t =>
    switch t {
    | GoodName(str) => "Good name :" ++ str
    | BadName(str) => "Bad name :" ++ str
    }
  let make = str => str === "Pierre" ? GoodName(str) : BadName(str)
}

// Record
type t = {
  name: NameString.t,
  size: size,
  elementType: PokeElement.element,
}

@react.component
let make = (~pokemon, ~image=?) => {
  let imageComponent = switch image {
  | Some(src) => <img src={src} />
  | None => React.null
  }
  let name = pokemon.name |> NameString.toString |> React.string // Pipe last
  <div>
    <h3> {name} </h3>
    imageComponent
    <PokeElement element=pokemon.elementType />
    {React.string((pokemon.size :> string))}
  </div>
}
