type pokemon = {name: string, url: string}

type t = array<string>

@react.component
let make = (~pokemonList) => {
  let pokemonList =
    Belt.Array.map(pokemonList, pokemon => <li> {pokemon |> React.string} </li>)->React.array
  <div> {React.string("List of pokemons")} <div> <ul> {pokemonList} </ul> </div> </div>
}
