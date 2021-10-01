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
  type t = string

  let toString = t => t
  let make = str => str
}

module UrlString: {
  type t
  let toString: t => string
  let make: string => t
} = {
  type t = string

  let toString = t => t
  let make = str => str
}

module PokemonType: {
  type t
  let make: string => option<t>
  let toString: t => string
} = {
  type t = Poison | Grass

  let make = str =>
    switch str {
    | "grass" => Some(Grass)
    | "poison" => Some(Poison)
    | _ => None
    }
  let toString = t =>
    switch t {
    | Grass => "grass"
    | Poison => "poison"
    }
}

// Record
type t = {name: NameString.t, url: UrlString.t}

@react.component
let make = (~pokemon) => {
  let name = pokemon.name |> NameString.toString |> React.string // Pipe last
  let url = pokemon.url |> UrlString.toString
  <div> <h3> {name} </h3> <a href={url}> {React.string("Lien")} </a> </div>
}
