// swift-tools-version:5.3
import PackageDescription

let Swep:  Target.Dependency = .product(name: "Swep", package: "swift-web-page")
let Vapor: Target.Dependency = .product(name: "Vapor", package: "vapor")

let supportedPlatforms: Optional<Array<SupportedPlatform>>

#if os(macOS) || os(iOS) || os(tvOS) || os(watchOS)
supportedPlatforms = [
  .macOS(.v10_15),
  .iOS(.v13),
  .tvOS(.v13),
  .watchOS(.v6)
]
#else
supportedPlatforms = nil
#endif

let package = Package(
  name: "swift-web-page-vapor",
  platforms: supportedPlatforms,
  products: [
    .library(name: "SwepVaporSupport", targets: ["SwepVaporSupport"]),
    .executable(name: "SwepVaporSupportExample", targets: ["SwepVaporSupportExample"]),
  ],
  dependencies: [
    .package(url: "https://github.com/alja7dali/swift-web-page", from: "0.0.1"),
    .package(url: "https://github.com/vapor/vapor", from: "4.0.0"),
  ],
  targets: [
    .target(name: "SwepVaporSupport", dependencies: [Swep, Vapor]),
    .target(name: "SwepVaporSupportExample", dependencies: [Swep, Vapor, "SwepVaporSupport"]),
    .testTarget(name: "SwepVaporSupportTests", dependencies: ["SwepVaporSupport"]),
  ],
  swiftLanguageVersions: [
    .version("5"),
  ]
)
