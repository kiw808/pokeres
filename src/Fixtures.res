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
