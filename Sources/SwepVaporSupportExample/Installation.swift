let installation = {
  return div {
    h2("Take it for a spin")
    p("""
    We've included a sample Vapor application in this repo to show off its usage. To run the app
    immediately, simply do:
    """)
    ul {
      li(code("swift run SwepVaporSupportExample"))
      li {
        text("Open your browser to ")
        code("http://localhost:8080")
      }
    }
    p("The HTML/CSS for that page is constructed and rendered with Swep!")
  }
}