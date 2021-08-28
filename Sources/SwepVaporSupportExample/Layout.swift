let pages = [
  ("/", "Home"),
  ("/usage", "Usage"),
  ("/advanced-usage", "Advanced Usage"),
  ("/installation", "Installation"),
]

// A node that represents the header to use on each page.
let makeHeader = {
  return header {
    h1("swift-web-page-vapor")
    blockquote {
      text("A Vapor plugin for type-safe HTML/CSS views using ")
      a("Swep")
        .href("https://github.com/alja7dali/swift-web-page")
      ul {
        for (path, title) in pages {
          li(a(title).href(path))
        }
      }
    }
  }
}

// Functions that take nodes as input and return a new node can serve the purpose that "layouts" do in
// most templating languages. You can have this function take additional arguments in order to customize
// the layout, such as title and meta tags.
func layout<T: HtmlNode & ChildOfAny>(title pageTitle: String, content pageContent: () -> T) -> Document {
  return document {
    html {
      head {
        title(pageTitle)
        // You can include inline stylesheets
        makeStyle()
        // Or link to external stylesheets
        //link()
        //  .rel(.stylesheet)
        //  .href("myStyle.min.css")
        link()
          .rel(.stylesheet)
          .href("https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/cerulean/bootstrap.min.css")
      }
      body {
        makeHeader()
        main(pageContent())
        hr()
        footer("© 2021 Alja7dali")
        // Load external scripts at the bottom of the document.
        script()
          .async(true)
          .src("https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js")
      }
    }
  }
}