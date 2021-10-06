type pokemon = {id: int, name: string, url: string}

type t = array<pokemon>

@react.component
let make = (~pokemonList: t) => {
  let entryPoint = "/pokemon/"

  let pokemonList = Belt.Array.map(pokemonList, pokemon => {
    let id = pokemon.id->Belt.Int.toString
    let url = entryPoint ++ id
    let str = pokemon.name

    <li key={id}> <Link url str /> </li>
  })->React.array

  <div> <h2> {React.string("List of pokemons")} </h2> <div> <ul> {pokemonList} </ul> </div> </div>
}
