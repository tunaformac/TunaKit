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
      url: "https://github.com/tunaformac/TunaKit/releases/download/v1.10.0/TunaKit-1.10.0.xcframework.zip",
      checksum: "6573629481607738467451d82a4e59b4f1c8a3c9624dd12374090307a5f5c201"
    )
  ]
)
