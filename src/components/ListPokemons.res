type pokemon = {id: int, name: string, url: string}

type t = array<pokemon>

@react.component
let make = (~pokemonList: t) => {
  let pokemonList =
    Belt.Array.map(pokemonList, pokemon => <li> {pokemon.name |> React.string} </li>)->React.array
  <div> {React.string("List of pokemons")} <div> <ul> {pokemonList} </ul> </div> </div>
}
