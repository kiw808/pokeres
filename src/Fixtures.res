module ListFixture = {
  type pokemon = {
    name: string,
    url: string,
  }

  type t = {results: array<pokemon>}

  let data: t = %raw("require('./data/pokemons.json')")
}

module SinglePokemonFixture = {
  type species = {
    name: string,
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

  type t = {name: string, species: species, types: array<pokeType>}

  let data: t = %raw("require('./data/pokemon.json')")
}
