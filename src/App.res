// Building the list of pokemons
let makeList: Fixtures.ListFixture.t => ListPokemons.t = fixture => {
  let {results} = fixture
  let pokemonsList = Belt.Array.mapWithIndex(results, (index, pokemon): ListPokemons.pokemon => {
    id: index + 1,
    name: pokemon.name,
    url: pokemon.url,
  })
  {pokemonsList}
}

// Building a single pokemon
let makeSinglePokemon: Fixtures.SinglePokemonFixture.t => SinglePokemon.t = fixture => {
  let {name, species, types} = fixture
  let types = Belt.Array.map(types, pokeType => pokeType.\"type".name)
  {name: name, species: species.name, types: types}
}

// Get the list of pokemons
let pokemonList: ListPokemons.t = makeList(Fixtures.ListFixture.data)
// Get a single pokemon
let pokemon: SinglePokemon.t = makeSinglePokemon(Fixtures.SinglePokemonFixture.data)

@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()

  <div className="container">
    {switch url.path {
    | list{} => <ListPokemons pokemonList />
    | list{"pokemon"} => <SinglePokemon pokemon />
    | _ => <NotFound />
    }}
  </div>
}
