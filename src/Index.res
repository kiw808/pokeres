%%raw("import './styles.css'")

switch(ReactDOM.querySelector("#root")) {
| Some(root) => ReactDOM.render(<App/>, root)
| None => ()
}