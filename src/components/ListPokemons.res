type pokemon = {id: int, name: string, url: string}

type t = array<pokemon>

@react.component
let make = (~pokemonList: t) => {
  let entryPoint = "/pokemon/"

  let pokemonList = Belt.Array.map(pokemonList, pokemon => {
    let url = entryPoint ++ pokemon.id->Belt.Int.toString
    let str = pokemon.name

    <li> <Link url str /> </li>
  })->React.array

  <div> {React.string("List of pokemons")} <div> <ul> {pokemonList} </ul> </div> </div>
}
