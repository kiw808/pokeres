module ListFixture = {
  type pokemon = {
    name: string,
    url: string,
  }

  type t = {results: array<pokemon>}

  // Building the list of pokemons
  let toList: t => PokemonList.t = fixture => {
    let {results} = fixture
    let pokemonsList = Belt.Array.mapWithIndex(results, (index, pokemon): PokemonList.pokemon => {
      id: index + 1,
      name: pokemon.name,
      url: pokemon.url,
    })
    {pokemonsList}
  }
}

module SinglePokemonFixture = {
  type species = {
    name: option<string>,
    url: string,
  }

  type pokeTypeData = {
    name: string,
    url: string,
  }

  type pokeType = {
    slot: int,
    \"type": pokeTypeData,
  }

  type t = {id: int, name: string, species: species, types: array<pokeType>}

  // Building a single pokemon
  let toPokemon: t => Pokemon.t = fixture => {
    let {id, name, species, types} = fixture
    let types = Belt.Array.map(types, pokeType => pokeType.\"type".name)
    {id: id, name: name, species: species.name, types: types}
  }
}
