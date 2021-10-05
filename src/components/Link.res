@react.component
let make = (~url, ~str) => {
  <a href={url}> {str |> React.string} </a>
}
