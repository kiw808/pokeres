/*
let name =
  Data.data.results
  ->Belt.Array.get(0)
  ->Belt.Option.map(({name}) => name)
  ->Belt.Option.getWithDefault("Pikachu")
  ->PokeCard.NameString.make

let resultOption = Data.data.results->Belt.Array.get(0)
let name2 = switch resultOption {
| Some({name}) => name
| None => "Pikachu"
}->PokeCard.NameString.make

let url =
  Data.data.results
  ->Belt.Array.get(0)
  ->Belt.Option.map(({url}) => url)
  ->Belt.Option.getWithDefault("#")
  ->PokeCard.UrlString.make

Js.log(name)
Js.log(url)

let pokemon: PokeCard.t = {
  name: name,
  url: url,
}
*/

let make: Fixtures.t => SinglePokemon.t = fixture => {
  let {name, species, types} = fixture
  let types = Belt.Array.map(types, pokeType => pokeType.\"type".name)
  {name: name, species: species.name, types: types}
}

let pokemon: SinglePokemon.t = make(Fixtures.data)

@react.component
let make = () => {
  <div> <SinglePokemon pokemon /> </div>
}
