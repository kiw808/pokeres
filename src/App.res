let name =
  Data.data.results
  ->Belt.Array.get(0)
  ->Belt.Option.map(({name}) => name)
  ->Belt.Option.map(Js.String.concat("toto"))
  ->Belt.Option.getWithDefault("Pikachu")
  ->PokeCard.NameString.make

let resultOption = Data.data.results->Belt.Array.get(0)
let name2 = switch resultOption {
| Some({name}) => name
| None => "Pikachu"
}->PokeCard.NameString.make

let pokemon: PokeCard.t = {
  name: name,
  size: #XS,
  elementType: PokeCard.PokeElement.Fire,
}

@react.component
let make = () => {
  <div> <PokeCard pokemon /> </div>
}
