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

let makeList: Fixtures.ListFixture.t => ListPokemons.t = fixture => {
  let {results} = fixture
  let pokemonsList = Belt.Array.mapWithIndex(results, (index, pokemon): ListPokemons.pokemon => {
    id: index + 1,
    name: pokemon.name,
    url: pokemon.url,
  })
  {pokemonsList}
}

let makeSinglePokemon: Fixtures.SinglePokemonFixture.t => SinglePokemon.t = fixture => {
  let {name, species, types} = fixture
  let types = Belt.Array.map(types, pokeType => pokeType.\"type".name)
  {name: name, species: species.name, types: types}
}

// Get the list of pokemons
let pokemonList: ListPokemons.t = makeList(Fixtures.ListFixture.data)
// Get a list of pokemons
let pokemon: SinglePokemon.t = makeSinglePokemon(Fixtures.SinglePokemonFixture.data)

@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()

  switch url.path {
  | list{} => <ListPokemons pokemonList />
  | list{"pokemon"} => <SinglePokemon pokemon />
  | _ => <NotFound />
  }
}
