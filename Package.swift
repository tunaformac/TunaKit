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
      url: "https://github.com/tunaformac/TunaKit/releases/download/v1.21.0/TunaKit-1.21.0.xcframework.zip",
      checksum: "daf636e6f3ce8788bd9cefb2398829d0ae75c54ece8093d6847fb42fb0b88137"
    )
  ]
)
