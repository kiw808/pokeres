type result = {
  name: string,
  url: string,
}
type t = {results: array<result>}

let data: t = %raw("require('./data/pokemons.json')")
