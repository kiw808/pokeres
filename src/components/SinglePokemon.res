@react.component
let make = (~id) => {
  let (pokemon: option<Pokemon.t>, setPokemon) = React.useState(() => None)

  React.useEffect2(() => {
    Fetch.Pokemon.getById(id)
    |> Js.Promise.then_(pokemon => {
      setPokemon(_ => pokemon)
      Js.Promise.resolve()
    })
    |> ignore
    None
  }, (id, setPokemon))

  switch pokemon {
  | None => React.null
  | Some({name, species, types, image}) =>
    let name = name |> React.string
    let species = switch species {
    | Some(species) => React.string(species)
    | None => React.null
    }
    let types =
      types
      ->Belt.Array.mapWithIndex((index, pokeType) => {
        let key = Belt.Int.toString(index)
        <li key> {pokeType |> React.string} </li>
      })
      ->React.array

    // Link props bindings
    let url = "/"
    let str = "Back to list"

    <div>
      <h2> {React.string("Single Pokemon")} </h2>
      <div className="single-pokemon">
        <div> <img src={image} /> </div>
        <div>
          <h3> {name} </h3>
          <h5> {React.string("Species:")} </h5>
          <p> {species} </p>
          <h5> {React.string("Types:")} </h5>
          <ul> {types} </ul>
        </div>
      </div>
      <Link url str />
    </div>
  }
}
