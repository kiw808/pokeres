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
    <h2> {React.string("Single Pokemon")} </h2>
    <div className="single-pokemon">
      <h3> {name} </h3>
      <h5> {React.string("Species:")} </h5>
      <p> {species} </p>
      <h5> {React.string("Types:")} </h5>
      <ul> {types} </ul>
    </div>
  </div>
}
