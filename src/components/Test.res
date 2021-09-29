@react.component
let make = (~message: string) => {
    <div>
        <h1>{React.string(message)}</h1>
    </div>
}