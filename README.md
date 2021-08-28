
# 💧 swift-web-page-vapor

<p align="left">
  <img src="https://img.shields.io/badge/Swift_Version-5.1-orange.svg?style=flat&logo=Swift" alt="Swift Version: 5.1"/>
  <a href="https://swift.org/package-manager">
    <img src="https://img.shields.io/badge/SwiftPM-Compatible-darkgreen.svg?style=flat" alt="Swift Package Manager"/>
  </a>
    <img src="https://img.shields.io/badge/Platforms-macOS,%20iOS,%20Linux-darkgreen.svg?style=flat" alt="Swift Package Manager"/>
</p>

[Vapor](https://vapor.codes) plugin for type-safe HTML/CSS views using [Swep](https://github.com/alja7dali/swift-web-page).

## Motivation

The most popular choice for rendering HTML/CSS in a Vapor web app is to use the Leaf templating language, but it exposes your application to **runtime errors** and **invalid HTML/CSS**. Our plugin prevents these runtime issues at compile-time by embedding HTML/CSS directly into Swift’s powerful type system. It uses the [Swep](https://github.com/alja7dali/swift-web-page) DSL for constructing HTML/CSS documents using plain Swift data structures.

## Usage

To use the plugin all you have to do is return a `Document` or `Stylesheet` value from your router callback:

``` swift
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
```

## Take it for a spin

We've included a sample Vapor application in this repo to show off its usage. To run the app immediately, simply do:

* `swift run SwepVaporSupportExample`
* Open your browser to `http://localhost:8080`

The HTML/CSS for that page is constructed and rendered with Swep!!

## Installation

### Swift Package Manager (SPM)

If you want to use *swift-web-page-vapor* in a project that uses [SPM](https://swift.org/package-manager/), it's as simple as adding a `dependencies` clause to your `Package.swift`:

``` swift
dependencies: [
  .package(url: "https://github.com/alja7dali/swift-web-page-vapor.git", from: "0.0.1")
]
```

From there you can add `SwepVaporSupport` as target dependencies.

``` swift
let SwepVaporSupport: Target.Dependency = .product(name: "SwepVaporSupport", package: "swift-web-page-vapor")
...
targets: [
  .target(name: "yourProject", dependencies: [SwepVaporSupport]),
]
```

## License

All modules are released under the MIT license. See [LICENSE](./LICENSE.md) for details.