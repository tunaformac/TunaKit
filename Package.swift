// swift-tools-version: 6.0
import PackageDescription

let package = Package(
  name: "TunaKit",
  platforms: [.macOS(.v15)],
  products: [
    .library(name: "TunaKit", targets: ["TunaKit"])
  ],
  targets: [
    .binaryTarget(
      name: "TunaKit",
      url: "https://github.com/tunaformac/TunaKit/releases/download/v1.18.0/TunaKit-1.18.0.xcframework.zip",
      checksum: "912847ac5ba96ff0d32ecf75604ca6f0317ac74e73bf75609583a6d56f042a25"
    )
  ]
)
