// Fetch uses a `Response` object that offers a `res.json()` function to retrieve
// a json result. We use a json based api, so we create a binding to access this feature.
module Response = {
  type t<'data>
  @send external json: t<'data> => Js.Promise.t<'data> = "json"
}

module Pokemon = {
  @val
  external fetch: (string, 'params) => Js.Promise.t<Response.t<Fixtures.SinglePokemonFixture.t>> =
    "fetch"

  @val
  external fetchList: (string, 'params) => Js.Promise.t<Response.t<Fixtures.ListFixture.t>> =
    "fetch"

  let getById = id =>
    fetch("https://pokeapi.co/api/v2/pokemon/" ++ id, None)
    |> Js.Promise.then_(response => Response.json(response))
    |> Js.Promise.then_(pokemon =>
      pokemon->Fixtures.SinglePokemonFixture.toPokemon->Some->Js.Promise.resolve
    )
    |> Js.Promise.catch(_ => Js.Promise.resolve(None))

  let getAll = () =>
    fetchList("https://pokeapi.co/api/v2/pokemon/", None)
    |> Js.Promise.then_(response => Response.json(response))
    |> Js.Promise.then_(pokemonList => {
      pokemonList->Fixtures.ListFixture.toList->Some->Js.Promise.resolve
    })
    |> Js.Promise.catch(_ => Js.Promise.resolve(None))
}
