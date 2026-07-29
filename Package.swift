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
      url: "https://github.com/tunaformac/TunaKit/releases/download/v1.15.0/TunaKit-1.15.0.xcframework.zip",
      checksum: "ab9a1292d332931be031e0aa5d31f6ee9735d89327c268ef9eec20c741645e0c"
    )
  ]
)
