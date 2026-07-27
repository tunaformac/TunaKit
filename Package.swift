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
      url: "https://github.com/tunaformac/TunaKit/releases/download/v1.13.0/TunaKit-1.13.0.xcframework.zip",
      checksum: "d69cf1b808e3be89423ed4b6dac22575931e40e3702aca9c7fe6f7d9f4ee454e"
    )
  ]
)
