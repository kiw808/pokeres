type t = {
  name: string,
  species: string,
}

@react.component
let make = (~pokemon) => {
  let name = pokemon.name |> React.string
  let species = pokemon.species |> React.string
  <div> {React.string("Single Pokemon")} <div> <h3> {name} </h3> <p> {species} </p> </div> </div>
}
