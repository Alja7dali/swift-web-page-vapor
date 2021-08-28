let usage = {
  return div {
    h2("Usage")
    p("To use the plugin all you have to do is return a `Node` value from your router callback:")
    pre(#"""
    import Swep
    import Vapor
    import SwepVaporSupport
    let app = try Application()
    let router = try app.make(Router.self)
    router.get("/") { _ in
      h1("Hello, type-safe HTML/CSS on Vapor!")
        .color(.tomato)
        .padding(.px(20))
    }
    try app.run()
    """#)
  }
}