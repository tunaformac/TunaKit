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
      url: "https://github.com/tunaformac/TunaKit/releases/download/v1.16.1/TunaKit-1.16.1.xcframework.zip",
      checksum: "9a20b164bb9a4f44cd93cd1a9a8c19c3ca9fd56f1138ca6211f6eabbac7c79e4"
    )
  ]
)
