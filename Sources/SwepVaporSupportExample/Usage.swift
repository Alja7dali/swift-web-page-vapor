let usage = {
  return div {
    h2("Usage")
    p("To use the plugin all you have to do is return a `Document` or `Stylesheet` value from your router callback:")
    pre(#"""
    import Swep
    import Vapor
    import SwepVaporSupport
    
    var env = try Environment.detect()
    let app = Application(env)
    defer { app.shutdown() }
    
    app.get { _ in
      document {
        head {
          style {
            selector("*") {
              margin(.px(5))
              backgroundColor(.hex(0xd1d1d1))
            }
          }
          link()
            .rel(.stylesheet)
            .href("style.min.css")
        }
        body {
          h1("Hello, type-safe HTML/CSS on Vapor!")
            .color(.green)
        }
      }
    }
    
    app.get("style.min.css") {
      stylesheet {
        selector("body") {
          padding(.rem(0.5))
          lineHeight(1.35)
          fontFamily("SanFranciscoDisplay-Regular")
        }
        selector("h1") {
          marginTop(.rem(2))
          marginBottom(.px(0))
        }
      }
    }
    
    try app.run()
    """#)
  }
}