@react.component
let make = () => {
  let (pokemonList: option<PokemonList.t>, setPokemonList) = React.useState(() => None)

  React.useEffect(() => {
    Fetch.Pokemon.getAll()
    |> Js.Promise.then_(pokemonList => {
      setPokemonList(_ => pokemonList)
      Js.Promise.resolve()
    })
    |> ignore
    None
  })

  let url = RescriptReactRouter.useUrl()

  <div className="container">
    {switch url.path {
    | list{} =>
      switch pokemonList {
      | None => React.null
      | Some(pokemonList) => <ListPokemons pokemonList />
      }
    | list{"pokemon", id} => <SinglePokemon id />
    | _ => <NotFound />
    }}
  </div>
}
