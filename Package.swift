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
      url: "https://github.com/tunaformac/TunaKit/releases/download/v1.22.0/TunaKit-1.22.0.xcframework.zip",
      checksum: "9e1565b06eee770ec70f360d38baf4606e8211408137561e807693da71aa5ccb"
    )
  ]
)
