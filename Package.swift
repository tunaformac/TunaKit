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
      url: "https://github.com/tunaformac/TunaKit/releases/download/v1.12.0/TunaKit-1.12.0.xcframework.zip",
      checksum: "c2095db2ec1b19c81074864fa0b44420bf94e95d9304954d102e9871e703c6a8"
    )
  ]
)
