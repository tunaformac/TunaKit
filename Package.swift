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
      url: "https://github.com/tunaformac/TunaKit/releases/download/v1.23.0/TunaKit-1.23.0.xcframework.zip",
      checksum: "5eb96299a1c7238aa4f75d4332e7e11b3e374028c3272b74d60c2b047fcb8c53"
    )
  ]
)
