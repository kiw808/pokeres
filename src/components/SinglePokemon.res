// module PokeTypes = {
//   type t = Grass | Poison
//   let poketype = t =>
//     switch t {
//     | "grass" => Some(Grass)
//     | "poison" => Some(Poison)
//     | _ => None
//     }
// }

type t = {
  name: string,
  species: string,
  types: array<string>,
}

@react.component
let make = (~pokemon) => {
  let name = pokemon.name |> React.string
  let species = pokemon.species |> React.string
  let types =
    pokemon.types->Belt.Array.map(pokeType => <li> {pokeType |> React.string} </li>)->React.array
  <div>
    {React.string("Single Pokemon")}
    <div> <h3> {name} </h3> <p> {species} </p> <ul> {types} </ul> </div>
  </div>
}
