let home = {
  return div {
    p("""
    The most popular choice for rendering HTML/CSS in a Vapor web app is to use the Leaf templating language,
    but it exposes your application to runtime errors and invalid HTML/CSS. Our plugin prevents these
    runtime issues at compile-time by embedding HTML/CSS directly into Swift’s powerful type system.
    It uses the Swep DSL for constructing HTML/CSS documents using plain Swift data structures.
    """)
  }
}