type species = {
  name: string,
  url: string,
}

type t = {name: string, species: species}

let data: t = %raw("require('./data/pokemon.json')")
