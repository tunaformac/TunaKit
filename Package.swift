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
      url: "https://github.com/tunaformac/TunaKit/releases/download/v1.14.0/TunaKit-1.14.0.xcframework.zip",
      checksum: "553cc12591a2387bc7c1d8710f9309dd5c64d5b66c4bddedd51b0ebcfabcfb44"
    )
  ]
)
