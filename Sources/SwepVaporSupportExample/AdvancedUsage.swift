import Swep

let advancedUsage = {
  return div {
    h2("Advance Usage")
    p("Typically you will not want to reconstruct a full HTML/CSS document to be rendered for each of your routes. Instead you can build up lots of smaller HTML/CSS fragments and piece them together to make a larger document. For example, a persistent style and header for your site could be broken out into individual nodes:")
    pre("""
    // A node that represents the stylesheet to use on each page.
    let makeStyle = {
      return style {
        selector("body") {
          padding(.rem(0.5))
          lineHeight(1.35)
          fontFamily("SanFranciscoDisplay-Regular")
        }
        
        selector("blockquote") {
          borderLeft(width: .px(2), style: .solid, color: .hex(0x777))
          fontStyle(.italic)
          color(.hex(0x777))
          marginLeft(.rem(1))
          paddingLeft(.rem(0.5))
        }
        
        selector("pre") {
          backgroundColor(.hex(0xf3f3f3))
          padding(.rem(0.5))
          overflowX(.scroll)
        }
        
        selector("code") {
          backgroundColor(.hex(0xf3f3f3))
          padding(.rem(0.25))
        }
        
        selector("li:not(:last-child)") {
          marginBottom(.rem(0.25))
        }
        
        selector("h2") {
          marginTop(.rem(2))
          marginBottom(.px(0))
        }
      }
    }
    
    // A node that represents the header to use on each page.
    let makeHeader = {
      return header {
        h1("Swep")
        blockquote("A Swift DSL for writing type-safe HTML/CSS in SwiftUI way.")
        ul {
          li(a("Html").href("https://github.com/Alja7dali/swift-web-page/tree/master/Sources/Html"))
          li(a("Css").href("https://github.com/Alja7dali/swift-web-page/tree/master/Sources/Css"))
          li(a("HtmlCssSupport").href("https://github.com/Alja7dali/swift-web-page/tree/master/Sources/HtmlCssSupport"))
          li(a("README.md").href("https://github.com/Alja7dali/swift-web-page/blob/master/README.md"))
        }
      }
    }
    """)
    p("Then, to assemble the parts in a consistent manner we can simply create a function that takes a node as input, which represents the main, central content of your page, and it will return a new node, which is the fully constructed HTML/CSS page:")
    pre("""
    func layout<A: HtmlNode & ChildOfAny>(content pageContent: A) -> Document {
      return document {
        html {
          // Include inline stylesheets
          head(makeStyle)
          body {
            makeHeader()
            main(pageContent)
            hr()
            footer("© 2021 Alja7dali")
            // Load external scripts at the bottom of the document.
            script()
              .src("https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js")
          }
        }
      }
    }
    """)
    p("Now, in your router you can wrap the content that is specific to that page in your layout by just invoking the \(code("layout(content:)")) function:")
    pre("""
    import Swep
    import Vapor
    import SwepVaporSupport
    
    let app = try Application()
    let router = try app.make(Router.self)
    router.get("/about") { _ in
      layout(
        content: a("File an issue")
          .href("https://github.com/Alja7dali/swift-web-page/issues/new/choose")
          .color(.tomato)
      )
    }
    try app.run()
    """)
    p("Now a full HTML/CSS page will be rendered, including a \(code("head")) tag with stylesheets, a header with navigation links, the main content in the middle, and a footer with a copyright notice. The best part is that because everything is just simple Swift data we are free to arrange and compose this data in anyway we want. In particular, we are allowed to keep all of our helper nodes in the same file if we want, or we can break them out into multiple files if that works better for us. Compare that to templates where you are forced to always put views in a new file, no matter how tiny and insignificant it is.")
  }
}



